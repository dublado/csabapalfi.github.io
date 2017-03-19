# 📱 Reactive programming and message buses for mobile

[Csaba Palfi](https://csabapalfi.github.io), Jan 2014

I attended a [Mobile Web Meetup](http://www.meetup.com/mobile_web/events/156458162/) yesterday organized by Matt Pearce from Cognizant.

**Maciej Matyjas ([@matyjas](https://twitter.com/matyjas))** talked about reactive programming and message buses for mobile. He is the **mobile tech lead for Hotels.com** (yes, I work there, too). Maciej is in an especially good position to react (pun intended) to the **convergence of mobile and functional programming** since he has more than 10 years of experience in mobile and also an active member of the Scala community in London. It was a fun talk with lot of example code and photos of buses.

## Motivations to go reactive or use buses

Mobile development has been around for a while so what's the main motivation behind looking for new approaches?

One of the key drivers is making our apps **more aware of the user's context** to improve user experience. Maciej mentioned things like connection type, battery, location, sensors or even something as simple like the time of the day. A good example is not starting to download a lot of data on 3G or using the time of the day to guess if a customer is looking for business or family hotels.

Another reason is how **async is more natural** in a lot of cases on a mobile device. Why waste valuable battery life polling for updates if you can react on events pushed to you. **Mobile ❤ async**.

You can also think about **realtime** updates like displaying likes, comments as they happen and how to handle these in your app.

**Utilizing multicore** is also becoming more important as even entry level Android devices have at least two cores these days.

## Message buses

The idea of message buses has been around since the 1960s. They were made popular by the book titled [Enterprise Integration Patterns](http://www.eaipatterns.com/). Basically a [message bus](http://www.eaipatterns.com/MessageBus.html) is all about **decoupling producers and consumers**.

The typical **enterprise bus** supports delivering, queueing, filtering, batching and persisting messages. Having a bus can also enable asynchronous message passing and greatly increase the producer performance as it can just send and forget. Performance is tipically highly tuneable by controlling the queue depth, the number of consumers and so on.

On mobile platforms we can use **microbuses**. In this environment producing a message is tipically a blocking operation and we don't get to fine tune as many things (like threading semantics) but they're still pretty useful.

On **iOS** there's **[NSNotificationCenter](https://developer.apple.com/library/mac/documentation/cocoa/reference/foundation/Classes/NSNotificationCenter_Class/Reference/Reference.html)** which isn't that new and not that tunable (but e.g. batching is handled for us.) **Android's [LocalBroadcastManager](http://developer.android.com/reference/android/support/v4/content/LocalBroadcastManager.html)** is quite similar to Apple's solution and it's supported from early Android versions. Both platforms support local buses and have a global bus as well.

Another library to look at for **Android** is **[Otto](http://square.github.io/otto/)** from Square (you know, the small square thingy to read credit cards and accept them with your mobile/tablet). It's forked from the [EventBus in Google's Guava library](https://code.google.com/p/guava-libraries/wiki/EventBusExplained) but specialized for Android.

## Functional reactive programming

Maciej started with some great analogies to explain reactive programming. It's really difficult to find a good one. One of his examples was a simple spreadsheet. Imagine a cell with a function referencing another cell. When the value of the referenced cell changes then the original cell changes as well in **reaction** to the change.

Basically reactive programming is about **treating events as first class citizen**. What's even cooler is that a lot of the **functional programming concepts and toolkit** of filter/map... can be used here as well. Sometimes people also call this **functional reactive programming**.

The concept originates from **Microsoft** where they built **Reactive Extension (RX)** for C# then for JavaScript. So what do we get on mobile?

**Apple** also has this thing called **[Key-Value Observing (KVO)](https://developer.apple.com/library/mac/documentation/cocoa/conceptual/KeyValueObserving/KeyValueObserving.html)**. Basically it allows objects to be notified of changes to specified properties of other objects. KVO also supports returning an **intial value** (even before the first event is received) via NSKeyValueObservingOptionInitial. The observed property is specified as a string so it's not too refactoring friendly.

**Android** can make use of **[RxJava](https://github.com/Netflix/RxJava)** by Netflix which is the port of Microsoft's RX to Java (the project actually contains [RxScala](http://rxscala.github.io/) as well). The key concept of this library is the **Observable** abstraction which can be imagined as an **Iterable but with pushed values**. It has greatly parametrizable concurrency which allows defining which thread to execute on (subcribeOn, observeOn). Since Java doesn't have lambdas yet -as Java 8 is still not released- the code might get a bit messy and verbose. **In iOS** apps we can also use **[ReactiveCocoa](https://github.com/ReactiveCocoa/ReactiveCocoa)**. ReactiveCocoa and RxJava also allow **composing and transforming streams** of values and they're full-fledged functional reactive programming libraries.

Maciej then showed us -a not strictly mobile- example with **[bacon.js](http://baconjs.github.io/)**. EventStream in bacon.js is analogous to Observavle in RX and this library also has a concept of a **Property with current value** which reacts on a stream of events. It works well with JavaScript promises but when I asked Maciej said that it's not integrated with WebWorkers yet.

[Reactive Extensions across languages](http://www.thoughtworks.com/radar/#/languages-and-frameworks/686) also made it to the trial ring of the latest **[ThoughtWorks Technology Radar](http://www.thoughtworks.com/radar/#/)**

## Conclusion

Maciej summed up that **buses and reactive** actually **work well together** and they're suited for **different usecases**.

**Buses** are useful when **broadcasting** messages. They're a good fit for messaging **between components** but **nothing really noisy**.

The **reactive** approach probably works better on a **smaller scale** like **within a class**. It's good for **composing local events** and can handle a **firehose** of events.

## Useful tips

Then we got some useful tips on thing to watch out for. It's important to **cleanup subscriptions**. It's a good idea to **signal the end of a stream** somehow (e.g by sending a stream is over message - this shows some similarity to the poison pill message used in Akka to terminate actors). An interesting problem Maciej highlighted numerous times during the talk is how you handle **events published before subscription** or how you get **initial values** for mutable data modified by streams of messages.

![](https://ga-beacon.appspot.com/UA-29212656-1/reactive-and-buses-for-mobile?pixel)
