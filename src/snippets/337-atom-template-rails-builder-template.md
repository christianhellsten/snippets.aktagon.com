---
id: '337'
title: Atom template Rails builder template
languages:
- ruby
tags:
- docker
- kubernetes
- private
- registry
---

```ruby
atom_feed(:url => formatted_posts_url(:atom)) do |feed|
  feed.title(@category.name)
  feed.updated(@posts.first ? @posts.first.created_at : Time.now.utc)

  for post in @posts
    feed.entry(post) do |entry|
      entry.title(post.title)
      entry.content(post.body_html, :type => 'html')
      entry.updated post.updated_at

      for tag in post.tags
        entry.category :term => url_for(tag), :label => tag.name
      end
    end
  end
end
```
    

