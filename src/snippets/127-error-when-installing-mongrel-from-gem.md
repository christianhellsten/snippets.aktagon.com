---
id: '127'
title: Error when installing Mongrel from gem
languages:
- bash
tags:
---
I received the following error when installing Mongrel from the gem repository:


```bash
marko@x61s:$ sudo gem install mongrel
Updating metadata for 281 gems from http://gems.rubyforge.org
complete
Building native extensions.  This could take a while...
ERROR:  Error installing mongrel:
	ERROR: Failed to build gem native extension.

/usr/bin/ruby1.8 extconf.rb install mongrel
extconf.rb:1:in require': no such file to load -- mkmf (LoadError)
	from extconf.rb:1
```
    

The fix is to install the ruby development package:


```bash
sudo apt-get install ruby1.8-dev
```
    

