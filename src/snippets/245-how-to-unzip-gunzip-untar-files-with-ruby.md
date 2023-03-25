---
id: '245'
title: How to unzip, gunzip, untar files with Ruby
languages:
- ruby
tags:
---
This is a very advanced and resource efficient algorithm for expanding compressed content with Ruby:


```ruby
def gunzip(filename)
  command = "gunzip --force #{filename}"
  success = system(command)
  
  success && $?.exitstatus == 0
end
```
    

To customize, change gunzip to whatever command you like.

For example, to avoid 100% CPU utilization during uncompression, set the niceness value of the command with **nice -n 5 <command>**:


```ruby
command = "nice -n 5 gunzip --force #{filename}"
```
    
The niceness goes from -20 to 19. The lower the number the higher the priority.

There's also ionice...

If you want you can also use GzipReader:


```ruby
res = RestClient.get(url)
body = res.body
body = Zlib::GzipReader.new(StringIO.new(body)).read if res.headers[:content_type].include?('gzip')
```
    

