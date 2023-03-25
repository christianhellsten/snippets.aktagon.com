---
id: '541'
title: Autotest for Sinatra
languages:
- ruby
tags:
- copy
- import
- psql
- stdin
---
Guard
-----

Add this to a file named Guardfile in your app directory:


```ruby
# gem install guard guard-minitest
# https://github.com/guard/guard#readme

guard 'minitest' do
  watch(%r{^app/(.+)\.rb$})   { |m| "test/app/#{m[1]}_test.rb" }
  watch(%r{^lib/(.+)\.rb$})   { |m| "test/lib/#{m[1]}_test.rb" }
  watch(%r{^test/(.+)\.rb$})  { |m| "test/#{m[1]}.rb" }
end
```
    

Watchr
------

Put this in test/test.watchr ([inspired by Padrino](https://raw.github.com/padrino/padrino-recipes/master/files/watchrs/test.watchr)):


```ruby
#
# From https://raw.github.com/padrino/padrino-recipes/master/files/watchrs/test.watchr
#
# install watchr
# $ gem install watchr
#
# Run With:
# $ watchr test.watchr
#

# --------------------------------------------------
# Helpers
# --------------------------------------------------

def run(cmd)
  exec = "bundle exec ruby #{cmd}"
  puts(exec)
  system(exec)
end
 
def run_all 
  system("bundle exec rake test")
end

# --------------------------------------------------
# Watchr Rules
# --------------------------------------------------
watch("^lib/(.*)\.rb")                     { |m| run("test/lib/#{m[1]}_test.rb") }

watch("^(.*)/controllers/(.*).rb")           { |m| run("test/#{m[1]}/controllers/#{m[2]}_controller_test.rb") }
watch("^test/(.*)/controllers/(.*)_test.rb") { |m| run("test/#{m[1]}/controllers/#{m[2]}_test.rb") }

watch("^(.*)/models/(.*).rb")                { |m| run("test/#{m[1]}/models/#{m[2]}_test.rb") }
watch("^test/(.*)/(.*)_test.rb")             { |m| run("test/#{m[1]}/models/#{m[2]}_test.rb") }

watch("test.*/test_helper\.rb")              { run_all }
watch("^test/(.*)_test\.rb")                 { |m| run("test/#{m[1]}_test.rb") }

# --------------------------------------------------
# Signal Handling
# --------------------------------------------------
# Ctrl-\ or Ctrl-ö (Swedish keyboard)
Signal.trap('QUIT') do
  puts "Quitting..."
  abort("\n") 
end

# Ctrl-C
Signal.trap('INT') do 
  puts " --- Running all tests ---\n\n"
  run_all
end

# Find your signals...
#Signal.list.each do |name, num|
#  Signal.trap(num) do 
#    puts "#{name}"
#  end rescue "xx"
#end
```
    

Put this in .bash\_profile or .zsh/aliases:


```ruby
alias autotest='watchr test/test.watchr'
```
    

Install watchr:


```ruby
gem install watchr
```
    

Test your code:


```ruby
exec # reload profile
autotest
```
    

You can also use [Guard](https://github.com/guard/guard) or autotest. Although improvements have been made during the years, they are all IMHO flawed pieces of software and badly documented.

