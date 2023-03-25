---
id: '52'
title: 'Fixing "warning: already initialized constant OPTIONS"'
languages:
- bash
tags:
---
If you're using Edge Rails and mongrel you might have seen this error:


```bash
warning: already initialized constant OPTIONS
```
    

There's a bug report [here](http://dev.rubyonrails.org/ticket/9743) that explains this problem in detail.

The solution for me was to rerun the freeze command:


```bash
rake rails:freeze:edge
```
    

You might also get "warning: already initialized constant OPTIONS" error if you haven't installed a gem your software relies on. In the following example openssl should be installed:


```bash
/usr/local/lib/ruby/site_ruby/1.8/rubygems/custom_require.rb:27:in gem_original_require’: no such file to load—openssl (MissingSourceFile)
```
    

ActiveResource might also be the problem:


```bash
gem install activeresource --source http://gems.rubyonrails.org
```
    

