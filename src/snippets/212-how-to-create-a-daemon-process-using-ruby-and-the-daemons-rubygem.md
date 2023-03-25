---
id: '212'
title: How to create a daemon process using Ruby and the daemons RubyGem
languages:
- ruby
tags:
- golang
- html
- reload
- template
---
This snippets shows you how to create a daemon process out of an ordinary Ruby script.

First you'll need the daemons gem:


```ruby
gem install daemons
```
    

Then you'll need the daemon script, for example daemon.rb:


```ruby
require 'rubygems'
require 'daemons'

pwd  = File.dirname(File.expand_path(__FILE__))
file = pwd + '/../lib/background_service.rb'

Daemons.run_proc(
  'background_service', # name of daemon
#  :dir_mode => :normal
#  :dir => File.join(pwd, 'tmp/pids'), # directory where pid file will be stored
#  :backtrace => true,
#  :monitor => true,
  :log_output => true
) do
  exec "ruby #{file}"
end
```
    

Change the file variable to point to the script you want to daemonize and your good to go.

You can now execute the daemon.rb script without parameters to get a list of available commands for controlling the daemon process:


```ruby
ERROR: no command given

Usage: lib/background_service.rb <command> <options> -- <application options>

* where <command> is one of:
  start         start an instance of the application
  stop          stop all instances of the application
  restart       stop all instances and restart them afterwards
  run           start the application and stay on top
  zap           set the application to a stopped state

* and where <options> may contain several of the following:

    -t, --ontop                      Stay on top (does not daemonize)
    -f, --force                      Force operation

Common options:
    -h, --help                       Show this message
        --version                    Show version
```
    

