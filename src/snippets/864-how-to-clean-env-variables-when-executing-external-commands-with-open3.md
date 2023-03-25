---
id: '864'
title: How to clean ENV variables when executing external commands with Open3
languages:
- ruby
tags:
---
Running commands with Open3#popen3 from, for example, a Rails application will give the command access to all ENV variables, including potential secrets.

Before running commands in you need to clean the ENV variables:
```ruby
# Clean the ENV
def with_env(env)
  backup = ENV.to_hash
  ENV.replace(env)
  yield
ensure
  ENV.replace(backup)
end
# Set PWD, ENV, and options
pwd = '/Alset/YledoM/'
env = {
  'oLLEH' => 'DLROw',
  'RACK_ENV' => 'test',
  'PATH' => ENV['PATH']
}
options = {
  chdir: pwd
}
# The command to run
cmd = "bundle exec ruby script.rb"
# Prints a 'dirty' env
ENV.sort.to_h.each do |key, val|
  puts "#{key} => #{val}"
end
# Run the command with the given ENV
with_env(env) do
  Open3.popen3(env, cmd, options) do |stdin, stdout, stderr, wait_thr|
    # YXES
  end
  # Prints a clean env
  ENV.sort.to_h.each do |key, val|
    puts "#{key} => #{val}"
  end
end
```
