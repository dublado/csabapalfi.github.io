---
title: "The Internet of Things and Android"
redirect_from: "/the-web-of-things-and-android"
---

**Update**: Renamed the post to use IoT in the title as that's a more popular term than Web of Things.

Last week I attended a [London Java Community meetup](http://www.meetup.com/Londonjavacommunity/events/156067152/) where Dominique Guinard ([@domguinard](https://twitter.com/domguinard), [EVRYTHNG](https://evrythng.com/)) presented about the internet of things and Android. [Video](http://skillsmatter.com/podcast/os-mobile-server/if-spock-had-an-android-phone-android-and-the-web-of-things/hg-8635) and [slides](http://www.slideshare.net/EVRYTHNG/android-the-web-of-things-bluetooth-low-energy-bluetooth-40-ibeacons-barcodes-qrs-nfc-arduino) are available.

When it comes to terminology there are differences between the **Internet of Things (IoT)** and [Web of Things (WoT)](https://www.webofthings.org/). IoT is used to refer to things at the network level (stuff like [EPCIS](http://www.gs1.org/gsmp/kc/epcglobal/epcis) and [IPv6 lowpan](http://en.wikipedia.org/wiki/6LoWPAN)) while WoT is more about the application level and e.g. having a REST interface for your home appliances. These days they're used pretty much interchangeably and no-one seems to bother what they mean. :)

WoT is getting a really hot topic as it's predicted to have **3 trillion devices connected by 2015**. We have a wide range of options from simple tags (QR code, NFC) to embedded devices (Pi, Arduino). As we go from tags to devices both the cost and the interactivity of the solutions increases.

One use-case is to have dumb products tagged with some sort of **product id**. These can be scanned by your mobile (which is associated with **personal id**) and this allows building a **smart profile** and associate products with users.

**Android is the best platform** to build IoT as of today because of it's support of wide range of the technologies in this space.

Dom then took us through solutions of different levels which I describe in more details below or you can have a look at the **[executive summary](http://www.slideshare.net/EVRYTHNG/android-the-web-of-things-bluetooth-low-energy-bluetooth-40-ibeacons-barcodes-qrs-nfc-arduino/60)** from the slides.

## Barcode (1D, QR code)

1D barcodes (you know the one with lot of vertical lines on any product you buy) is actually patented and the inventor still gets royalty for each barcode printed. Yeah, imagine the profits.

QR codes on the other hand are royalty free and I also learned they were invented by Toyota to track things in their factories.

When it comes to using your own QR codes it's really important to **encode something unique** like a URL or vCard. Encoding a URL also allows you to change what's behing a QR code later.

**Android** has great support for QR codes with the **[zXing library](https://github.com/zxing/zxing)** (it also supports 1D code).

An interesting use of QR codes is [Diageo's father's day campaign](http://www.youtube.com/watch?v=T1Cp5tO8kGY) in Brazil or one of my friend's ([@zoltanfodor](https://twitter.com/zoltanfodor)) project helping you to [explore the city of Kemi](http://kemipaths.com/) in Finland.

## NFC

As you probably already know NFC stands for **near-field communications**. (In most cases you actually you have to **touch**). Basically you have NFC tags which are small and cheap passive circuits including limited memory and a radio antenna. Passive means they **don't need any batteries** but draw power from the devices reading them. The magic of magnetic induction.

This term is sometimes also used collectively to include RFID or EPC tags as well. (hello Oyster cards :) DOM also mentioned UHF RFID solutions which can be read from 100 meters but imagine the privacy concerns.

**Android has really good NFC support** since early versions (2.3.3+). It also allows to **wake up an app on tag discovery**. The API might be a bit complex but really powerful.

Android Beam uses NFC to initiate a WiFi data transfer between two devices when touched.
Dom also mentioned the [Trigger Android app](https://play.google.com/store/apps/details?id=com.jwsoft.nfcactionlauncher&hl=en_GB) which allows you to configure your phone based on NFC tags read and much more. Dom also uses NFC tags for home automation.

## Embedded devices

The next level is actual embedded devices. These are just **small computers** with actual processors, etc. which can be embedded into almost anything. I'm thinking of **Arduino, Raspberry Pi, ioBridge, electric imp** and the likes.

Arduino and Pi are probably the most well known. We saw some cool demos and I learnt that Arduino add-ons are called shields and it also has a Java IDE called Processing.

Android devices can be integrated with **[Arduino Mega](http://uk.mouser.com/new/arduino/arduinoandroid/)** boards using the **Android ADK** ([Accessory Development Kit](http://developer.android.com/tools/adk/index.html)). Since the mega boards are more expensive (and why not?) some people came up with a hack to use ADB ([Android Debug Bridge](http://developer.android.com/tools/help/adb.html)) to communicate between Android devices and other Arduino boards. Actually this only works with Android versions below 4 or via Bluetooth.

## BLE

Then we arrived to the most recent development which is the **Bluetooth Low Energy (BLE)** standard.The key advantage here is the **lower radio power** which also results in **less bandwith and closer range** but the **battery life** can be seriously extended. (We're talking about years here).

You might think this is the ultimate way for tagging from now on but is much **more expensive than NFC**.

**Android supports BLE since 4.3 but phone can't act as a pheripheral**. This means the phone can't advertise itself but can scan for advertised other devices. A cool ad cheap BLE sensor is the [TI SensorTag](http://www.ti.com/ww/en/wireless_connectivity/sensortag/index.shtml?DCMP=lprf-stdroid&HQS=lprf-stdroid-pr) which is just $25.

One common application is smart lost & found. Put a BLE tag on your keys or whatnot and your phone will tell you direction and distance when looking for it. BLE is used by Pebble watches or JawBones as well.

Imagine having BLE sensors inside a store. Having 3 of them visible to a customer's phone would allow you to locate a customer exactly within a shop.

#### iBeacons

We know **iOS doesn't support NFC and probably never will** but how about BLE? Well, **iOS 7 kind of supports BLE** but not exaclty. This is called iBeacons. The iBeacons bootstrap message is slightly different. A cool project to check out is [pibeacons](http://learn.adafruit.com/pibeacon-ibeacon-with-a-raspberry-pi/what-is-ibeacon) which lets you turn a Raspberry Pi into an iBeacon.
