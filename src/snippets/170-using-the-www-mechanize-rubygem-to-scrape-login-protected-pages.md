---
id: '170'
title: Using the WWW::Mechanize RubyGem to scrape login protected pages
languages:
- ruby
tags:
---
This is an example of how to access a login protected site with [WWW::Mechanize](mechanize.rubyforge.org). In this example, the login form has two fields named user and password.
In other words, the HTML contains the following code:


```ruby
<input name="user" .../>
<input name="password" .../>
```
    

Note that this example also shows how to enable WWW::Mechanize logging and how to capture the HTML response:


```ruby
require 'rubygems'
require 'logger'
require 'mechanize'

agent = WWW::Mechanize.new{|a| a.log = Logger.new(STDERR) }
#agent.set_proxy('a-proxy', '8080')
page = agent.get 'http://bobthebuilder.com'

form = page.forms.first
form.user = 'bob'
form.password = 'password'

page = agent.submit form

output = File.open("output.html", "w") { |file|  file << page.body }
```
    

Use the search method to scrape the page content. In this example I extract all text contained by span elements, which in turn are contained by a table element having a class attribute equal to 'list-of-links':


```ruby
puts page.search("//table[@class='list-of-links']//span/text()") # do |row|
```
    

The HTML looks like this (td, tr elements omitted for clarity):


```ruby
...
<table class="list-of-links">
...
<span>The content</span>
...
</table>
...
```
    

