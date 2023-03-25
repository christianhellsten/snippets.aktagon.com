---
id: '234'
title: How to optimize your MephistoBlog powered site's search engine ranking (SEO
  for MephistoBlog)
languages:
tags:
---
At [Aktagon](http://aktagon.com) we use [MephistoBlog](http://mephistoblog.com/) as CMS, and I couldn't find any information on how to SEO optimize MephistoBlog on Google, so I'm sharing my notes here.

This tip shows you how to make your pages more search engine friendly.

First, add the title tag, plus the meta description and keywords tags to your layout's Liquid template , as shown here:


```
<meta name="description" content="{% if article %} {{ article.excerpt }}  {% else %} YOUR DEFAULT SITE DESCRIPTION {% endif %}" />
	<meta name="keywords" content="{% if article %} {% for tag in article.tags %}{{ tag }}, {% endfor %} {% endif %} YOUR DEFAULT KEYWORDS" />
	<title>{% if article %} {{ article.title }} &raquo; {{ site.title }} {% else %} {{ site.title }} &raquo; {{ site.subtitle }} {% endif %}</title>
```
    

Remember to update the default description and keywords in the meta tags' body.

Now, whenever you publish an article, simply add an excerpt and some tags to it. The excerpt is used as the meta description and the article's tags as the meta keywords, both make Google a bit happier, but the description is by far the more important.

