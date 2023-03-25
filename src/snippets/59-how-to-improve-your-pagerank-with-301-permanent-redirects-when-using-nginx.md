---
id: '59'
title: How to improve your PageRank with 301 permanent redirects when using Nginx
languages:
tags:
---
Mathew Innman of [seomoz.org](http://seomoz.org) fame wrote about [how Digg could increase their revenue](http://www.seomoz.org/blog/dear-digg-million-code) by using a so called canonical URL for their whole site. This can be implemented by redirecting users that type in, for example, www.digg.com to digg.com. The reasoning being that instead of having backlinks pointing to two different domains (www and no-www), all backlinks should point to just one, which increases your search engine ranking.


```
if ($host ~* "www") {
      rewrite ^(.*)$ http://aktagon.com$1 permanent;
      break;
    }
```
    

Permanent redirects are also a good idea, if you move your content to a new domain--digg.com to dugg.com, for example...

The syntax for the Nginx rewrite module is documented [here](http://wiki.codemongers.com/NginxHttpRewriteModule).

