---
title: "CraftConf: Day 2 Summary"
layout: post
summary: "Craft Conference - Day 2 Summary, April 23-25 2014 @ Budapest, Hungary"
---

## Summary

The **[Craft Conference](http://craft-conf.com/2014/)** was amazing. You should come to this conference next year. Seriously. I was totally blown away by the awesomeness of the **speaker line-up** and the **900** other **attendes** likely thought so. Huge thanks to [Gergely Hodicska](http://twitter.com/felhobacsi), [Medea Baccifava](http://twitter.com/Medea_Baccifava) and [Gábor Vészi](http://twitter.com/veszig) for organzing such a great event!

My favourites from day 2 were:

* [Programming, Only Better by Bodil Stokke](#bodil)
* [The Journey to Mastery by Dan North](#dan)
* [The Better Parts by Doug Crockford](#doug)
* [Maximum potency DevOps by Mitchell Hashimoto](#mitchell)
* [Testing the Hard Stuff by John Hughes](#john).

A really brief summary of all 14 talks I found interesting on day 2 is available here:

## <a name="bodil"></a>Programming, Only Better
### by Bodil Stokke [@bodil](http://twitter.com/bodil)

The keynote by Bodil Stokke started with Turing and Church as titans and huge Pinkie Pie sticker on her laptop so you already knew it's going to be good. We covered silver bullet processes, what causes **complexity** and how functional programming helps but also touched briefly on logic programming.

Read more in [my detailed post about Bodil's talk](/programming-only-better-bodil-stokke) or [watch it here](http://www.ustream.tv/recorded/46774792).

## <a name="dan"></a>The Journey to Mastery
### by Dan North [@tastapod](http://twitter.com/tastapod)

Dan's talks are always great fun. Saw him on a number of occasions and attended his training on Day 1.
This time he explored what is **mastery in the context of software development** and how to get there.
A few good ideas are choosing your **goals deliberately** and **understanding how you** personally **learn**.

**The journey never ends.**

Stay tuned for a more detailed post as I have much more notes on this.

## <a name="mitchell"></a>Maximum Potency DevOps
### by Mitchell Hashimoto [@mitchellh](http://twitter.com/mitchellh)

Mitchell Hashimoto, the creator of [Vagrant](http://www.vagrantup.com/) talked about an **application lifecycle** model true to pretty much all applications:

* **development** (the fun bit where you got to break things)
* **deployment** (first start/configure server, then deploy/run app)
* **maintenance** (keep running and changing)

The goal of **devops** -from the technology perspective- is to make this **lifecycle more efficient**.

Hashicorp offers **free, open-source** devops **tools**. **[Vagrant](http://www.vagrantup.com/)** help setting up consistent development environments. **[Packer](http://www.packer.io/)** optimizes slow parts of setting up a server with building up an image. **[Serf](http://www.serfdom.io/)** is a tool to maintain cluster membership via gossip and **[Consul](http://www.consul.io/)** is a multi-data-center aware service discovery and orchestration solution.

Watch out for my upcoming post with more details or [check out the recording](http://www.ustream.tv/recorded/46631182).

## <a name="doug"></a>The Better Parts
### by Douglas Crockford [crockford.com](http://www.crockford.com/)

Doug needs no introduction. Think JSON and his book about The Good Parts of JavaScript.
**Perfection** is when there's **nothing more to subtract**. Good parts applies to philosophy to **language features**.
Doug **revisits** some of the **good parts** and we also looked at the **better parts in ES6**.

He also talked about [dec64](http://dec64.org/) which is a new decimal and floating point number format which is suited for both business and scientific applications.

Detailed post coming soon and you can also [watch the talk](http://www.ustream.tv/recorded/46640057).

## <a name="john"></a>Testing the Hard Stuff
### by John Hughes [@rjmh](http://twitter.com/rjmh)

John talked about generative testing. He started off by answering why **testing is hard**: **it's never enough**.

Then we saw an impressive demo of **[QuickCheck](http://www.cse.chalmers.se/~rjmh/QuickCheck/manual.html)** which is a **generative testing** framework originally written in Haskell but since then the idea was implemented in **many languages**.

Basically we **generate test cases** based on a model of our system. When a number of cases fail QuickCheck goes on and isolates a **minimal failing example** to help resolving the problems.
This is an extremely powerful idea and especially useful when one is facing with hard to reproduce bugs (e.g race conditions).

**Don't write tests, generate them.**

He also told the story of how he found a number of concurrency issues in [dets](http://www.erlang.org/doc/man/dets.html) (Erlang disk based store) in a matter minutes which otherwise were practically impossible to find and fix.

[See the video here.](http://www.ustream.tv/recorded/46638775)

## Love Flexible Scope
### by Gojko Adzic [@gojkoadzic](http://twitter.com/gojkoadzic)

Next up was Gojko Adzic to talk about how to get the **real benefits from agile with flexible scope**. Of course flexible scope without a bigger picture/vision can be dangerous. (As the builders lof Vasa in 1626 learnt the hard way).

I heard about **second system syndrome** for the first time: using a new, once successfully applied technology for the second time you become overconfident and likely screw it up.

Another idea from Gojko's talk is that **linear plans never work**. Just think of all the **unpredictable dimensions** of **locality, time and human** factors. In most cases you have a linear backlog of stories or a roadmap looking more like a single road. Build **hierarchical backlog** instead. Think like you're building  a GPS which allows you to **replan quickly**.

He also covered the **Palchinsky principles** from Tim Harford's book: Adapt.

* **variation** - plan to learn
* **survivability** - don't kill the company
* **selection** - plan to discard mistakes

Each roadmap should have these properties represented somehow. He also mentioned [impactmapping.org](http://impactmapping.org/) as a great resource.

[Watch his talk here.](http://www.ustream.tv/recorded/46772902)

## Adjusting Your Architecture to Continuous Delivery
### by Rachel Laycock [@rachellaycock](http://twitter.com/rachellaycock)

I hated to miss this as I'm very much into continuous delivery in my current contract. Based on tweets Rachel said that **microservices** mean **more independence** but also require **more coordination** which resonates with Ben Wootton's (my colleague) post in the topic: **[Microservices - not a free lunch](http://highscalability.com/blog/2014/4/8/microservices-not-a-free-lunch.html)**.

[Watch the talk here](http://www.ustream.tv/recorded/46743934)

## Going Reactive
### by Jonas Bonér [@jboner](http://twitter.com/jboner)
It's not every day that you can see the **CTO of [Typesafe](http://typesafe.com/)**. Lots of tweets about this.

I deliberately chose a different presentation in this time-slot as I was afraid it would bit a bit too generic and I already did the [reactive course](https://www.coursera.org/course/reactive) recently and attended [ping-conf](http://www.ping-conf.com/) as well. Will definitely [check out the recording](http://www.ustream.tv/recorded/46625425) though.

## Functional Examples from Category Theory
### by Alissa Pajer [@alissapajer](http://twitter.com/alissapajer)

Some people tweeted this is the best introduction to the topic.

<blockquote class="twitter-tweet" lang="en"><p><a href="https://twitter.com/alissapajer">@alissapajer</a> holds the most clean and straightforward category theory presentation I&#39;ve ever seen. A must have for newcomers. <a href="https://twitter.com/search?q=%23craftconf&amp;src=hash">#craftconf</a></p>&mdash; Attila Szabo (@maugly24) <a href="https://twitter.com/maugly24/statuses/459329626406670336">April 24, 2014</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

Should be great fun. Sad I missed this but will [check out the recording](http://www.ustream.tv/recorded/46744739).

## Distributing RabbitMQ
### Alvaro Videla [@old_sound](http://twitter.com/old_sound)

Alvaro nicely introduced RabbitMQ. I was impressed to learn that it's multi-protocol. Rabbit has a great community plugin ecosystem with plugins like federation across multiple datacenters, sharded queues using consistent hashing and replication with mirrored queues. When I asked he assured me these plugins work well together which I shall see in the coming weeks as we're exploring using Rabbit. Yay.

[Watch the talk](http://www.ustream.tv/recorded/46633817).

## JavaScript Module Server
### by Szabolcs Szabolcsi-Tóth [@_nec](http://twitter.com/_nec)

Szabolcs from ustream talked about their [Javascript module server](https://github.com/ustream/jms) which implements the idea of [negative loading from JSConf EU 2012](https://www.youtube.com/watch?v=mGENRKrdoGY). Learnt about some interesting libraries like pm2 which they use for what I use recluster and mentioned almond.js which is a lightweight require.js. He also mentioned sinopia, a private npm registry. Will play around with that to see if I can replace our current CouchDB plus Kappa setup.

## Conway's Law and You
### by Michael Feathers [@mfeathers](http://twitter.com/mfeathers)

Lots of tweets about this. And come on... it's Michael Feathers. Checking out [the recording](http://www.ustream.tv/recorded/46640252) later.

## Next-Generation Development Platforms and the Open Cloud
### by Andy Piper [@andypiper](http://twitter.com/andypiper)

Andy is from Twitter and there were lots of tweets about his talk. Probably a good one to check out.

## Browser Cryptography
### by Daniel Posch [@dcposch](http://twitter.com/dcposch)
Lots of tweets about this. [Watch it here](http://www.ustream.tv/recorded/46743933)

## Sponsors

There were some sponsor pitches in the morning:

**Ericsson** talked about the demanding low latency challenges of telco and how they're moving to the cloud. **Misys** talked about their own home-brew beer and how they represent fun in the fincance sector. Was interesting to hear Attila Bozso from **EPAM** who mentioned that 10+ years ago when they started startups weren't this sexy and how they went through some amazing growth with the now 20 years old EPAM (used to worked there, great place). Peter Galantha told us about the history of **Yahoo** in Hungary (search for IndexTools :)) and told us to have great fun and enjoy the conference. (worked here too, another cool place) Also learned that **Deutsche Telekom** sells software powering well known brands like LinkedIn or itv.

