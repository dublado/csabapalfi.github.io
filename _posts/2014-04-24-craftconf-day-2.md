---
title: "CraftConf: Day 2 Summary"
highlight: true
---

## Summary

The **[Craft Conference](http://craft-conf.com/2014/)** was amazing. You should come to this conference next year. Seriously. I was totally blown away by the awesomeness of the **speaker line-up** and the **900** other **attendes** likely thought so. Huge thanks to [Gergely Hodicska](http://twitter.com/felhobacsi), [Medea Baccifava](http://twitter.com/Medea_Baccifava) and [Gábor Vészi](http://twitter.com/veszig) for organzing such a great event!

My favourites from day 2 were:

* [The Journey to Mastery by Dan North](#dan)
* [JavaScript - The Better Parts by Doug Crockford](#doug)
* [Maximum potency DevOps by Mitchell Hashimoto](#mitchell)
* [Programming, Only Better by Bodil Stokke](#bodil)
* [Testing the Hard Stuff by John Hughes](#john).

A really brief summary of all 14 talks I found interesting on day 2 is available here:

## <a name="dan"></a>The Journey to Mastery
### by Dan North [@tastapod](http://twitter.com/tastapod)

Dan's talks are always great fun. Saw him on a number of occasions and attended his training on Day 1.
This time he explored what is **mastery in the context of software development**.

**Mastery is capability in a context.** Your performance is your potential minus all the interference and distraction which prevents you from doing your best.

What different types of mastery are there? You can probably expect **constantly flawless performance** from a concert pianist - not many distractions. An ice hockey player's top performance is about **playing his best** but it'll greatly depend on others. A soldier for example has to **adapt instinctively to unfolding events** and the unexpected.

What is mastery for us in software? Let's look at the different stages of **medieval craftmanship and mastery** and what it means to us and get some advice:

You start out as an **apprentice**. **Find people who do what you want to do and model them**, stalk them. Following someone on twitter is like stalking but legal. Admit you don't know stuff but also learn to act like you can (e.g adopt the jargon). Heard of the **impostor syndrome**? **Solve real problems**. Please don't learn to swim with armbands. No trainer wheels. Code katas and stuff are kind of useful but not really. **Study the basics** and learn theory and method but also remember **that brutal adherence to the one true way is harmful**. Always try to **get feedback from people.**

After getting some experience you're a **journeyman**. **Build your portfolio** and try different approaches, domains. It's important to **learn how you learn**, how you practice. Everyone is different. I for example take notes like crazy. Always **listen like you don't know the answer** - you might not. **If it ain't broke - fix it anyway**, surprising things might come out of it. Remember that **you can make computer do anything**: stay motivated.

As a **master** remember where you started and allow learners to discover.

In summary: **choose your goals deliberately** and understand your process of learning. The journey never ends.

At the end of the talk the **two sides of simplicity** also came-up somehow. You have the 'I overlook the details' simple and hard-fought true simplicity divided by the complexity mess between.

## <a name="doug"></a>JavaScript - The Better Parts
### by Douglas Crockford [crockford.com](http://www.crockford.com/)

Doug needs no introduction. Think JSON and his book about The Good Parts of JavaScript.

Perfection is when there's **nothing more to subtract**. Good parts applies to philosophy to **language features**. If you have a useful but dangerous feature and there's a better option you should probably use that. We're not paid to use every feature of the language but to produce error-free code and a good language should teach you to aid that.

Some people are against that sort of restriction. Actually it's **not a matter of opinion**. Brendan Eich himself acknowledges that JavaScript is full of **'foot guns'**. Yes, these are devices which are only good to shoot you in the foot. Some people live the **fantasy of infallability** or the **futility of faultlessness**. Or have you heard of Danger Driven Development. Please spend time to code well.

Doug then talk about some of the **new good parts in ES6**. Finally we'll have proper **tail call optimization**. He touched on the splat (or spread) operator and the module system. The ```class``` statement is probably another bad part. **let** is a really good part which allows **proper scoping**. We then reconsidered some of the good parts. We can get rid of ```for```, ```for in``` and use ```foreach``` and ```Object.keys```. **Proper functional style rocks**. We can probably also stop using ```Object.create``` and ```this```. Proto inheritance saves memory but no longer makes sense and causes confusion (what's own?, what's inherited?) It's also performance inhibiting in V8.

Here's how we're going to write proper modular JavaScript with ES6:

```js
function constructor(spec) {
    let {member} = spec,
        {other} = other_constructor(spec),
        method = function() {
            // member, other, method
        };
        return Object.freeze({
            method,
            other
        });
}
```

In a lot languages you got different number types like byte, int, float, etc. This is the legacy of old times. No-one really cares apart from some crazy high-perf niches. Javascript greatly improves this by having **just one number type**. But it's the wrong type. Doug talked about what **the right number type** would look like. This is **[dec64](http://dec64.org/)**, a new decimal and floating point number format which is suited for both business and scientific applications.

What's the next bug language? Doug doesn't think it's dart or typescript. But it'll surely be dismissed at first like most great ideas. If you think of it a generation had to die out to accept lambdas as a good idea.

You can also [watch the talk here](http://www.ustream.tv/recorded/46640057).

## <a name="mitchell"></a>Maximum Potency DevOps
### by Mitchell Hashimoto [@mitchellh](http://twitter.com/mitchellh)

Mitchell Hashimoto, the creator of [Vagrant](http://www.vagrantup.com/) and founder of Hashicorp talked how he sees the technical side of DevOps.

Pretty much all **application**s have a similar **lifecycle** of getting from development to production:

**Development** is the fun bit where you explore and got to break things. A development environment should be **readily available** as it's key for onboarding new hires, etc. You want a **fast feedback cycle** so you make changes and see them quickly (code, save, reload). **Consistency** is important to avoid 'works on my machine' like situations. A good development environment should also aid **collaboration and sharing**.

**Deployment** is **getting your software somewhere**. That somewhere might be a test/staging environment or production. Two  stages can be separated here: First you need to **start and configure servers**. Then you **deploy and run your app** (get stuff on your server, start it, then make it live e.g by registering with loadbalancer)

**Maintenance** is about **keep running and changing** your application. This is where monitoring comes in (although you probably also watch metrics as you deploy). The key bit here is to **allow updating and changes** with resiliency and without failure. Orchestration also belongs here (e.g. autoscaling, adding nodes to a cluster, etc)

The goal of **DevOps** -from the technology perspective- is to make this **lifecycle more efficient**. **Tools** help with reducing errors, making things faster, increased repeatabilty and codifying knowledge. But there are loads of them and their purpose is often ambiguous. The above lifecycle model helps a bit in putting these tools in the right place in your head.

Hashicorp offers **free, open-source** devops **tools**:

* **[Vagrant](http://www.vagrantup.com/)** help setting up consistent development environments. 1.6 support docker container which I'll definitely check out.
* **[Packer](http://www.packer.io/)** optimizes slow parts of setting up a server with building up an image. This is what I use to build our base AMI.
* **[Serf](http://www.serfdom.io/)** is a tool to maintain cluster membership via gossip. It also support simple shell based custom events. Sending heartbeats when your clusters get large doesn't scale hence the use of gossip. Was funny when Mitchell compared gossip to how the news of a zombie apocalypse would spread.
* **[Consul](http://www.consul.io/)** is a **multi-data-center aware** service discovery and orchestration solution built on top of Serf. Has a DNS and HTTP interface. Also incorporates healthchecks and a key value store. Really excited about this one.

[Check out the recording](http://www.ustream.tv/recorded/46631182).

## <a name="bodil"></a>Programming, Only Better
### by Bodil Stokke [@bodil](http://twitter.com/bodil)

It all started with Turing and Church as titans and huge Pinkie Pie photos so you already knew it's going to be good. :)

Few Dijsktra quotes later we explored how people think of **processes** as silver bullets but the reality is that they tend to work for some people but not others. There's no truth out there. Find your answers but don't assume they're answers for others.

Then came what processes can't solve: **complexity**. She mentioned the [Out of the tar pit](http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.93.8928&rep=rep1&type=pdf) paper. **State** hinders testing and makes informal reasoning harder. Uderstanding **control flow** gets really difficult when you add concurrency. A lot of people underestimate the nonlinear growth of complexity by **code volume**.

[Watch it here](http://www.ustream.tv/recorded/46774792).

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

Alvaro nicely introduced [RabbitMQ](https://www.rabbitmq.com/). I was impressed to learn that it's multi-protocol. Rabbit has a great community plugin ecosystem with plugins like federation across multiple datacenters, sharded queues using consistent hashing and replication with mirrored queues. When I asked he assured me these plugins work well together which I shall see in the coming weeks as we're exploring using Rabbit. Yay.

He showed off the [Rabbit MQ Simulator](http://tryrabbitmq.com/) and I also found [Queues.io](http://queues.io/).

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
