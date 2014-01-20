--- 
title: "Ping Conference about the Play! framework - Day 1"
layout: post
summary: "Ping Conference about the Play! framework - Day 1, January 16-17 2014 @ Budapest, Hungary" 
---

I attended the [Ping conference](http://www.ping-conf.com/) about the [Play! framework](http://www.playframework.com/) in Budapest this week and it was great to see all the buzz.

You can find my [post about day 2 here](/ping-conf-day-2/). All videos are available [here](http://www.ping-conf.com/).

Given it's a visit to my home country and had some family arrangements I had to leave before the closing party so while others were having their free drinks in [Kocka](https://www.facebook.com/kocka.kazinczy48) I wrote this blog post on the train to home. Enjoy!

## It's all about democratizing functional programming for web programmers

Day 1 keynote was presented by Sadek Drobi ([@sadache](https://twitter.com/Sadache), Play co-creator).

If you don't know Play then just imagine it as a framework bringing the **simplicity, web-friendliness and productivity** of Django, Rails, etc to **the JVM** and improves on them.

Sadek made a great case for functional programming. **Functions are the ultimate abstraction.** They're simple, truthful and composable. Functional programming rocks!

I really liked how he called out that the more optimal multicore performance is really just the icing on the cake and not the key benefit here.

**Functions relax algorithm complexity** by allowing a higher level of **composability.**
Composability aids data manipulation/parsing, handling streams in great ways.
**Compositon rocks!**

He also talked about the one of the key abstractions in Play! called **[Iteratee](http://www.playframework.com/documentation/latest/Iteratees)**. Iteratee is really just a fancy fold :) but I think it's worth its own post. When I asked Sadek also pointed out that processing data streams is a fastly moving area now and there are a lot of abstractions for different use-cases ([rx-scala](https://github.com/Netflix/RxJava/tree/master/language-adaptors/rxjava-scala),[scala-z streams](https://github.com/scalaz/scalaz-stream)).

During Q/A it also came up that **Play is moving from [Netty](http://netty.io/) to [Spray](http://spray.io/)** (recently acquired by TypeSafe). It should be perfectly transparent for all framework users but will result in a pure Scala I/O code for Play! (Netty is in Java).

Update: Just found this **[post by Sadek on the LinkednIn Engineering blog](http://engineering.linkedin.com/play/play-framework-democratizing-functional-programming-modern-web-programmers)** which is basically about the very same topic.

## Akka vs. JSON/HTTP

Straight after the keynote Matt Hammer ([@mtholgy](https://twitter.com/mthology), Gawker Media) talked about replacing JSON+HTTP with **Akka** to get a **more efficient remoting stack**. 

They use this in [Kinja](http://kinja.com/) and they're experimenting with this between their frontend and their API.

I could also learn that **Akka supports custom serializers** which are completely transparent to actors. He implemented a [Google protobuf](https://code.google.com/p/protobuf/) serializers for their use case.

## Sbt-web and easier JS development for Play

Next up was Chris Hunt ([@huntchr](https://twitter.com/huntchr), TypeSafe) presenting the -so fresh it's hot- [sbt-web](https://github.com/typesafehub/sbt-web) and friends. 

It was news for me that from the TypeSafe perspective Play is based in Australia and New Zealand as both Chris and Josh Roper are based there. Thankfully for us they gave up the nice weather and came to give some great talks. Thanks guys! 

Chris mentionted the **[reactive manifesto](http://www.reactivemanifesto.org/)** and it was great to see that they live up to it even in sbt plugins.

sbt-web's goal is to **improve working with JavaScript and CSS** in Play! and have a great **web asset pipeline** (a'la Rails).

When it comes to dependency resolution/repository support the choice is **[webjars.org](http://www.webjars.org/)**. The reason behind is the popularity of Maven artifact repositories and existing support, infrastructure and tooling. Alternatives would be [node.js's npm](https://npmjs.org/) or [Twitter's bower](http://bower.io/). npm's naive transitive dependency resolution with creating node_modules directories recursively makes it less than optimal to remain polite here. Chris couldn't comment on bower but to be honest I'm not too familiar with it either.

Then we moved on to hear about testing and hinting JavaScript. When it comes to testing you're probably dealing with two types of js code: it either relies on the DOM or not. 

To test Javascript which is **relying on the DOM** you need something like [webdriver](http://docs.seleniumhq.org/projects/webdriver/) which will run your code in Firefox, Chrome, IE or HtmlUnit (Rhino on top of JVM) or with phantom.js (native). The TypeSafe guys basically implemented an alternative **[webdriver client](https://github.com/huntc/webdriver) in Scala** with Akka and Spray.

To test/run **Javascript where the browser is not involved** you can use [js-engine](https://github.com/huntc/js-engine) which allows you to **run JavaScript on different backends**. The important bit is that they started out with a Rhino based solution which turned out to be slower than running your tests/jshint with Grunt using native js. Chris suggests that you're probably fine to start with the Rhino based engine and switch to native js when performance becomes a concern.

The example Chris was using is running [JSHint](http://jshint.com/) on your JavaScript sources. They implemented a **[JSHint sbt plugin](https://github.com/typesafehub/sbt-jshint-plugin)** which can be used with Play! and the coolest thing is that you can use the same compilation error reporting as you would use for Scala and see **JsHint errors in your browser**!

During Q&A someone asked Chris about languages compiled to JavaScript and I could't agree with him more: **idiomatic JS rocks**. Use Javascript directly if you can and you'll probably be fine.

## The cake pattern step-by-step

Then we had a talk from Yann Simon ([@simon_yann](https://twitter.com/simon_yann)) who introduced to cake pattern with a step by step code example. 

I could be wrong here but at the end of the day the cake pattern is all about **replacing dependency injection frameworks** since the Scala compiler allows us to define dependencies between our components and actually happily checks them as well. 

**No runtime surprises.** At least in this area...

I have to admit at times the Cake pattern felt it a bit comparable to C++ template meta-programming and raping the compiler but it really isn't that bad. It's a great alternative to DI and it was great that Yann pointed out the disadvantages as well every step along the way and made it clear how far it's worth going in various cases.

That's another thing I liked a lot about ping! Most speakers were really **open about the disadvantages/drawbacks** of the solutions presented. Maybe it's like that with the entire Scala community which I'm getting more familiar with and it's a really valuable trait. (pun intended)

He also talked about a blog post from Andreas Grabner ([@grabnerandi](https://twitter.com/grabnerandi), Compuware) about [The Hidden Class Loading Performance Impact of the Spring Framework](http://apmblog.compuware.com/2013/12/18/the-hidden-class-loading-performance-impact-of-the-spring-framework/).

A line of code worths more than a thousand words so please check out the brilliant **code example by Yann** on [github](https://github.com/yanns/TPA/). 

**Update:** Yann reacted on my post on Twitter:

<blockquote class="twitter-tweet" lang="en"><p><a href="https://twitter.com/csabapalfi">@csabapalfi</a> IMHO cake pattern is not only about DI but first about designing reusable components.</p>&mdash; Yann Simon (@simon_yann) <a href="https://twitter.com/simon_yann/statuses/424480163163017216">January 18, 2014</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

Another thing I missed before I think is how nicely Yann introduced and talked about the [Test Pyramid](http://martinfowler.com/bliki/TestPyramid.html) and how the cake pattern aids component testing.

## to be continued...

* New validation API in Play2

* Scala.js and ReactJS

* Play2 and Redis







