--- 
title: "Ping Conference about the Play! framework - Day 2"
layout: post
summary: "Ping Conference about the Play! framework - Day 2, January 16-17 2014 @ Budapest, Hungary" 
---

I attended the [Ping conference](http://www.ping-conf.com/) about the [Play! framework](http://www.playframework.com/) in Budapest this week and this is my post about the second day. Be warned I'm fairly new to Play!.

You can find my [post about day 1 here](/ping-conf-day-1/).

## Building composable, streaming, testable Play apps at Linkedin

Day 2 started with a **live coding** presentation from Yevgeniy (Jim) Brikman ([@brikis98](https://twitter.com/brikis98), Linkedin). Many people tweeted this was their favourite talk of all and I also think it was the second keynote for a reason. :)

LinkedIn uses Play! heavily and he presented how they deal with the **high complexity and demanding performance** requirements of their site with **abstraction and composition**. Basically Jim built a **[facebook BigPipe](https://www.facebook.com/note.php?note_id=389414033919)** like solution in front of the audience demonstrating how capable Play! is.

The rough idea is that we can **stream chunks of HTML** (even out-of-order) as soon as our templates can be rendered (e.g. backend service response comes back) and our webapp can send **response chunks as soon as possible** and slower backend service responses have less effect on the user experience. Jim walked us through the steps talking about caveats and drawbacks as well.

His [slides](http://www.slideshare.net/brikis98/composable-and-streamable-play-apps) are probably the best place to start and I recommend you watching the talk as well.

A useful tip Jim shared when testing/debugging webapps **streaming HTML** with **curl** is to use the **-N (--no-buffer)** option. That forces curl to output data immediately (exactly when it arrives). The default behaviour is bufferring and outputting when it has a bigger chunk.

The code is also up on [github](https://github.com/brikis98/ping-play) and it's definitely worth checking out.

## Play is for performance

Next up was James Roper ([@jroper](https://twitter.com/jroper), Play! Tech Lead at TypeSafe) to talk about optimizing the performance of your Play! application. First he made clear what he is going to address as performance can be measured and understood in soo many different context. His talk focused on mostly static or high cache hit or proxy/gateway style apps (delegating to webservices) or Akka clusters and how to optimize their performance.

James went on to talk about **async vs. sync** and busted one of the top misconceptions about async always being faster. **Async is actually slower** in most cases because of **context switches **(even if not necessarily a CPU context switch as well). So when do we tipically have context switches in Play? One example is doing a map on a Future. But still **async is more scalable** because it's more resource efficient and more gives control over resources. It also provides better ways to increase or limit the number of things done at the same time.

Then he showed us some **live perfomance testing within his presention slides**. Oh, did I mention his slides were written and presented using Play? A few live performance tests later he showed us how blocking without taking extra care will make your app suffer. **Don't block** but when you really have to remember a few things:

* **wrapping your blocking code in a future won't make it async**
* **configure a dispatcher per type of operation** (akka has a built-in one) to prevent your blocking code affecting the rest of your app

We had a quick look at how to **pre-render** our **templates** which don't change runtime or how to cache them easily if they only depend on a small number of variables (e.g. language)

Another performance issus is **large routes files** which might become a **problem** in the future. Actually Play! has to try matching all the regexes in the routes file everytime a request comes in until it finds a matching. Imagine a route at the bottom of a large routes file. It could be made faster by matching common prefixes first but it's not yet in the framework. Any volunteers? Pull requests are welcome! (Actually no-one complained about this problem yet)

Another problem which didn't turn out to be such a big one is how the CSRF filter works. Since streams can only be consumed once the **CSRF filter** has to **buffer the request body** to parse the CSRF token. One way to work around this is to simply configure the CSRF token to be sent as a query param. Alternatively a standalone CSRFCheck action can also be implemented.

If you only remember 3 things from James's talk:

* **understand threads and execution contexts**
* **manage blocking**
* some things you think are faster are not always faster, test it


## Scalaz-streams

Then we went on a journey to the sci-fi like future with scalaz-streams. The expedition was led by Pascal Voitot ([@mandubian](https://twitter.com/mandubian) and Julien Tourney ([@skaalf](https://twitter.com/skaalf)).

They presented how the **Process[I,O] abstraction** fits the problem of serving HTTP requests better and how the Play! framework could be rebuilt using pipelines. 

Q&A brought up the interesting topic of **handling backpressure**. Backpressure occurs when the **consumer** of streaming data is a lot **slower** than the producer. Depending on our use-case we either **buffer or drop** the data our consumer can't catch up with.

I have to admit I was too busy listening an don't have good notes for this talk. I'll have to read up on the topic anyways and potentially compare iteratees and scalaz-streams.

**Update**: No need to write a post myself as I discovered **[Pascal's post](http://mandubian.com/2013/08/21/playztream/)** which describes the idea way better than I could.



## Making the case for Play at BBC

The next talk was also a great one with not many technical details but much more **insights into culture** and **selling a new technology in a big organization**. We heard Adam Evans ([@ajevans85](https://twitter.com/ajevans85)) and Asher Glynn ([@asherglynn](https://twitter.com/asherglynn)) from the BBC talking about their adoption of Play! and Scala at CBeeBees the BBC site for small children. 

They did a 2 week spike first with only 2 people based on which management was more convinced. Moving forward all stakeholders were really pleased and still love how quickly the CBeeBees team turns things around. Adam also mentioned the difficulties around **hiring Scala people** and how they converted PHP and Java devs to Play!. Frontend devs picked up Scala templates quickly.

It resonated with my feeling about the **Cake pattern** that they ended up choosing **Guice** to wire their components together. Adam said that **Guice is simpler**, results in **less boilerplate**, allows **runtime config changes** and easier for Java devs.

Adam gave an interesting perspective on deployments as well and how they overengineered first with Varnish+Nginx+mod_pagespeed and moved to **simply Play instances fronted with an Amazon ELB**. Asher joined in and highlighted this as good reason for architects to stay away at times :)

## Play! at the Guardian

Then we heard from Grant Klopper ([@grantklopper](https://twitter.com/grantklopper)) of Guardian about their use of Play! which powers their new responsive site. Even though not all the pages are served by the new stuff yet it already gets all their prod traffic in the background if I got that right.

They also deploy to AWS as Grant actually did a **production deployment** of [this change](https://github.com/guardian/frontend/pull/2759) **during his talk**. (Shortly followed by a deployment by the Kinja guys to their production)

One of my favourite moment of his talk when he shared the golden rule of caching:

<blockquote class="twitter-tweet" lang="en"><p>Golden rule for cache TTLs: evicted before someone gets to your desk to complain about the cached data <a href="https://twitter.com/search?q=%23pingconf&amp;src=hash">#pingconf</a></p>&mdash; Csaba Palfi (@csabapalfi) <a href="https://twitter.com/csabapalfi/statuses/424186217156997120">January 17, 2014</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

## Modularizing Play! applications

Then Tobias Neef ([@tobnee](https://twitter.com/tobnee), InnoQ) took the stage and talked about modularizing behavioral and structural aspects of Play! apps.

Based on his experience with a number of big Play! projects he highlighted areas where we can adhere more to the [DRY principle](http://en.wikipedia.org/wiki/Don't_repeat_yourself) and make things easier to maintain. He mentioned that **Filters tend to be underused** in Play! projects and can be utilized better. It was interesting to hear that it might be in relation with having this in the advanced section of the docs.

## Async: Reacting instead of waiting for better times

Johan Andrén ([apnylle](https://twitter.com/apnylle), Mejsla) provided a great review of why async and reactive is important. He first asked us to stand up and give ourselves a high five since we all made it to this great conference :).

His code for the talk is also on [github](https://github.com/johanandren/ping-conf-scala). Actually he was to only speaker who presented Java code as well (and it's on [github](https://github.com/johanandren/ping-conf-scala) too) which I think is a really great thing and a good way to get more people involved!

How he presented Iteratees defenitely confirmed some of my assumptions and contributed to my understanding.

Johan also mentioned the **[reactive course](https://class.coursera.org/reactive-001)** when asking who knows about Akka from there which I took as well. :)

## Final thoughts

Ping was a great conference! 

Big thanks to Gawker Media, Peter Hausel([@pk11](https://twitter.com/pk11)) and the whole Kinja team! 

**Same place next year?** :)








