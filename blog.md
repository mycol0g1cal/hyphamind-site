---
layout: default
title: Blog
description: Updates, deep dives, and announcements from the HyphaMind team.
permalink: /blog/
redirect_from:
  - /blog.html
---

<section class="container">
  <h1 class="mt-0">Blog</h1>
  <p class="mt-1">Updates, deep dives, and announcements.</p>

  {% if site.posts.size > 0 %}
  <ul class="mt-2">
    {% for post in site.posts %}
      <li>
        <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
        <small>— {{ post.date | date: "%b %-d, %Y" }}</small>
        {% if post.excerpt %}<br><small>{{ post.excerpt | strip_html }}</small>{% endif %}
      </li>
    {% endfor %}
  </ul>
  {% else %}
    <p class="mt-2">No posts yet. Check back soon.</p>
  {% endif %}
</section>
