---
id: '333'
title: My Sinatra+Capistrano+Capinatra deployment recipe
languages:
- ruby
tags:
---

```ruby
require 'capistrano/version'
require 'rubygems'
require 'capinatra'
load 'deploy' if respond_to?(:namespace) # cap2 differentiator

# set an app_class if you're using the more recent style of creating
# Sinatra apps, where app_class would be the name of your subclass
# of Sinatra::Base. if you're just requiring 'sinatra' and using the
# more traditional DSL style of Sinatra, then comment this line out.
set :app_class, 'xxx'

# standard settings
set :app_file, "xxx.rb"
set :application, "xxx"
set :domain, "xxx.com"
role :app, domain
role :web, domain
role :db,  domain, :primary => true

set :ssh_options, { :forward_agent => true }

#set :use_sudo, false

# environment settings
set :user, "xxx"
set :group, "www-data"
set :deploy_to, "/var/www/#{application}"
set :deploy_via, :copy #:remote_cache
default_run_options[:pty] = true

# scm settings
set :repository, "git@xxx.com:xxx.git"
#set :repository, "file:///home/git/repositories/xxx.git"
set :scm, "git"
set :branch, "master"
set :git_enable_submodules, 1

# where the apache vhost will be generated
set :apache_vhost_dir, "/etc/apache2/sites-enabled/"

namespace :deploy do
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end
```
    

