---
title: Node.js security basics
---

Node allows you to experiment and **build software extremely quickly**. It's so easy to build new functionality that you might not think too much  about **non-functional requirements** :)

Recent node.js events I've been to were all about **node in production**. I'm also planning to write about **performance and reliability** but let's start with **security**.

## node is not different

All **humans writing code are an un-patched vulnerability**. There will always be vulnerabilities but what matters is your **process** dealing with them. Here are some basic tips:

### 1. know OWASP Top 10

[OWASP top 10](https://www.owasp.org/index.php/Top_10_2013-Top_10) is list of the **most critical** and prevalent web application **security issues**. It's a great way to get started.

[NodeGoat](https://github.com/OWASP/NodeGoat) is an express webapp with Mongo **demonstrating** OWASP Top 10 issues and addressing them. Any volunteers to write one for [hapi](http://hapijs.com/)?

### 2. use security headers

Sending (or even removing) **certain HTTP headers can greatly improve security**. Learn about these and use them!

NodeGoat uses the [helmet](https://www.npmjs.org/package/helmet) express middlewares for this. [lusca](https://www.npmjs.org/package/lusca) is another good express middleware.

Hapi supports a lot of these headers out of the box.

### 3. ```require``` responsibly

You're responsible for the modules you ```require```. Do you at least check number of installs on npm? Do you check open issues on Github?

The [node security project](https://nodesecurity.io/) is an ambitious community effort (organized by [^Lyft](https://liftsecurity.io/)) to maintain a list of **known vulnerabilities for npm modules**.

They provide a [command line tool](https://www.npmjs.org/package/nsp), Grunt task, an API ([example](https://nodesecurity.io/validate/crumb/2.0.0)). Closer integration with npm is coming as well.

### 4. never trust user input

It's so easy to forget that users don't always [mean well](http://xkcd.com/327/). **Always validate request params and body** instead of just building mongo queries based on them.

In express make sure you understand the simple and extended queryparser and bodyParser.urlencoded options.

With hapi make sure you check out [joi](https://github.com/hapijs/joi) - their amazing **declarative validation** module.

Node.js services sometimes just proxy through other backends. Make sure you only pass validated input through.

### 5. prevent command injection

The ```exec``` method in the [child_process](http://nodejs.org/api/child_process.html) can be dangerous as it gets it's whole command as a String. If the wrong thing get concatenated in there it'll hurt. Just make sure you use **```execFile``` or ```spawn```** instead as **they get arguments as an array**. Read [this post](https://blog.liftsecurity.io/2014/08/19/Avoid-Command-Injection-Node.js) to learn more.

### 6. do crypto well

Watch out for cases when **depcrypting garbage doesn't throw error** (Have tests for these scenarios).

Actually, **just use HMAC** but watch out for timing attacks. ([cryptiles](https://github.com/hapijs/cryptiles) from the hapi guys has ```fixedTimeComparison``` to prevent that)

Checkout [cryptopals.com](http://cryptopals.com/) if you want to deeply understad crypto.

### +1 two-factor auth

Turn on two-factor auth wherever you can. Seriously. Use [Authy Bluetooth](https://www.authy.com/thefuture#bluetooth) if you don't like typing tokens.

### +2 AWS IAM rocks

Don't hardcode AWS access keys, ever. **IAM policies** are amazing and seamlessly integrated to the SDK. Use it. I think this is worth it's own post.

## Thanks

This post is largely based two talks by [Adam Baldwin](https://twitter.com/adam_baldwin) (from [^Lift](http://liftsecurity.io)) at [LNUG](http://lnug.org/) and [London Node Security Meetup](http://attending.io/events/node-security-project-meetup).
