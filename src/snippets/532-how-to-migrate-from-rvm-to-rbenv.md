---
id: '532'
title: How to migrate from rvm to rbenv
languages:
- ruby
tags:
---
These instructions explain how to migrate from rvm to rbenv.

Uninstall & Install
-------------------

Start by executing the following command:


```ruby
rvm implode.
```
    

Next:

1. Install rbenv

Follow installation instructions found [here](https://github.com/sstephenson/rbenv#readme)

2. Install ruby-build

Follow instructions found [here](https://github.com/sstephenson/ruby-build)

3. Install REE


```ruby
ruby-build ree-1.8.7-2011.03 $HOME/.rbenv/versions/ree-1.8.7-2011.03
```
    

Need Ruby 1.9? Check which versions of Ruby rbenv supports with this command:


```ruby
ruby-build --definitions
```
    

4. Set global ruby

Edit ~/.rbenv/default and add:


```ruby
ree-1.8.7-2011.03
```
    

RVM Gemsets
-----------

You don't really need RVM gemsets as Bundler can install everything under your application directory. All you have to do is create the file ~/.bundle/config and put the following in it:


```ruby
---
   BUNDLE_PATH: vendor/bundle
```
    

This will tell bundler to install the gems in vendor/bundle instead of the global environment. Verify that the configuration is okay by executing the following command:


```ruby
% bundle config
Settings are listed in order of priority. The top value will be used.

path
  Set for the current user (/Users/christian/.bundle/config): "vendor/bundle"

disable_shared_gems
  Set for your local app (/Users/christian/Projects/xxx/.bundle/config): "1"
```
    

Create alias for 'bundle exec'
------------------------------

With RVM out of the picture you'll have to run commands with 'bundle exec'.

Add this to <sub>/.bash\_profile\\ or</sub>/.zsh/aliases:


```ruby
alias b='bundle exec'
```
    

This will save you some typing by allowing:


```ruby
b rails console # same as "bundle exec rails console"
```
    

Gotchas
-------

\* If you have issues compiling ree because of readline errors, make sure you have the latest version of ruby-build and then try specifying some options when compiling:


```ruby
CONFIGURE_OPTS="-c --enable-shared -c --with-readline-dir=/usr/local/Cellar/readline/6.2.1/" ruby-build ree-1.8.7-2011.03 ~/.rbenv/versions/ree-1.8.7-2011.03
```
    

\* System wide installation can be achieved as outlined in [this gist](https://gist.github.com/1237417).

