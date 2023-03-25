---
id: '159'
title: Detecting file/data encoding with Ruby and the chardet RubyGem
languages:
- ruby
tags:
---
You can use the chardet gem to detect the charset of an arbitrary string.

Install the chardet gem by issuing the following command:


```ruby
$ sudo gem install chardet
```
    

Then in irb:


```ruby
require 'rubygems'
require 'UniversalDetector'
p UniversalDetector::chardet('Ascii text')
p UniversalDetector::chardet('åäö')
```
    

The output from this example is:


```ruby
{"encoding"=>"ascii", "confidence"=>1.0}
{"encoding"=>"utf-8", "confidence"=>0.87625}
```
    

For Python users there exists an identical library...

