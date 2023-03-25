---
id: '594'
title: Sample Unicorn configuration file
languages:
- ruby
tags:
---

```ruby
# See http://unicorn.bogomips.org/Unicorn/Configurator.html for complete documentation
app_name = "xxx"
rack_env = (ENV['RACK_ENV'] || :production).to_sym
puts "Starting app in #{rack_env} mode..."

if rack_env == :production
  working_directory "/var/www/#{app_name}/current"
  worker_processes 4
else
  working_directory "."
  worker_processes 1
end

listen "/tmp/#{app_name}.sock", :backlog => 64
listen 5000, :tcp_nopush => true
pid "/tmp/#{app_name}.pid"

# Set this to true with Rails
preload_app false

# 10 second
timeout 10

stderr_path "./log/unicorn.stderr.log"
stdout_path "./log/unicorn.stdout.log"

before_fork do |server, worker|

  # there's no need for the master process to hold a db connection
  #defined?(ActiveRecord::Base) and
   # ActiveRecord::Base.connection.disconnect!

  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end

after_fork do |server, worker|

  # the following is *required* for Rails + "preload_app true"
  #defined?(ActiveRecord::Base) and
   # ActiveRecord::Base.establish_connection

  # Save pids for monit's sake
  child_pid = server.config[:pid].sub('.pid', ".#{worker.nr}.pid")
  system("echo #{Process.pid} > #{child_pid}")
end
```
    

