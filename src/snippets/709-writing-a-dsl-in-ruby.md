---
id: '709'
title: Writing a DSL in Ruby
languages:
- ruby
tags:
---
When defining a simple DSL instance\_eval and instance\_exec is your friend:


```ruby
class Worker
  attr_reader :where
  def call(where, &block)
    @where = where
    instance_eval &block
  end

  def cut_trees
    puts "Cutting trees"
  end

  def make_planks
    puts "Making planks"
  end

  def i(what, &block)
    instance_eval &block
  end
end

def work where, &block
  puts "Working #{where}"
  Worker.new.(where, &block)
  puts "Going home"
end
```
    

Use the DSL like this:


```ruby
work "in the woods" do
  cut_trees
  make_planks
  i "take a coffee break" do
    puts "Cooking coffee #{where}"
  end
end
```
    

Output is:


```ruby
Working in the woods
Cutting trees
Making planks
Cooking coffee in the woods
Going home
```
    

instance\_exec method allows you to pass arguments to your blocks, which instance\_eval doesn't allow.

