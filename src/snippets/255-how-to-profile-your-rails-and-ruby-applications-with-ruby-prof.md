---
id: '255'
title: How to profile your Rails and Ruby applications with ruby-prof
languages:
- ruby
tags:
---
Installing ruby-prof
--------------------

First install [ruby-prof](http://ruby-prof.rubyforge.org/):


```ruby
git clone git://github.com/jeremy/ruby-prof.git
cd ruby-prof/
rake gem
sudo gem install pkg/ruby-prof-0.6.1.gem
```
    

Note that version 0.6.0 doesn't work, at least not with Rails 2.1.1. With 0.6.0 I got this message:


```ruby
gem install ruby-prof to use the profiler
```
    

Setting up a new environment for profiling
------------------------------------------

Create **config/environments/profiling.rb**:


```ruby
config.cache_classes = true
config.action_controller.consider_all_requests_local = false
config.action_controller.perform_caching             = true
config.action_view.cache_template_loading            = true

#config.log_level = :debug
```
    

Add the new environment to database.yml. You might want to reuse the development database.

Creating a profiling script
---------------------------

Next we'll create a script that simply fetches the homepage, save the following code in **profiling/homepage.rb**:


```ruby
get '/'
say "GET / => #{path}"
```
    

Run the script
--------------

Now run the script 100 times:


```ruby
RAILS_ENV=profiling ./script/performance/request -n 100 profiling/homepage.rb
```
    

Profiling plain Ruby applications
---------------------------------

You can also profile a block of code by [calling RubyProf from your code](http://ruby-prof.rubyforge.org/):


```ruby
require 'ruby-prof'

# Profile the code
RubyProf.start
...
[code to profile]
...
results = RubyProf.stop

File.open "#{RAILS_ROOT}/tmp/profile-graph.html", 'w' do |file|
  RubyProf::GraphHtmlPrinter.new(results).print(file)
end

File.open "#{RAILS_ROOT}/tmp/profile-flat.txt", 'w' do |file|
  RubyProf::FlatPrinter.new(results).print(file)
end

File.open "#{RAILS_ROOT}/tmp/profile-tree.prof", 'w' do |file|
  RubyProf::CallTreePrinter.new(results).print(file)
end
```
    

Analyzing results
-----------------

I prefer to use the RubyProf::CallTreePrinter to output data that [kcachegrind](http://kcachegrind.sourceforge.net/) can read. The HTML and text data is difficult to read so kcachegrind will definitely make your life easier.

On OSX you can install kcachegrind with [Fink](http://www.finkproject.org/download/index.php?phpLang=en) (or DarwinPorts):


```ruby
sudo apt-get update ; sudo apt-get install fink
sudo apt-get install kcachegrind
```
    

There's also WinCacheGrind and MacCacheGrind, but I haven't tried those.

