---
title: Writings
layout: default
---

{% for post in site.posts %}
  * [{{ post.title }}]({{ post.url }})
    <span class="date">{{ post.date | date_to_string }}</span>
{% endfor %}
