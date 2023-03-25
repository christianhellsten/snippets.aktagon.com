---
id: '162'
title: Recursively add files to ClearCase
languages:
- ruby
tags:
---
This script adds all files in the current directory to ClearCase.

Save the following script as add\_recursively.rb in the directory you want to add to ClearCase:


```ruby
%x{cleartool ls -view_only -r -s . > view_private_files.txt}

lines = File.open('view_private_files.txt').readlines.collect{|line| %Q{"#{line.chomp}"} }

# Work around command line length limit in Windows
while lines.size > 0
  %x{cleardlg /addtosrc #{lines.slice!(0..100).join(' ')}}
end
```
    

Next open a command line window and execute the script:


```ruby
cd clearcase_vob
ruby add_recursively.rb
```
    

ClearCase sucks, use Mercurial or git instead...

