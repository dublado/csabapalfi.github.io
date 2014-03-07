--- 
title: "Acceptance testing a Dropwizard app with Cucumber"
layout: post
summary: "Acceptance testing a Dropwizard app with Cucumber" 
---

**[Dropwizard](http://www.dropwizard.io/)** is a 'damn **simple** library for building production-ready **RESTful** web services'. It's an opininated selection of a number of **lightweight** Java libraries and wonderful for building **microservices**. The [ThoughtWorks Tech Radar](http://www.thoughtworks.com/radar) now also [has it in it's adopt circle](http://www.thoughtworks.com/radar/#/languages-and-frameworks/519).

I'm also a big fan of **BDD** and love **[Cucumber](http://cukes.info/)** and it's [version on the JVM](https://github.com/cucumber/cucumber-jvm). It's **not just a test framework** but more of a **[collaboration tool](https://cucumber.pro/blog/2014/03/03/the-worlds-most-misunderstood-collaboration-tool.html)**. That's one of the reasons why I much prefer it to just writing acceptance tests with JUnit.

Dropwizard provides some great [testing tools](http://www.dropwizard.io/manual/testing/). It comes with a nice [JUnit Rule](https://github.com/junit-team/junit/wiki/Rules) named [DropwizardAppRule](https://github.com/dropwizard/dropwizard/blob/master/dropwizard-testing/src/main/java/io/dropwizard/testing/junit/DropwizardAppRule.java) (previously DropwizardServiceRule). If you write your [acceptance tests with JUnit](http://www.tomakehurst.com/all-in-one-test-environments-with-junit/) you can start/stop your app with the provided rule. You can mock your REST dependencies with [WireMock](http://wiremock.org/) which also has a [JUnit rule](http://wiremock.org/getting-started.html#junit-4-x). What if you want the something similar but with Cucumber?

### No Cucumber global hooks

The first problem is that Cucumber-JVM and Cucumber has **no support** for hooking in a setup/teardown step **before/after all your feature files** are ran. It currently only supports @Before/@After hooks which run the annotated methods before/after each scenario. The workaround for this is described in detail in [cucumber-jvm#515](https://github.com/cucumber/cucumber-jvm/issues/515) and involves adding a static field to your StepDefs class and adding [shutdownHook](http://docs.oracle.com/javase/7/docs/api/java/lang/Runtime.html#addShutdownHook(java.lang.Thread)). 

Based on [cucumber-jvm#672](https://github.com/cucumber/cucumber-jvm/issues/672) and [cucumber-jvm#678](https://github.com/cucumber/cucumber-jvm/issues/678) we're getting **@BeforeAll** and **@AfterAll** hooks in an upcoming release.

### DropwizardAppRule is JUnit only

The second issue is that DropwizardAppRule is tied to JUnit and **doesn't expose it's start/stop methods**. Even if you run your Cucumber tests with JUnit you need functionality (port, environment, etc) from this rule in your StepDefs class so it's not likely to help.

I'm generalizing DropWizardAppRule in [dropwizard#488](https://github.com/dropwizard/dropwizard/issues/488) to enable support for test frameworks other than JUnit and Scala support as well. Whatch the issue if you're interested but it's going to be merged sometime after 0.7.0.

### Solution for now

In the meantime you can **create your own [DropwizardTestSupport](https://gist.github.com/csabapalfi/9393015#file-dropwizardtestsupport-java)** class and have to **use [the hack instead of @BeforeAll](https://gist.github.com/csabapalfi/9393015#file-examplestepdefs-java)**.

You should end up with something like this in your StepDefs class:

```java
private static DropwizardTestSupport<ExampleConfiguration> service;

@Before
public void setUp() throws Exception {
    if(service==null){
        service = new DropwizardTestSupport(ExampleService.class,
                Resources.getResource("test.yml").getPath());
        service.startIfRequired();
        //Hack until @BeforAll is properly supported by Cucumber-JVM
        Runtime.getRuntime().addShutdownHook(new Thread(){
            @Override
            public void run() {
                service.stop();
            }
        });
    }
}
```

This worked for me perfectly fine.





