---
id: '57'
title: 'Solution to "require'': no such file to load -- readline (LoadError)" problem'
languages:
- bash
tags:
---
If you've compiled Ruby from source, you might get this error when executing **script/console**:


```bash
/usr/local/lib/ruby/1.8/irb/completion.rb:10:in require': no such file to load -- readline (LoadError)
```
    

One way of fixing this is to compile readline, which is distributed along with the Ruby source:


```bash
cd /opt/src/ruby-1.8.5-p2/ext/readline
ruby extconf.rb
make
sudo make install
```
    

This works even after compiling Ruby, so no need to recompile... If you're wondering what readline is then this quote from the [project homepage](http://tiswww.case.edu/php/chet/readline/rltop.html) sums it up in one sentence:
"The GNU Readline library provides a set of functions for use by applications that allow users to edit command lines as they are typed in."

