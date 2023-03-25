---
id: '246'
title: How to parse CSV data with Ruby
languages:
- ruby
tags:
- ansible
- debug
- hostvars
- variables
---
Ruby alternatives for parsing CSV files
---------------------------------------

-   Ruby String\#split (slow)
-   Built-in CSV (ok, recommended)
-   ccsv (fast & recommended if you have control over CSV format)
-   CSVScan (fast & recommended if you have control over CSV format)
-   [Excelsior](http://www.toastyapps.com/excelsior/) (fast & recommended if you have control over CSV format)

CSV library benchmarks can be found [here](http://blog.grayproductions.net/articles/no_longer_the_fastest_game_in_town) and [here](http://blog.evanweaver.com/articles/2007/09/29/not-invented-here/)

Parsing with plain Ruby
-----------------------


```ruby
filename = 'data.csv'
file = File.new(filename, 'r')

file.each_line("\n") do |row|
  columns = row.split(",")
  
  break if file.lineno > 10
end
```
    

This option has several problems...

Parsing with the built-in CSV library
-------------------------------------


```ruby
require 'csv'

CSV.open('data.csv', 'r', ';') do |row|
  puts row
end
```
    


```ruby
require 'csv'

CSV.foreach("changes.csv", quote_char: '"', col_sep: ';', row_sep: :auto, headers: true) do |row|
  puts row[0]
  puts row['xxx']
end
```
    

Parsing with the ccsv library
-----------------------------

[ccsv is hosted on GitHub](https://github.com/evan/ccsv/).


```ruby
require 'rubygems'
require 'ccsv'

Ccsv.foreach(file) do |values|
  puts values[0]
end
```
    

Parsing with the CSVScan library
--------------------------------

[CSVScan can be downloaded from here](http://raa.ruby-lang.org/project/csvscan/).


```ruby
require "csvscan"

open("data.csv") do |io|
  CSVScan.scan(io)  do|row|
    puts row
  end
end
```
    

