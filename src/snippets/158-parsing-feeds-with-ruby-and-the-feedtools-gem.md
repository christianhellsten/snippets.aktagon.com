---
id: '158'
title: Parsing feeds with Ruby and the FeedTools gem
languages:
- ruby
tags:
- elixir
- phoenix
- plug
---
This is an example of how to use the FeedTools gem to parse a feed. FeedTools supports atom, rss, and so on...

The only negative thing about FeedTools is that the project is abandoned, the author said this in a comment from March 2008:
“I’ve effectively abandoned it, so I’m really not going to go taking on huge code reorganization efforts.”

Installing
----------


```ruby
$ sudo gem install feedtools
```
    

Fetching and parsing a feed
---------------------------

Easy...


```ruby
require 'rubygems'
require 'feed_tools'
feed = FeedTools::Feed.open('http://www.slashdot.org/index.rss')

puts feed.title
puts feed.link
puts feed.description

for item in feed.items
  puts item.title
  puts item.link
  puts item.content
end
```
    

Feed autodiscovery
------------------

FeedTools finds the Slashdot feed for you.


```ruby
puts FeedTools::Feed.open('http://www.slashdot.org').href
```
    

Helpers
-------

FeedTools can also cleanup your dirty XML/HTML:


```ruby
require 'feed_tools'
require 'feed_tools/helpers/feed_tools_helper'

FeedTools::HtmlHelper.tidy_html(html)
```
    

Database cache
--------------

FeedTools can also store the fetched feeds for you:


```ruby
FeedTools.configurations[:tidy_enabled] = false
FeedTools.configurations[:feed_cache] = "FeedTools::DatabaseFeedCache"
```
    

The schema contains all you need:


```ruby
-- Example MySQL schema
  CREATE TABLE cached_feeds (
    id              int(10) unsigned NOT NULL auto_increment,
    href            varchar(255) default NULL,
    title           varchar(255) default NULL,
    link            varchar(255) default NULL,
    feed_data       longtext default NULL,
    feed_data_type  varchar(20) default NULL,
    http_headers    text default NULL,
    last_retrieved  datetime default NULL,
    time_to_live    int(10) unsigned NULL,
    serialized       longtext default NULL,
    PRIMARY KEY  (id)
  )
```
    

There's even a Rails migration file included.

Feed updater
------------

There's also a feed updater tool that can fetch feeds in the background, but I haven't had time to look at it yet.


```ruby
sudo gem install feedupdater
```
    

Character set/encoding bug
--------------------------

As always, there are bugs that you need to be aware of, Feedtools is no different. There's an encoding bug, FeedTools encodes everything to ISO-8859-1, instead UTF-8 which should be the default encoding.

To fix it use the following code:


```ruby
ic = Iconv.new('ISO-8859-1', 'UTF-8')
feed.description = ic.iconv(feed.description)
```
    

You can also try [this patch](http://n0life.org/~julbouln/feedtools_encoding.patch).


```ruby
cd /usr/local/lib/ruby/gems/1.8/gems/
wget http://n0life.org/~julbouln/feedtools_encoding.patch
patch -p1 feedtools_encoding.patch
```
    

The character encoding bug is discussed on this page: http://sporkmonger.com/2005/08/11/tutorial

Time estimation
---------------

By default FeedTools will try to estimate when a feed item was published, if it's not available from the feed. This annoys me and will create weird publish dates, so usually it's a good idea to disable it with the timestamp\_estimation\_enabled option:


```ruby
FeedTools.reset_configurations
FeedTools.configurations[:tidy_enabled] = false
FeedTools.configurations[:feed_cache] = nil
FeedTools.configurations[:default_ttl]   = 15.minutes
FeedTools.configurations[:timestamp_estimation_enabled] = false
```
    

Configuration options
---------------------

To see a list of available configuration options run the following code:


```ruby
pp FeedTools.configurations
```
    

