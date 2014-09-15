---
title: "Speeding up map search with static data tiles"
---

Let me share with you how we **rebuilt map search at one of biggest online travel sites** utilizing **static data tiles** and CDNs.

## Websites are mostly static

Based on my experience one of the key things lot of websites **fail to capitalize on** is how a **lot of their data is static** and simply doesn't change that often.

When it comes to serving **static assets** then it's a good practice to use **edge-caching and CDNs**. JavaScript and CSS files usually only change when you release your site and even if that's multiple times a day your site likely to serve lots of requests until this occurs. These requests don't have to hit your server if you can cache the response.

Another prime example is blogs. A blog typically only changes when the author posts something new. There's no point in serving requests from a database when you can just **pre-generate static HTML**. You should check out [Jekyll](http://jekyllrb.com/) if you don't know about that already.

Even if your site is not a static blog you can **push more data closer to end-users** instead letting your servers sweat over it. This can also make your stack **simpler to operate** in production.

## Classic map search

There are various ways of implementing map search but a typical (simplified) solution looks like this:

1. You have a number of entities with location data and you want to make them searchable on map.

2. Your user enters a location into an input field and sends it to you. You resolve the entered string to a coordinates (**geocoding**) and these will usally become the **center of the mapview** you want to display.

3. You now have to figure which entities (map pins) to show. You calculate the corners of our mapview (or use some distance radius from the center coordinate) and do **geospatial queries** to get the pins to display. (This can get more complex if you use polygon to represent areas, etc.)

4. The user **pans and zooms** and you got to handle each of these requests on the server side, make **more geospatial queries** which are usually not the cheapest thing computationally.

This approach is **difficult to cache**. The geospatial queries are really sensitive to panning and zooming. The user pans the map 5 pixels and that's a completely different query. The variation of the input makes it **impossible the get a good cache key** for this data even if it doesn't change that frequently. How to cache geographic data effectively then? Let's have a look at how online mapping works.

## Online mapping and tiles

When it comes to online mapping services most of them use **map image tiles** to display maps.

A **projection** is projecting the Earth's surface -typically approximated by a sphere- to a 2D plane. This can be described with an equation which translates spherical coordinates (latitude,longitude) to coordinates on a plane (like x,y). There are different projections and the one used for most online Maps is the **spherical Mercator projection**. Now we have plane which we can split to tiles.

Let's map the whole Earth to a **256 by 256 pixels square (one tile)** and make this is **zoom level zero**. Now we can **split** this square **to four equal squares** and make that **zoom level one** which has 4 tiles. At any given **zoom level n** we have **2^2n tiles** and increasing zoom levels provides a more detailed map of any region as we have **more pixels to cover the Earth on higher zoom levels**. Zoom level 10 has a billion, 15 has a billion and 20 has a trillion tiles.

Essentially **all major services** (inlcuding Google Maps, Bing Maps, Yahoo Maps, OpenStreetMaps) use the **same projection and tiling profile**. There are **differences in tile indexing** but other than that the systems are compatible.

## Introduction to data tiles

Imagine you have **location data which doesn't change that often** (hotels or restaurants don't tend to move around a lot). What if we could use the **same tiling system** as map images but instead of a map image fragments we store the **location and some metadata for each of our entities within JSON data tiles** as files. We can use the **same indexing scheme** as we would do for map images but get our data back.

1. You can iterate over all your **entities** and figure out **which tile they belong to**
2. Once you have all of them just write to disk all the tiles in JSON with **filenames allowing you to index them by tile id**
3. Put these files behind a **static fileserver** and you're done.

You **carefully** have to **choose which zoom levels** you generate tiles for so that mean, min, max of **entities per tile** remains well balanced. Using **quadtree keys** to index your tiles allows easy conversion between tile ids at different zoom levels.

You also want to **avoid generation a lot of empty tiles** (Hello, oceans and deserts!). Adding a rewrite rule to your static fileserver to just **serve an empty tile on file not found** can help with that.

## Client side does all the heavy lifting

Assuming you generated JSON files for each tile where you have data you got to access it somehow on the frontend.

Google Maps can actually tell you **which tiles are in your clients viewport** and based on that you can make **AJAX requests to get your data tiles**. Then you got to maintain that data in different structures on the **client side** to allow **filtering, sorting**, etc. Modern browsers should easily handle up to a few hundred or more map pins and the associated data. The backend remains fairly dumb and just a bunch of static files.

You can **enrich your data with additional AJAX lookups** which might not go to CDN but to origin to fetch the less static bits of data (like hotel or restaurant availability on specific dates).

Watch this space as I might get some more drawings to make this all easier to digest but really wanted to get this out there first :)

## Thanks

...to the team at Hotels.com and especially Niall Johnson and Joonas Tanner who made the frontend code rock!
