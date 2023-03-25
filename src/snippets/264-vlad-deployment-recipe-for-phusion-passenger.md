---
id: '264'
title: Vlad deployment recipe for Phusion Passenger
languages:
- ruby
tags:
- generate_series
- months
- sql
---

```ruby
#
# General configuration
#
#set :ssh_flags,             '-p 110000'
set :application,           'app.xxx'
set :domain,                'x.x.x.x'
set :deploy_to,             '/var/www/app.xxx'
set :revision,              'master'
set :repository,            '/var/lib/git/repositories/app.xxx/'


namespace :vlad do
  set :app_command, "/etc/init.d/apache2"
 
  desc 'Restart Passenger'
  remote_task :start_app, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
  
  desc 'Restarts the apache servers'
  remote_task :start_web, :roles => :app do
    run "sudo #{app_command} restart"
  end
end
```
    

