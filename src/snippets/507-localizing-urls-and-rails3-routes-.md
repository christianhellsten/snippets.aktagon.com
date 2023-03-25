---
id: '507'
title: 'Localizing URLs and Rails3 routes '
languages:
- ruby
tags:
---
If you need to support localized URLs in a Rails application, you have at least two plugins to choose from:
\* [i18n\_routing](https://github.com/kwi/i18n_routing) NOTE: doesn't seem to work with Rails 3.2.8
\* [rails-translate-routes](https://github.com/francesc/rails-translate-routes)

I recommend the rails-translate-routes plugin because it allows me to create exactly the URLs I need.

For example, if these are the localized URLs I need:


```ruby
http://xxx.com/news
http://yyy.com/uutiset
http://zzz.com/nyheter
```
    

