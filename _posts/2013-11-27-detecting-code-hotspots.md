--- 
title: "Detecting code hotspots"
layout: post
summary: "Wouldn't it be great to know which bit of code causes the most bugs?" 
---

# Why?

### Wouldn't it be great to know which bit of code causes the most bugs? 

Let's make a nice story out of this:

    As a developer
    I want to see which areas of my code have the most bugs 
    so that I can take extra care (or maybe even fix the root cause of problems :)

# What?

### All you need is commits linked to your bugtracker and some history

Let's assume commits are linked to our bug tracker (i.e. commit message contains bug id).

The idea is to generate a list files which were changed most frequently to fix bugs.

The files at the top of this list can be considered hotspots and potentially require some attention or refactoring to make your codebase healthier.

There's nothing stopping you from using this on small or new projects but it works best on older/larger projects with some history.


# How?

A small script I use at Hotels.com is coming soon here :) Watch this space.