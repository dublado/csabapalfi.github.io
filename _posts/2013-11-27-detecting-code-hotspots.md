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

* 1 Extract the list of relevant bug ids from your bug tracker. 
* 2.a Then use your souce control systems API and look for commit messages containing these ids and extract the modified files.
* 2.b If your bugtracker lists modified sources then you can extract data directly from you bugtracker
* 3 Once you have the files modified for each bug you can aggregate them and get the most frequently fixed files

### How did we hacked this together?

2.b is exactly what you can do if you have JIRA and FishEye (or Stash) and we use JIRA 5 with Fisheye integration at Hotels.com.

Fisheye and JIRA REST APIs are nice but let's say you want something quicker. (Actually these APIs were disabled in our setup) We can just replicate the AJAX requests made by JIRA when clicking the source tab of an issue (listing the modified files): 

    curl \
    --header "Authorization: Basic AuthKeyComesHere" \
    --header "x-pjax: true" \
    --header "x-requested-with: XMLHttpRequest" \
    https://jira.hotels.com/browse/ISSUE-1234\?page\=com.atlassian.jirafisheyeplugin:fisheye-issuepanel\&_pjax\=true
    
The auth key is just your colon separated username and password base 64 encoded.

This will return the HTML for the source tab which contains some nice anchors we're interested in:

    <a class="path" … >
      /path/to/some/file/which/was/changed.js
    </a>

We can then extract the data we're after from here.

I played product owner for a small project where are trainees implemented this and it works reasonably well.
    
    


