---
id: '703'
title: How to introduce Rubocop in your project
languages:
- ruby
tags:
---
Installation
------------

Edit Gemfile:


```ruby
group :development do
  gem 'rubocop' # Style guide checker
  gem 'guard-rubocop' # Rubocop plugin for Guard
end
```
    

Install:


```ruby
$ bundle
```
    

Usage
-----

Run Rubocop:


```ruby
$ rubocop --auto-gen-config
```
    

Tweaking
--------

Edit .rubocop.yml:


```ruby
inherit_from: .rubocop_todo.yml
```
    

Introduce new rules gradually in priority order by enabling and moving rules from .rubocop\_todo.yml to .rubocop.yml.

You can also use the Ruby style-guide's rubocop configuration:
<https://github.com/bbatsov/rubocop/blob/master/config/default.yml>

Workflow integration
--------------------

Run:


```ruby
$ guard init rubocop
```
    

Edit Guardfile:


```ruby
guard :rubocop, all_on_start: false, cli: ['--format', 'clang', '--rails'] do
  watch(%r{.+\.rb$})
  watch(%r{(?:.+/)?\.rubocop\.yml$}) { |m| File.dirname(m[0]) }
end
```
    

Editor Integration
------------------

Optionally, integrate Rubocop with your editor:
\* [Textmate](https://github.com/mrdougal/textmate2-rubocop#installation)
\* [Vim](https://github.com/ngmy/vim-rubocop)

CI integration
--------------

See [How to introduce rubocop and integrate into Jenkins](https://speakerdeck.com/ma2gedev/how-to-introduce-rubocop-and-integrate-into-jenkins).

