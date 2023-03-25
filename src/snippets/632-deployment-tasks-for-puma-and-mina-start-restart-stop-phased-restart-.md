---
id: '632'
title: Deployment Tasks for Puma and Mina (Start, Restart, Stop, Phased Restart)
languages:
- ruby
tags:
- sprockets
- webpacker
---

```ruby
def puma_conf
  @puma_conf ||= begin
    require 'puma/configuration'
    config = Puma::Configuration.new(config_file: "config/puma.rb.#{rails_env}")
    config.load
    OpenStruct.new(config.options)
  end
end

set :puma_cmd, 'bundle exec puma'
set :pumactl_cmd, 'bundle exec pumactl'
set :puma_state_path, puma_conf.state
set :puma_start_options, "-q -d -e #{rails_env}  -C config/puma.rb.#{rails_env}"

namespace :puma do
  desc 'Start puma'
  task :start => :environment do
    queue "cd #{full_current_path} && #{puma_cmd} #{puma_start_options}"
  end

  desc 'Stop puma'
  task :stop => :environment do
    queue "cd #{full_current_path} && #{pumactl_cmd} -S #{puma_state_path} stop"
  end

  desc 'Restart puma'
  task :restart => :environment do
    begin
      queue "cd #{full_current_path} && #{pumactl_cmd} -S #{puma_state_path} restart"
    rescue => ex
      puts "Failed to restart puma: #{ex}\nAssuming not started."
    end
  end

  desc 'Restart puma (phased restart)'
  task :phased_restart => :environment do
    run "cd #{full_current_path} && #{pumactl_cmd} -S #{puma_state_path} phased-restart"
  end
end
```
    

