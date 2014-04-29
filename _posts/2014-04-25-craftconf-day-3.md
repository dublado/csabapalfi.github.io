---
title: "CraftConf: Day 3 Summary"
layout: post
summary: "Craft Conference - Day 3 Summary, April 23-25 2014 @ Budapest, Hungary"
---

## Summary

I attended the **[Craft Conference](http://craft-conf.com/2014/)** in Budapest. On Day 1 I had a brilliant workshop with Dan North ([@tastapod](http://twitter.com/tastapod)). I summarized [day 2 in a post](/craftconf-day-2) and here comes day 3.

My favourites from day 3 were:

* [Responsibly maximizing craftsmanship by Theo Schlossnagle](#theo)
* [The Raft consensus protocol by Diego Ongaro](#diego)
* [Distributed Systems in Production by Jeff Hodges](#jeff)
* [CI for Infrastructure by Gareth Rushgrove](#gareth)
* [Delivering Continuous Delivery Continuously by Simon Hildrew](#simon)

A summary of all 12 talks I found interesting on day 3 is available here:

## <a name="theo"></a>Responsibly maximizing craftsmanship
### by Theo Schlossnagle [@postwait](http://twitter.com/postwait)

Theo started strong by saying that all **software sucks** because of all the complexity and all the layers of abstractions and turtles all the way down. :) [Watch his talk here](http://www.ustream.tv/recorded/46744760). Why is it all so difficult? **Specifications** are hard and there is constant **change** happening not to mention how some people consider **laziness as a virtue**. Let's consider few helpful rules:

##### 1. Monoliths are likely to fail
The complexity grows **non-linearly** with code size and component size.

##### 2. Diversity is an emergent property of scale
Trying to insist on lack of diversity or commoditize? You're going to have a bad time. Diversity is there anyways.

##### 3. Engineers function better when autonomous

Ok, so we, engineers are weird folk. But we have to **learn hitting deadlines**, **do paper search** and **balance** as our professions demands it. We need **autonomy on the approach** we take but not on the purpose.

##### 4. You shall be judged by your APIs, be terse

APIs are the social contracts of engineering. They set expectations so you better **minimize the surface** of them. It also doesn't hurt if your **components are right sized**. Hard shell, soft core. Well defined APIs also allow you to **rewrite instead of refactoring**. **Don't rewrite APIs but deprecate them**. To be clear, **SQL is not an API**, it's a language with a real big surface area.

Theo then told us how they built their custom data store for Circonus as they found Cassandra or Riak trying to be too generic resulting in painpoints. He also shared a story of how they built fq -in C, as god intended- to fix some RabbitMQ scalability issues. Theo did another talk about [A Career in Web Operations](http://www.ustream.tv/recorded/46637340) instead of Michael Nygard who couldn't make it. I'll check that out later.

## <a name="diego"></a>The Raft consensus protocol
### by Diego Ongaro [@ongardie](http://twitter.com/ongardie)

Coming soon...

## <a name="jeff"></a>Distributed Systems in Production
### by Jeff Hodges [@jmhodges](https://twitter.com/jmhodges)

Coming soon...

## <a name="gareth"></a>CI for Infrastructure
### by Gareth Rushgrove [@garethr](https://twitter.com/garethr)

Coming soon...

## <a name="simon"></a>Delivering Continuous Delivery Continuously
### by Simon Hildrew [@sihil](https://twitter.com/sihil)

Coming soon...

## Mobile HTML5
### by Tomomi Imura [@girlie_mac](https://twitter.com/girlie_mac)

Coming soon...

## No general purpose database
### by Dominic Tarr [@dominictarr](https://twitter.com/dominictarr)

Coming soon...

## MCDonalds, Six sigma and outsourcing
### by Chad Fowler [@chadfowler](https://twitter.com/chadfowler)

First we learned how Chad got from music to programming via Doom. Then he went on to get some inspiration from fairly unusual sources like McDonalds or Six Sigma. [Watch it here](http://www.ustream.tv/recorded/46744747).

**[Zen and Art of Motorcycle Maintenance](http://www.amazon.co.uk/Zen-Art-Motorcycle-Maintenance-Inquiry/dp/0060589469)** is a great read and gives some new perspectives quality. Quality is undefined. For something **commoditized** the only thing which matters is **function** and that is **objective**. For something **artistic** the **form** matters maybe even more and quality is obviously **subjective**. A craft is somewhere between the two.

**Six sigma** tells us that internal quality does not matter. **External quality measured from the customers perspective** is the only important thing. Can't see, don't care. **Internal quality of software is difficult to measure** even though it still matter to us. Do you really think that coverage and other metrics have anything to do with real quality? Think again. The really curious might also want to look at some of the six sigma methods like DMADV and QFD but I'm not into it, really.

**[The E-myth revisited](http://www.amazon.co.uk/myth-Revisited-Small-Businesses-About/dp/0887307280)** is a good book with a bad title. Actually E stands for entrepeneurship. As developers we have to understand and **work on the business**. Can you make a better burger than McDonalds? Can you sell it better?

When it comes to outsourcing lot of people has mixed feelings but **automation** and **outsourcing** might actually have a lot in common. **Make the fuzzy concrete** and **decompose responsibilities** then **automate or outsource**. Chad also mentioned the book titled [4 hour workweek](http://fourhourworkweek.com/) and how you can actually outsource some unusual things in your life like booking appoitments or even finding a nice pair of shoes based on a photo. I also learned what Amazon Mechanical Turk was named [after](http://en.wikipedia.org/wiki/The_Turk).

## SOLID Foundations
### by Steve Freeman [@sf105](https://twitter.com/sf105)
### and Nat Pryce [@natpryce](https://twitter.com/natpryce)

## Graph Search with Neo4j
### by Ian Robinson [@iansrobinson](http://twitter.com/iansrobinson)

I was a bit concerned it turns out to be a marketing thing. Still could be worth [checking out the recording](http://www.ustream.tv/recorded/46666141) because of all the twitter love. It's worth to be aware of that [Neo4j comes with dual licencing](http://www.neo4j.org/learn/licensing): GPL for open source projects and a **paid licence** for anything else.

## Functional Reactive Programming in Elm lang
### by Evan Czaplicki [@czaplic](https://twitter.com/czaplic)

Lots of tweets about this but to me it conflicted with the [Raft](#diego) talk. See [the recording here](http://www.ustream.tv/recorded/46672791).

## Polyglot data
### by Greg Young [@gregyoung](https://twitter.com/gregyoung)

Lots of tweets about this. Check [the video here](http://www.ustream.tv/recorded/46673907).


