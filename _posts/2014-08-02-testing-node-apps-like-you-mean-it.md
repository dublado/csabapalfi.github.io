---
title: "Testing Node.js apps like you mean it"
layout: post
summary: "Testing Node.js apps like you mean it"
---

I'm now working mostly with Node.js and really happy with the development setup we have. In this post I tried to collect how we do some of our testing.

## instant test feedback

... with ```nodemon``` and ```growl```

You surely came across [nodemon](http://nodemon.io/). It watches your project files and restarts your server. We also use it to watch and continuously run our tests during development (as a replacement to the not so reliable ```mocha --watch```). You can override the nodemon defaults so that it watches more filetypes. (```-e js,json,handlebars```)

Now you have your test running but you have to keep switching to your terminal to see if they pass. Mocha has [Growl integration](https://github.com/visionmedia/node-growl#installation) to help with that. (```--growl```)

Assuming you have nodemon and mocha+Growl setup and your tests are in the ```test``` directory this command keeps running your tests and notifies you if they pass or fail:

```
nodemon -e js,json,handlebars node_modules/mocha/bin/mocha test/ --recursive --growl --reporter spec
```

You can press save in your editor and expect a Growl notification to tell you the results.

## keeping your tests clean

... with ```unroll```

It's fairly common to run the same tests with different parameters (e.g. you have Scenario Outlines for Cucumber). You can use the brilliant [unroll](https://github.com/lawrencec/Unroll) module to achieve similar things with Node test frameworks. Just replace a mocha ``it()`` with unroll like below. It'll produce nicely formatted test description, too.

```js
  unroll('#a plus #b is #c',
    function(done, testArgs) {
      expect(
        testArgs.a + testArgs.b
      ).to.be.equal(testArgs.c);
      done();
    },
    [
      ['a', 'b', 'c'],
      [ 3,   5,   8 ],
      [ 7,   0,   7 ]
    ]
  );
```

## easy acceptance testing

... with ```nock``` and ```cheerio```

Our current stack consists of small Node.js microservices. Most of them just talk to other services via HTTP and either return JSON or render HTML. In our acceptance tests we want to test an entire microservice but mocking their dependencies and asserting on the response they produce.

[Nock](https://github.com/pgte/nock) overrides Node's ```http.request``` function and allows you to control what's going to be the reply to HTTP requests made by your app.

Let's see a simple example:

```js
// From now on all requests to example.com/test are mocked
nock('http://www.example.com')
    .get('/test')
    .reply(200);
```

It also allows you to control the response body and has a brilliant [recording](https://github.com/pgte/nock#recording) feature as well.

Now that we're in control of our dependencies we can just run and hit our app with [supertest](https://github.com/visionmedia/supertest) and assert on it's response which is really easy if that's JSON.

[Cheerio](https://github.com/cheeriojs/cheerio) comes handy when we have to assert on an HTML response. Cheerio is a fast implementation of JQuery core for the server.

```js
$ = cheerio.load(htmlResponse);
expect(
  $('h2.title').text()
).to.be('Hi there!');
```

And we're now testing a complete service in isolation from interaction with dependencies to template rendering. Of course this doesn't replace functional testing with WebDriver but certainly can make functional test simpler and let them focus on the right things.

## simple builds

... with ```Makefile```s

We decided to simply use ```make``` on this project which is a good fit for our simple builds for microservices. Also see this post about why [you don't need another build tool](http://hadihariri.com/2014/04/21/build-make-no-more/). Our ```Makefile```s can run tests, lint our code, build and push docker images, our even deploy with Ansible.

See a short (simplified) snippet below:

```Makefile
lint:
    node_modules/.bin/jshint -c .jshintrc .

unit-test:
    node_modules/.bin/mocha --reporter spec ./test/unit/*.js
```

## and more

I didn't say a lot about how we unit test and how we use rewire, sinon, etc but I found above a bit more interesting for now. Example project on github coming soon(ish ?).

Thanks to the great team at TSL and especially [Matt Tortolani](https://twitter.com/doodlemoonch) who showed me some -if not most- of these npm modules.
