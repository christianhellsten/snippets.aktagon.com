---
id: '303'
title: Twitter type "followers, following database schema" for Rails/ActiveRecord
languages:
- ruby
tags:
- typescript
- vue
---
Draft schema for Twitter type followers, following functionality:


```ruby
create_table "followers", :force => true do |t|
    t.integer "leader_id"
    t.integer "follower_id"
end

add_index "followers", ["leader_id", "follower_id"], :name => "index_followers_on_leader_id_and_follower_id", :unique => true
```
    

Just an idea, haven't tested this yet.

Update: railscasts.com has published an article on how to use self-referential associations for this purpose:
http://railscasts.com/episodes/163-self-referential-association

