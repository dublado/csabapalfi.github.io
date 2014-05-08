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

A summary of all 11 talks I found interesting on day 3 is available here:

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

Diego is one of the authors of the Raft consensus protocol used by Serf, etcd and a lot of others. So **why** do we need consensus?

A distributed system is either **available or consistent**. If you choose **consitency** and you're on **multiple nodes** then those nodes **have to agree**, that's consensus. By the way if you build anything distributed (god forbid you try to sell it as a good thing) then watch out for [@aphyr](http://twitter.com/aphyr) who will tear your creation apart in seconds :)

A working consensus algorithm is tipically used to **maintain a replicated log** of commands accross multiple nodes. This log then can be used to store command which can control the state of a state machine (be it a key-value store or anything).

The godfather of all consensus algorithm is **Paxos** which was created by Leslie Lamport who recently got a Turing award. There's one problem with it though: it's really **difficult to understand** and even more difficult to implement correctly. Basically the Google Chubby paper is mostly about how a lot of implementation details are not in the Paxos paper.

**Raft** is consesus protocol deliberately **designed for understandability**. It's **correct, complete, performant** but also understandable. It has a much less complex state space then Paxos. Three main concerns are **leader election** (maintain a leader), **log replication** (leader gets client commands, appends them to the log and replicates them) and **safety** (only a valid, elected leader stores data). The [paper](https://ramcloud.stanford.edu/wiki/download/attachments/11370504/raft.pdf) also describes client interactions, cluster membership changes and log compaction.

Diego presented leader election and that's truly really simple and understandable. He used a brilliant demo from [thesecretlivesofdata.com](http://thesecretlivesofdata.com/raft/) Check out the [youtube video](http://www.youtube.com/watch?v=YbZ3zDzDnrw), the [paper](https://ramcloud.stanford.edu/wiki/download/attachments/11370504/raft.pdf) and the [Raft website](http://raftconsensus.github.io/) which also lists all implementation in different languages.

Some implementation tips:

* use 64 bit integers as term index
* minimum timeout for elections should be enough for one network roundtrip plus a disk write

## <a name="jeff"></a>Distributed Systems in Production
### by Jeff Hodges [@jmhodges](https://twitter.com/jmhodges)

Jeff has a brilliant blog post titled [Notes on Distributed Systems for Young Bloods](http://www.somethingsimilar.com/2013/01/14/notes-on-distributed-systems-for-young-bloods/). His talk is somewhat based on that blogpost and sums up lot of the lessons they learnt the hard way at Twitter. I publish some of my notes here but you're much better of by just reading his post I guess. :)

So why **distributed systems are different**? It's mainly about **failure** and **partial failure** compared to non-distributed systems. Ok, but why distributed systems rock? Partial failure actually also means **partial availability**.

**Metrics** can help a lot to restore your sanity. A deploy should change a metric. **Prefer metrics to logs**: common problems are all over them and the uncommon ones remain hidden.

Try to avoid machine/node **coordidnation** if you can: consensus is expensive. Avoid human coordination at all costs. Collaboration is always politics, but there is good and bad politics.

Implement **back pressure** (pushing back on high load) in your systems. Think of curved pipes. They're curved so pressure changes in a bigger pipe connected to it don't blast the smaller pipe. Useful strategies here : drop packet on the floor (stats, alerts in place), documented error response to let upstream know, or timeouts and exponential backoff.

The point of **feature flags** is to separate deploys from releases. Feature flag ```if``` statements are about sacrifying some local code clarity for global stabiltity.

Exploit **data locality**. Locality **in time** as well. Batching and collapsed forwarding of requests are really powerful. Sensing an inflight request and not re-requesting is also helpful.

Your components should be fast, with current tech you should get **100k req/sec with few hundred ms latency easily**. Otherwise you might be doing something wrong.

## <a name="gareth"></a>CI for Infrastructure
### by Gareth Rushgrove [@garethr](https://twitter.com/garethr)

Gareth talked about how software engineering practices can be adopted for infrastructure as code. On of these is CI (maybe even continous deployment) for infrastructure. Talking about CI: checkout [Jenkins Job Builder](http://ci.openstack.org/jenkins-job-builder/) for CI setup as code.

You have **CI** to get **fast feedback and **prevent isolation**. Feedback could be some sort of **testing**. Do you want to test your **config management** (puppet/chef/etc) code? Maybe not always but for a library it's certainly useful.

**Acceptance tests** for infrastrucuture can **spin up a short lived machine** and then **assert** that the machine is in the expected state. Have a look at [kitchen-ci](http://kitchen.ci/) which allows you to run tests in parallel and supports different drivers like ec2 and digitalocean. For assertion you can use [serverspec](http://serverspec.org/).

**Machine image testing** can certainly be really useful. You wan't to be sure your image is good to be deployed. You can use serverspec to verify images built with packer and potentially not save an ami if assertions fail. Gareth has an [example on github](https://github.com/garethr/packer-serverspec-example). Same goes for Docker containers as it can be really useful to verify images without manually spinning them up but relying on tests.

**Continous load testing** can also be added to an infrastructure pipeline. [Gatling](http://gatling-tool.org/) provides useful aggregate assertions. This can supplement ad-hoc load testing.

Some future directions include **continous delivery for infrastructure** and **entire infrastructure as code** (hello CloudFormation:). We can also think of using infrastructure feature flags and similar approaches.

Other tools mentioned were [bats](https://github.com/sstephenson/bats) for testing bash and [gor](https://github.com/buger/gor/) for replaying production traffic in other environments.

## <a name="simon"></a>Delivering Continuous Delivery Continuously
### by Simon Hildrew [@sihil](https://twitter.com/sihil)

The [Guardian](http://theguardian.com) is doing some pretty cool stuff and certainly is visible on a lot of conferences. Simon talked about how they do continous delivery with around 100 deployables on a site seeing 100 million monthly unique browsers.

So **how do you know** you're doing continous delivery? :)

1. Keep your software deployable trough lifecycle
2. Keep it deployable over new features
3. Get fast and automated feedback on production readyness
4. Push button deployment for any deployable to any envorinment on demand

**Deployment as service** can also be added here to allow setting up new deployables and pipelines in a self-service way. Having an **audit trail** is also key to keep deployments and changes visibile. **Autoscaling deploys** is one of the great capabilities enabled by the cloud. Essentialy you bring up a new cluster of services for deployment and as soon as the new release is healthy you point your loadbalancer at the new version and kill the old cluster. **Expiration for feature flags** is about not letting your code quality damaged by all the conditinal feature flag logic. Great idea.

Simon suggests to **start small** and **encourage envangelism** in your teams. Also important to make everyhting as easy as possible for developers when it comes to deployment as a service. It can mean a lot if **business priorities** are also followed instead of trying to totally de-risk your approach. The business will be really happy if a ciritical **bug fix can be rolled out quickly** because of continous delivery. When it comes to deploying contiously it works really well for APIs but it's a bit controversial whether want it for UI components.

## Mobile HTML5
### by Tomomi Imura [@girlie_mac](https://twitter.com/girlie_mac)

Tomomi talked about the **state of mobile HMTL5** and how it challenges all the native app stores. She showed off the brilliant [coremob camera](https://github.com/coremob/camera) site which demoes a lot of HTML5 features. (HTML Media Capture, indexedDB, XHR2, touch events).

We also heard about **device APIs** to access hardware including geolocation, deviceorientation, battery status and so on. The vibration API was used for form validation feedback in an example. Ambient light sensor events were used to change text background to make reading easier.

[chromestatus.com](http://chromestatus.com) and [status.modern.ie](http://status.modern.ie) were also referenced as useful resources to check future plans and **browser support** along with [caniuse.com](http://caniuse.com).

## No general purpose database
### by Dominic Tarr [@dominictarr](https://twitter.com/dominictarr)

Dominic talked about all the confusion around the data-stores available to developers. First just think of **data strucures**. They are **well understood** and a **rational choice** can be made easily in most cases. When it comes to **data-stores** you get all the **marketing FUD**.

The way to see through marketing promises is to actually **understand** what data-stores do behind the scenes. Then we walked thorugh data store implementations from simple file storage, **append-only** file storage, **sorted string table** all the way to **log structured merge tree** which is an append-only log + a sorted view. Then Dominic touched on LevelDB and Haystack.

The trick is understanding your data and your data-store options well. :)

## MCDonalds, Six sigma and outsourcing
### by Chad Fowler [@chadfowler](https://twitter.com/chadfowler)

First we learned how Chad got from music to programming via Doom. Then he went on to get some inspiration from fairly unusual sources like McDonalds or Six Sigma. [Watch it here](http://www.ustream.tv/recorded/46744747).

**[Zen and Art of Motorcycle Maintenance](http://www.amazon.co.uk/Zen-Art-Motorcycle-Maintenance-Inquiry/dp/0060589469)** is a great read and gives some new perspectives quality. Quality is undefined. For something **commoditized** the only thing which matters is **function** and that is **objective**. For something **artistic** the **form** matters maybe even more and quality is obviously **subjective**. A craft is somewhere between the two.

**Six sigma** tells us that internal quality does not matter. **External quality measured from the customers perspective** is the only important thing. Can't see, don't care. **Internal quality of software is difficult to measure** even though it still matter to us. Do you really think that coverage and other metrics have anything to do with real quality? Think again. The really curious might also want to look at some of the six sigma methods like DMADV and QFD but I'm not into it, really.

**[The E-myth revisited](http://www.amazon.co.uk/myth-Revisited-Small-Businesses-About/dp/0887307280)** is a good book with a bad title. Actually E stands for entrepeneurship. As developers we have to understand and **work on the business**. Can you make a better burger than McDonalds? Can you **sell** it better?

When it comes to outsourcing lot of people has mixed feelings but **automation** and **outsourcing** might actually have a lot in common. **Make the fuzzy concrete** and **decompose responsibilities** then **automate or outsource**. Chad also mentioned the book titled [4 hour workweek](http://fourhourworkweek.com/) and how you can actually outsource some unusual things in your life like booking appoitments or even finding a nice pair of shoes based on a photo. I also learned what Amazon Mechanical Turk was named [after](http://en.wikipedia.org/wiki/The_Turk).


## Graph Search with Neo4j
### by Ian Robinson [@iansrobinson](http://twitter.com/iansrobinson)

I was a bit concerned it turns out to be a marketing thing. Still could be worth [checking out the recording](http://www.ustream.tv/recorded/46666141) because of all the twitter love. It's worth to be aware of that [Neo4j comes with dual licencing](http://www.neo4j.org/learn/licensing): GPL for open source projects and a **paid licence** for anything else.

## Functional Reactive Programming in Elm lang
### by Evan Czaplicki [@czaplic](https://twitter.com/czaplic)

Lots of tweets about this but to me it conflicted with the [Raft](#diego) talk. See [the recording here](http://www.ustream.tv/recorded/46672791).

## Polyglot data
### by Greg Young [@gregyoung](https://twitter.com/gregyoung)

Lots of tweets about this. Check [the video here](http://www.ustream.tv/recorded/46673907).


