---
title: "Programming, only better"
layout: post
summary: "Programming, only better by Bodil Stokke - Craft Conference, April 23-25 2014 @ Budapest, Hungary"
---

This talk opened [Craft Conference](http://craft-conf.com/2014/) Day 2.

#### Silver bullet processes

Keynote by Bodil Stokke started with Turing and Church as titans and huge Pinkie Pie sticker on her laptop so you already knew it's going to be good. Few Dijsktra quotes later we explored one of the usual silver bullets of software development (processes) which tend to work for some people and not others (Pinkie Pie loves pairing but Fluttershy is more into 'deep hack mode').

<blockquote class="twitter-tweet" lang="en"><p>&quot;People don&#39;t invent process just to punish other people!&quot; <a href="https://twitter.com/bodil">@bodil</a>&#39;s message of hope at <a href="https://twitter.com/search?q=%23CraftConf&amp;src=hash">#CraftConf</a></p>&mdash; Dan North (@tastapod) <a href="https://twitter.com/tastapod/statuses/459242471328055296">April 24, 2014</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

There's no truth out there. Find your answers but don't assume they're answers for others.

#### Complexity: state, control, code volume

Then came what processes can't solve: complexity. She briefly mentioned the Out of the tar pit paper which I also find fascinating.

We can understand code by testing and informal reasoning but testing can only discover errors. They shouldn't be there in the first place. Funnily enough one of the common themes of the conference was how testing is not the answer to everything.

Complexity is caused by state, control flow and code volume.

State hinders testing. A programs can get into a bad state. Example based testing tells you nothing about all the inputs but only the inputs you tested. Here Bodil referred to generative testing. State can also spoil informal reasoning as you end up many things to think of.

Control flow is the order in which thing happen. Concurrency badly messes this up.

Bodil also pointed out the nonlinear increase of complexity by code volume.

#### OO vs FP vs ?

OO manages stat with encapsulation which is great to enforce local constraint but doesn't really help with global and external constraints. Control is not really managed and polymorphism makes it worse.

FP gets rid of state which is fantastic. Referential transparency rocks and state is passed around as values.

One thing FP doesn't eliminate is control flow. An ideal language should eliminate that as well. There would be no need to say how just what we want. Logic programming enables this in a way so Bodil quickly showed us a clojure core.logic example.
