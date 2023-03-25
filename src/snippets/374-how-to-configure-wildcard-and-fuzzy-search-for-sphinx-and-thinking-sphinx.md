---
id: '374'
title: How to configure wildcard and fuzzy search for Sphinx and Thinking Sphinx
languages:
- ruby
tags:
---
This how-to explains how to configure wildcard and fuzzy search for Sphinx and the Thinking Sphinx Rails plugin.

Configure wildcard and fuzzy search in your model
-------------------------------------------------

First set the enable\_star and min\_infix\_len properties inside the define\_index block:


```ruby
class Post...
  define_index do
   ...

    set_property :enable_star => true
    set_property :min_infix_len => 1 
  end
```
    

Optionally you can make the settings global by adding them to **config/sphinx.yml**:


```ruby
production:
    enable_star: true
    min_infix_len: 1
```
    

Stop, configure, reindex and start Sphinx
-----------------------------------------

For Sphinx to pickup the changes we need to stop, configure, reindex and start Sphinx.
Thinking Sphinx has some rake tasks that allow you to do this:


```ruby
RAILS_ENV=xxx
rake ts:stop
rake ts:conf
rake ts:in
rake ts:start
```
    

Verify Sphinx configuration
---------------------------

Now open the Sphinx configuration file in an editor:


```ruby
$ vim config/production.sphinx.conf
```
    

Verify that you can see the correct settings:


```ruby
...
index post_core
{
...
   min_infix_len = 1
   enable_star = true
}
...
```
    

Test
----

Fire up the console and run some queries:


```ruby
Post.search('xxx', :star => true)
```
    

Create a search controller
--------------------------

Now all that's left is to create the search controller and view:


```ruby
class SearchController...
  def index
    @query = params[:query]
    options = {
            :page => params[:page], :per_page => params[:per_page], :star => true,
            :field_weights => { :title => 20, :tags => 10, :body => 5 }
    }
    @posts = Post.search(@query, options)
  end
```
    

Note that to get relevant search results you need to assign different weights to fields.

And finally, here's the view code:


```ruby
<% @posts.each do |post| %>
Nude pics go here...
<% end %>
```
    

References
----------

[Thinking Sphinx advanced documentation](http://freelancing-god.github.com/ts/en/advanced_config.html)
[Sphinx Documentation: min\_infix\_len](http://www.sphinxsearch.com/docs/current.html#conf-min-infix-len)
[Sphinx Documentation: min\_prefix\_len](http://www.sphinxsearch.com/docs/current.html#conf-min-prefix-len)
[Sphinx Documentation: enable\_star](http://www.sphinxsearch.com/docs/current.html#conf-enable-star)

