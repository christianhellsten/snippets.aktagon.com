---
id: '61'
title: Installing Ultraviolet and Oniguruma
languages:
- bash
tags:
---
First install Oniguruma
-----------------------

[Oniguruma](http://www.geocities.jp/kosako3/oniguruma/) is a regular expression engine that [Ultraviolet](http://ultraviolet.rubyforge.org/) uses to parse text; Ruby also uses Oniguruma by the way. If you don't have Oniguruma on your system you'll get this error while installing Ultraviolet (at least on Ubuntu Linux):


```bash
oregexp.c:2:23: error: oniguruma.h: No such file or directory
```
    

This tells you that you should download and install Oniguruma. For me version 5.8.0 was the only version that worked, so execute this command to get the right version of Oniguruma:


```bash
$ wget http://www.geocities.jp/kosako3/oniguruma/archive/onig-5.8.0.tar.gz
```
    

You now have the source package on your computer, so decompress it with the following command:


```bash
$ tar zxvf onig-5.8.0.tar.gz
```
    

If everything went fine, change current directory:


```bash
$ cd onig-5.8.0/
```
    

Next, run configure:


```bash
$ ./configure
```
    

Watch the output closely and fix any errors reported, then run make:


```bash
$ make
```
    

To build and install Onigurama run:


```bash
$ sudo make install
```
    

I managed to get the following errors from Ultraviolet with other versions of Oniguruma, but these went away after installing 5.8.0 and re-installing Oniguruma:


```bash
Parsing error in // ==UserScript==: wrong number of arguments (2 for 0) #<Textpow::SyntaxNode:0xb7c91780>
```
    

Installing Ultraviolet and dependencies
---------------------------------------

Next install [Ultraviolet](http://ultraviolet.rubyforge.org/) with RubyGems:


```bash
$ sudo gem install -r ultraviolet --include-dependencies

Select which gem to install for your platform (i486-linux)
 1. oniguruma 1.1.0 (mswin32)
 2. oniguruma 1.1.0 (ruby)
 3. Skip this gem
 4. Cancel installation
> 2
Building native extensions.  This could take a while...
Successfully installed ultraviolet-0.10.0
Successfully installed textpow-0.9.0
Successfully installed oniguruma-1.1.0
Successfully installed plist-3.0.0
```
    

Test that Ultraviolet works by running the following code with irb:


```bash
$ irb

require 'rubygems'
require 'uv'
puts Uv.syntaxes.join( "\n" )
puts Uv.themes.join( "\n" )
input = <<HTML
<html>
  <body>
  </body>
</html>
HTML

puts Uv.parse( input, "xhtml", "html", true, "slush_poppies")
```
    

Problems
--------

You might get this error:


```bash
require 'uv'
LoadError: libonig.so.2: cannot open shared object file: No such file or directory - /usr/lib/ruby/gems/1.8/gems/oniguruma-1.1.0/lib/oregexp.so
```
    

This message is a bit confusing. It means Ruby can't find libonig.so.2, not oregexp.so as you could believe.

To fix this, check if the library has been linked:


```bash
$ ldconfig -p|grep libonig
```
    

If the library is not linked, add the path to the directory where the file is located to /etc/ld.so.conf:


```bash
/usr/local/lib

include /etc/ld.so.conf.d/*.conf
```
    

Then run:


```bash
$ ldconfig
```
    

Another way of fixing this problem would be to tell the build script to install it to /usr/lib.

