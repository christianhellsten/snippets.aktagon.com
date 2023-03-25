---
id: '25'
title: How to pipe input to a Perl script
languages:
- perl
tags:
---
Let's say you want to pipe some input to a Perl script. First, you create this Perl script (pipe\_me.pl):


```perl
while (<>) 
{
  print $_;
}
```
    

Then you call the script like this:


```perl
less access.log | perl pipe_me.pl
```
    

The script outputs the contents of access.log. To do some real work extend it with your own code--you might want to, for example, analyze an Apache access log.

You can also read the input line by line like this:


```perl
foreach $line (<>) 
{
  print $line;
}
```
    

