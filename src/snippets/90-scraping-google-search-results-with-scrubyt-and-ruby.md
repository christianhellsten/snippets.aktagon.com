---
id: '90'
title: Scraping Google search results with Scrubyt and Ruby
languages:
- ruby
tags:
- go
- golang
- sqlx
---
Note that these instructions don't work with the latest Scrubyt version...

Scrubyt is a Ruby library that allows you to easily scrape the contents of any site.

First install Scrubyt:
----------------------


```ruby
$ sudo gem install mechanize hpricot parsetree ruby2ruby scrubyt
```
    

You also need to install ReadLine version 3.6.3:


```ruby
sudo gem install -v 3.6.3 RubyInline
```
    

If you install the wrong RubyInline version or have multiple versions installed, you'll get the following error:


```ruby
/usr/lib/ruby/1.8/rubygems.rb:207:in activate': can't activate RubyInline (= 3.6.3), already activated RubyInline-3.6.6] (Gem::Exception)
       from /usr/lib/ruby/1.8/rubygems.rb:225:in activate'
       from /usr/lib/ruby/1.8/rubygems.rb:224:in each'
       from /usr/lib/ruby/1.8/rubygems.rb:224:in activate'
       from /usr/lib/ruby/1.8/rubygems/custom_require.rb:32:in require'
       from t2:2
```
    

To fix it first uninstall the latest version, and keep only version 3.6.3:


```ruby
sudo gem uninstall RubyInline

Select RubyGem to uninstall:
 1. RubyInline-3.6.3
 2. RubyInline-3.6.6
 3. All versions
> 2
```
    

Scraping Google search results
------------------------------

Then run this to Scrape the first two pages of the Google results for **ruby**:


```ruby
require 'rubygems'
require 'scrubyt'

# See http://scrubyt.org/example-specification-from-the-page-known-issues-and-pitfalls/

# Create a learning extractor
data = Scrubyt::Extractor.define do
  fetch('http://www.google.com/')
  fill_textfield 'q', 'ruby'
  submit
  
  # Teach Scrubyt what we want to retrieve
  # In this case we want Scruby to find all search results
  # and "Ruby Programming Language" happens to be the first 
  # link in the result list. Change "Ruby Programming Language" 
  # to whatever you want Scruby to find.
  link do
    name  "Ruby Programming Language"
    url   "href", :type => :attribute
  end
  
  # Click next until we're on the second page.
  next_page "Next", :limit => 2
end

# Print out what Scruby found
puts data.to_xml 

puts "Your production scraper has been created: data_extractor_export.rb."

# Export the production version of the scraper
data.export(__FILE__)
```
    

Learning Extractor vs Production extractor
------------------------------------------

Note that this example uses the [Learning Extractor](http://scrubyt.org/example-specification-from-the-page-known-issues-and-pitfalls/) functionality of Scrubyt.

The production extractor is generated with the last line:


```ruby
data.export(__FILE__)
```
    

If you open the production extractor in an editor you'll see that it uses XPath queries to extract the content:


```ruby
link("/html/body/div/div/div/h2", { :generalize => true }) do
    name("/a[1]")
    url("href", { :type => :attribute })
  end
```
    

Finding the correct XPath
-------------------------

The learning mode is pretty good at finding the XPath of HTML elements, but if you have difficulties getting Scrubyt to extract exactly what you want, simply install Firebug and use the Inspect feature to select the item you want to extract the value from. Then right-click on it in the Firebug window and choose Copy XPath.

Note that there's a [gotcha](http://groups.google.com/group/firebug/browse_thread/thread/b3f9b0893c1ad7e1) when copying the XPath of an element with Firebug. Firebug uses Firefox's internal and normalized DOM model, which might not match match the real-world HTML structure. For example the tbody tag is usually added by Firefox/Firebug, and should be removed if it isn't in the HTML.

Another option that I haven't tried myself is to use the [XPather](https://addons.mozilla.org/en-US/firefox/addon/1192) extension.

Using hpricot to find the XPath
-------------------------------

If you're really having problems finding the right XPath of an element, you can also use HPricot to find it. In this example the code prints out the XPath to all table columns containing the text 51,999:


```ruby
require 'rexml/document'
require 'hpricot'
require 'open-uri'

url = "http://xyz"

page = Hpricot(open(url,
	'User-Agent' => 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en-US; rv:1.8.1.12) Gecko/20080201 Firefox/2.0.0.12',
        'Referer'    => 'http://xyz'
    	))

page.search( "//td:contains('51,992')" ).each do |row|
  puts row.xpath()
end
```
    

The output from the above snippet looks something like this:


```ruby
/html/body/table[2]/tr[2]/td[3]
/html/body/table[2]/tr[2]/td[3]/table[4]/tr[1]/td[1]
/html/body/table[2]/tr[2]/td[3]/table[4]/tr[1]/td[1]/table[1]/tr[2]/td[2]
```
    

Note that sometimes I find that hrpicot is easier to use than Scrubyt, so use what's best for you.

Miscellaneous problems
----------------------

The following problem can be solved by following the instructions found [here](http://agora.scrubyt.org/forums/3/topics/270):


```ruby
Your production scraper has been created: data_extractor_export.rb.
/var/lib/gems/1.8/gems/ParseTreeReloaded-0.0.1/lib/parse_tree_reloaded.rb:129:in extend': wrong argument type Class (expected Module) (TypeError)
       from /var/lib/gems/1.8/gems/ParseTreeReloaded-0.0.1/lib/parse_tree_reloaded.rb:129:in to_sexp'
       from /var/lib/gems/1.8/gems/ParseTreeReloaded-0.0.1/lib/parse_tree_reloaded.rb:93:in parse_tree_for_method'
       from /var/lib/gems/1.8/gems/ruby2ruby-1.1.6/lib/ruby2ruby.rb:1063:in to_sexp'
```
    

