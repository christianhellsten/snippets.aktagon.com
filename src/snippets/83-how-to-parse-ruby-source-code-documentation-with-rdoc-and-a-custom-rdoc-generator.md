---
id: '83'
title: How to parse Ruby source code documentation with RDoc and a custom RDoc generator
languages:
- ruby
tags:
---
This is a skeleton for an RDoc generator that extends the existing HtmlGenerator. This means we get the same documentation as seen at, for example, http://api.rubyonrails.org/; with links and HTML formatted documentation.

It can be used for doing whatever you would like and can imagine doing with RDoc documentation. Currently it prints out the files, modules, classes and methods found in the processesed files.

To use it, create a new file named **custom\_generator.rb** in the Ruby installation and the subfolder **/rdoc/generators**. Then put the following code in the file:


```ruby
require 'rdoc/generators/html_generator'

module Generators

  class HTMLGenerator
  
    # We don't need a template
    def load_html_template
    end

    def generate(toplevels)             
      @toplevels  = toplevels
      @files      = []
      @classes    = []

      build_indices
      
      puts "===================="
      puts "Files"
      puts "===================="
      
      @files.each do |item|
        puts item.name
        #values = file.value_hash
        #puts item.description
      end
      
      puts "===================="
      puts "Modules and classes"
      puts "===================="           
      
      @classes.each do |item|
        puts item.name
        #values = file.value_hash
        #puts item.description
      end
      
      puts "===================="
      puts "Methods"
      puts "===================="      
      
      HtmlMethod.all_methods.each do |item|
        puts item.name
      end
    end
  end
  
  class HtmlFile
    # Add a description method, after all HtmlMethod has it...
    def description
      value_hash if @values.size == 0      
      @values["description"]
    end
  end
  class HtmlClass
    # Add a description method, after all HtmlMethod has it...
    def description
      value_hash if @values.size == 0      
      @values["description"]
    end
  end
  
  class CUSTOMGenerator < HTMLGenerator
  end

end
```
    

Then run the custom generator by using the fmt parameter:


```ruby
rdoc --fmt custom lib/base64.rb lib/pp.rb
```
    

You can also control RDoc programatically, with the following code:


```ruby
#!/usr/bin/env ruby
require 'rdoc/rdoc'

rm -rf doc

begin
  r = RDoc::RDoc.new
  r.document(['--inline-source', '--fmt', 'custom'] + ARGV)
rescue RDoc::RDocError => e
  $stderr.puts e.message
  exit(1)
end
```
    

