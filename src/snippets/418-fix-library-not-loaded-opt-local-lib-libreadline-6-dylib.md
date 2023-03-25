---
id: '418'
title: 'Fix: Library not loaded: /opt/local/lib/libreadline.6.dylib'
languages:
- bash
tags:
---
If you get this error:


```bash
% script/console
Loading development environment (Rails 2.3.4)
/Library/Ruby/Site/1.8/universal-darwin10.0/readline.bundle: dlopen(/Library/Ruby/Site/1.8/universal-darwin10.0/readline.bundle, 9): Library not loaded: /opt/local/lib/libreadline.6.dylib (LoadError)
  Referenced from: /Library/Ruby/Site/1.8/universal-darwin10.0/readline.bundle
  Reason: image not found - /Library/Ruby/Site/1.8/universal-darwin10.0/readline.bundle
        from /System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/lib/ruby/1.8/irb/completion.rb:10
        from /System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/lib/ruby/1.8/irb/init.rb:253:in require'
        from /System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/lib/ruby/1.8/irb/init.rb:253:in load_modules'
        from /System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/lib/ruby/1.8/irb/init.rb:251:in each'
        from /System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/lib/ruby/1.8/irb/init.rb:251:in load_modules'
        from /System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/lib/ruby/1.8/irb/init.rb:21:in setup'
        from /System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/lib/ruby/1.8/irb.rb:54:in start'
        from /usr/bin/irb:13
```
    

then this might help:


```bash
mv /Library/Ruby/Site/1.8/universal-darwin10.0/readline.bundle /tmp
```
    

If not move it back. I got the error after having used and uninstalled MacPorts. Using Homebrew now...

