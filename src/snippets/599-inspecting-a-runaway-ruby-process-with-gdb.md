---
id: '599'
title: Inspecting a runaway Ruby process with GDB
languages:
- ruby
tags:
---
Here's how to inspect a live Ruby process that is eating 100% CPU:

First:


```ruby
sudo apt-get install gdb
```
    

Then ~/.gdbinit:


```ruby
define eval
  call(rb_p(rb_eval_string_protect($arg0,(int*)0)))
end

define redirect_stdout
  call rb_eval_string("$_old_stdout, $stdout = $stdout, File.open('/tmp/ruby-debug.' + Process.pid.to_s, 'a'); $stdout.sync = true")
end
```
    

Now:


```ruby
$ sudo gdb attach <PID>
(gdb) redirect_stdout
(gdb) eval("Kernel.caller")
(gdb) eval "ObjectSpace.each_object {|o| puts \"#{o.class.name}, #{o.inspect} -- #{o.object_id}\" unless o.is_a?(String) }; puts '----'"
```
    

Thanks:
http://rrn.dk/running-ruby-process-callstack
http://www.coffeepowered.net/2010/08/23/mongomapper-development-mode-and-memory-leaks/

