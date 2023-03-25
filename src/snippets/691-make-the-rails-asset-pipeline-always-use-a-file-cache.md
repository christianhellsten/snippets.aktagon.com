---
id: '691'
title: Make The Rails Asset Pipeline Always Use a File Cache
languages:
- ruby
tags:
---
Stuff this in e.g. config/environments/development.rb to make Rails asset pipeline always use a file cache:


```ruby
config.assets.cache_store = :file_store, "tmp/asset-pipeline"
```
    

Even better, don't use the Rails asset pipeline (sprockets):
\* [Gulp.js](http://gulpjs.com/)
\* [Grunt.js](http://gruntjs.com/)
\* [Broccoli](https://www.npmjs.org/package/broccoli)
\* [Goodbye, Sprockets! A Grunt-based Rails Asset Pipeline
](http://blog.pedago.com/2014/01/21/goodbye-sprockets-a-grunt-based-rails-asset-pipeline/)

