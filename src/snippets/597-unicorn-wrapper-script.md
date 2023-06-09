---
id: '597'
title: Unicorn Wrapper Script
languages:
- ruby
tags:
---

```ruby
#!/bin/sh
# Description:
#
# Wrapper script for your unicorn masters and workers.
#
# Installation:
#
# 1. Put this script in your application's scripts directory.
#
# 2. Create config/unicorn.rb and include the following:
#
#    working_directory "/var/www/#{app_name}/current"
#    pid "./tmp/pids/unicorn.pid"
#
#    # Zero-downtime restarts
#    before_fork do |server, worker|
#      old_pid = "#{server.config[:pid]}.oldbin"
#      if File.exists?(old_pid) && server.pid != old_pid
#        begin
#          Process.kill("QUIT", File.read(old_pid).to_i)
#        rescue Errno::ENOENT, Errno::ESRCH
#          # someone else did our job for us
#        end
#      end
#    end
#
#    after_fork do |server, worker|
#      # save pids
#      child_pid = server.config[:pid].sub('.pid', ".#{worker.nr}.pid")
#      system("echo #{Process.pid} > #{child_pid}")
#    end
#
# 3. Use this script to start and stop your unicorns:
#
#    Start unicorn master:
#    scripts/unicorn start
#
#    Stop unicorn master:
#    scripts/unicorn start
#
#    Upgrade unicorn master with zero downtime:
#    scripts/unicorn upgrade
#
#    Kill a unicorn worker
#    scripts/unicorn kill-worker 0
#

set -e

sig () {
  test -s "$PID" && kill -$1 cat "$PID"
}

oldsig () {
  test -s "$OLD_PID" && kill -$1 cat "$OLD_PID"
}

workersig () {
  test -s "$WORKER_PID" && kill -$1 cat $WORKER_PID
}

cmd () {
  setup $1 $2
  case $1 in
    start)
      sig 0 && echo >&2 "Unicorn master already running" && exit 0
      echo "Starting Unicorn master"
      $CMD &
      ;;
    stop)
      sig QUIT && echo "Stopping unicorn master" && exit 0
      echo >&2 "Unicorn master not running"
      ;;
    force-stop)
      sig TERM && echo "Forcing unicorn master to stop" && exit 0
      echo >&2 "Unicorn master not running"
      ;;
    kill-worker)
      workersig QUIT && echo "Forcing worker to stop" && exit 0
      echo >&2 "Unicorn worker $WORKER_PID not running"
      ;;
    restart|reload)
      sig USR2 && sleep 5 && oldsig QUIT && echo "Killing old master" cat $OLD_PID && exit 0
      echo >&2 "Couldn't reload unicorn master, starting '$CMD' instead"
      $CMD
      ;;
    upgrade)
      sig USR2 && echo Upgraded && exit 0
      echo >&2 "Couldn't upgrade unicorn master, starting '$CMD' instead"
      $CMD
      ;;
    rotate)
      sig USR1 && echo rotated logs OK && exit 0
      echo >&2 "Couldn't rotate unicorn logs" && exit 1
      ;;
    *)
      echo >&2 "Usage: $0 <start|stop|restart|upgrade|rotate|kill-worker|force-stop>"
      exit 1
      ;;
    esac
}

setup () {
  # Figure out application directory from this file's location
  #APP_ROOT="$( cd -P "$( dirname $0 )/.." && pwd )"
  APP_ROOT="$(pwd)"

  # Figure out application environment
  if [ -z "$RACK_ENV" ]; then RACK_ENV=$RAILS_ENV; fi
  if [ -z "$RACK_ENV" ]; then RACK_ENV='production'; fi

  export RACK_ENV

  echo "Application environment is $RACK_ENV"
  echo "cd $APP_ROOT" && cd $APP_ROOT || exit 1

  # include rbenv paths
  export PATH=$PATH:/home/deploy/.rbenv/shims:/home/deploy/.rbenv/bin
  # master unicorn pid
  export PID=$APP_ROOT/tmp/pids/unicorn.pid
  # old master unicorn pid
  export OLD_PID="$PID.oldbin"

  if [ "$1" = "kill-worker" ]; then
    # unicorn worker pid
    WORKER_PID=$APP_ROOT/tmp/pids/unicorn.$2.pid
  fi

  if [ "$1" = "start" ]; then
    # run unicorn command with bundler
    CMD="bundle exec unicorn_rails -c $APP_ROOT/config/unicorn.rb -E $RACK_ENV -D"
    echo "$CMD"
  fi
}

cmd $1 $2
```
    

