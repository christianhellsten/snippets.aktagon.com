---
id: '84'
title: How to parse RI generated documentation using RDoc and Ruby
languages:
- ruby
tags:
- haproxy
- openssl
- ssl
---
RI stores the generated documentation as YAML files. This code uses RDoc to parse the YAML files:


```ruby
require 'yaml'
require 'find'
require "rdoc/ri/ri_driver"

dirs = RI::Paths::PATH
dirs.each do |dir|
  Find.find(dir) do |fn|
    next unless File.file?(fn)
    doc = YAML.load(File.read(fn))
    next unless doc.respond_to?(:comment)
    next unless doc.comment
    
    # Print name of object
    puts doc.full_name
    
    # Print the body: RDoc comments, but only partial...
    puts doc.comment.map{|f| f.body if f.respond_to?(:body)}.join("\n")
  end
end
```
    

Originally from the article [Fun with Ferret](http://datanoise.com/articles/2006/9/5/fun-with-ferret).

