---
id: '379'
title: How to do an HTTP conditional GET with Feedzirra (update an existing feed)
languages:
- ruby
tags:
---
This snippet explains how to do conditional gets with Feedzirra 0.0.17:


```ruby
# First create a dummy parser, any type of parser will do
f = Feedzirra::Parser::RSS.new

# Set the required Feedzirra values with data from your database
f.feed_url = feed_from_db.url
f.etag = feed_from_db.etag
f.last_modified = feed_from_db.last_modified_at

# Set the last entry. This step is important. 
# This allows Feedzirra to detect if a feed that doesn't support last modified and etag has been updated.
last_entry = Feedzirra::Parser::RSSEntry.new

# Do we have a last entry in the database? If so let Feedzirra know
if feed_from_db.items.last
  last_entry.url = feed_from_db.items.last.link
end

# Without this Feedzirra will return an empty array or some other surprise
f.entries << last_entry

# Update the feed
Feedzirra::Feed.update f
```
    

