---
title: "CraftConf: Day 2 Summary"
layout: post
summary: "Craft Conference - Day 2 Summary, April 23-25 2014 @ Budapest, Hungary"
---

## Summary

The [Craft Conference](http://craft-conf.com/2014/) was amazing. You should come to this conference next year. Seriously. I was totally blown away by the awesomeness of the speaker line-up and the 900 other attendes likely thought so. (Full disclosure: I'm Hungarian so it has extra benefits to come home :)

I'll keep adding posts based on my notes as well and link them here.

Let's see my favourite talks from day 2!

## Programming, only better
### by Bodil Stokke

The keynote by Bodil Stokke started with Turing and Church as titans and huge Pinkie Pie sticker on her laptop so you already knew it's going to be good. We covered silver bullet processes, what causes complexity and explored a bit of logic programming as well.

Check out [my post about Bodil's talk](/programming-only-better-bodil-stokke).

## Maximum Potency DevOps
### by Mitchell Hashimoto

Mitchell Hashimoto, the creator of Vagrant talked about an application lifecycle model true to pretty much all applications:

* development (the fun bit where you got to break things)
* deployment (first start/configure server, then deploy/run app)
* maintenance (keep running and changing)

The goal of devops -from the technology perspective- is to make this lifecycle more efficient.

Hashicorp offers open-source devops tools. Vagrant help setting up consistent development environments. Packer optimizes slow parts of setting up a server with building up an image. Serf is a tool to maintain cluster membership via gossip and Consul is a multi-data-center aware service discovery and orchestration solution.

Watch out for my upcoming post with more details.

## The journey to mastery
### by Dan North

Dan's talks are always great fun. Saw him on a number of occasions and attended his training on Day 1.
This time he explored how

## The Better Parts
### by Douglas Crockford

Separate post coming soon.


## Love Flexible Scope
### by Gojko Adzic

Next up was Gojko Adzic to talk about how to get real benefits from agile with felxible scope. We heard of medieval cloud deployment with cannons. Vasa  1626, flex scope without a big picture/vision is dangerous.

Linear plans never work.

second system syndrome - new tech, second system overconfident

Unpredictable dimensions: local, time, human

palchinsky principles:
variation - plan to learn
survivability - don't kill the company
selection - plan to discard mistakes
roadmap should have these

story narrative: just the delegation of detail, should be about behaviour change. survivable experiment

roadmap vs road

GPS for sw - replan quickly

1. divergent - create option
2. convergent - make choices

book Systems thinking in human resources

story about behaviour changes

impact-mapping.org

linear vs hierarchical blog

Tim Harford's book: Adapt.


## Testing the Hard Stuff
### by John Hughes

John talked about generative testing. He started off by answering why **testing is hard**: **it's never enough**.
Then we went on to see an impressive demo of quickcheck which is a generative testing framework originally written in Haskell but since then the idea was implemented in many languages. Basically we generate test cases based on a model of our system. When a number of cases fail quickcheck goes on and isolates a minimal failing example to help resolving the problems.
This is an extremely powerful idea and especially useful when one is facing with hard to reproduce bugs (e.g race conditions).
**Don't write tests, generate them. **
He also told the story of how he found a number of concurrency issues in dets in a matter mintues which others failed to fix over a year.

## Adjusting your architecture to continuous delivery
### by Rachel Laycock

I hated to miss this as I'm very much into continuous delivery in my current contract. Based on tweets Rachel said that microservices mean more independence but also require more coordination which resonates with Ben Wootton's (my colleague) post in the topic: [Microservices - not a free lunch](http://highscalability.com/blog/2014/4/8/microservices-not-a-free-lunch.html).

## Going Reactive
### by Jonas Bonér
It's not every day that you can see the CTO of [Typesafe](http://typesafe.com/). Lots of tweets about this.

I deliberately chose a different presentation in this time-slot as I was afraid it would bit a bit too generic and I already did the [reactive course](https://www.coursera.org/course/reactive) recently and attended [ping-conf](http://www.ping-conf.com/) as well. Will definitely check out the recording though.

### Functional Examples from Category Theory by Alissa Pajer

<blockquote class="twitter-tweet" lang="en"><p><a href="https://twitter.com/alissapajer">@alissapajer</a> holds the most clean and straightforward category theory presentation I&#39;ve ever seen. A must have for newcomers. <a href="https://twitter.com/search?q=%23craftconf&amp;src=hash">#craftconf</a></p>&mdash; Attila Szabo (@maugly24) <a href="https://twitter.com/maugly24/statuses/459329626406670336">April 24, 2014</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

Should be great fun. Sad I missed this but will check out the recording.

## Distributing RabbitMQ
### Alvaro Videla

Alvaro nicely introduced RabbitMQ. I was impressed to learn that it's multi-protocol. Rabbit has a great community plugin ecosystem with plugins like federation across multiple datacenters, sharded queues using consistent hashing and replication with mirrored queues. When I asked he assured me these plugins work well together which I shall see in the coming weeks as we're exploring using Rabbit. Yay.

## JavaScript Module Server
### by Szabolcs Szabolcsi-Tóth

Szabolcs from ustream talked about their [Javascript module server](https://github.com/ustream/jms) which implements the idea of [negative loading from JSConf EU 2012](https://www.youtube.com/watch?v=mGENRKrdoGY). Learnt about some interesting libraries like pm2 which they use for what I use recluster and mentioned almond.js which is a lightweight require.js. He also mentioned sinopia, a private npm registry. Will play around with that to see if I can replace our current CouchDB plus Kappa setup.

## Conway's Law and You
### by Michael Feathers

Lots of tweets about this. And come on... it's Michael Feathers. Checking out the recording later.

## Next-Generation Development Platforms and the open cloud
### by Andy Piper

Andy is from Twitter and there were lots of tweets about his talk. Probably a good one to check out.

## Browser Cryptography
### by Daniel Posch
Lots of tweets about this.
