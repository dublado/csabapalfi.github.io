--- 
title: "inspigram - my Hotels.com hackathon entry"
layout: post
summary: "inspigram - my Hotels.com hackathon entry" 
---

Hotels.com held it's first 24 hour hackathon last December where 19 teams got together and hacked on their ideas. It was a great event and we had a lot fun. I also entered and got second most votes (along with 3 other teams :).

My idea was: inspigram - plan your next holiday inspired by photos. See it in action [here](http://inspigram.herokuapp.com/). (First request might take longer to serve because of the free Heroku hosting)


## The idea

1. type a word

2. app looks for geotagged photos matching the keyword 

3. found a photo you like? want to stay there?

5. takes you to Hotels.com search results based on photo geolocation

## Resources

#### Flickr API

I use the [flickr.photos.search](http://www.flickr.com/services/api/flickr.photos.search.htm) method from the Flickr API.

[Flickr API exlporer](http://www.flickr.com/services/api/explore/?method=flickr.photos.search) is a great tool to explore the API.

#### Suplerslides

[Superslides](http://nicinabox.com/superslides/) is a full screen, hardware accelerated slider for jQuery. Here's the github repo: [https://github.com/nicinabox/superslides](https://github.com/nicinabox/superslides)

#### Google Maps API

I use [Reverse Geocoding](https://developers.google.com/maps/documentation/geocoding/#ReverseGeocoding) to get addresses from coordinates.

#### Hotels.com search results page

Once the address is found the app takes you to [Hotels.com](http://hotels.com) search results

#### Node.js

I used [node.js](http://nodejs.org/) for the first time and it's surprisingly capable for quick development.

I got so excited I even tweeted about this :)

<blockquote class="twitter-tweet" lang="en"><p>Node.js IS the platform for hackathons! <a href="https://twitter.com/search?q=%23node&amp;src=hash">#node</a> <a href="https://twitter.com/search?q=%23rocks&amp;src=hash">#rocks</a> <a href="https://twitter.com/hotelsdotcom">@hotelsdotcom</a> <a href="https://twitter.com/hcom3ng">@hcom3ng</a></p>&mdash; Csaba Palfi (@csabapalfi) <a href="https://twitter.com/csabapalfi/statuses/412708473756209152">December 16, 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

[Nodemon](http://remy.github.io/nodemon/) was really helpful in keeping my app running and refreshing it on file changes.

#### Heroku

Finally deployed the whole thing to [heroku](http://www.heroku.com) as that seemed the easiest and quickest way.

#### Demo slides

I also put together some very basic [slides](http://csabapalfi.github.io/inspigram) hosted on Github Pages and using the brilliant [reveal.js](http://lab.hakim.se/reveal-js/)


## What I didn't have time for in 24 hours

* better design
* responsive buttons and input field
* responsive image sizes
* remove duplicate code between homepage and photo page
* caching to speed up images for popular queries
* better image sorting
* more datasources
* and so on...