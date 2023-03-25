---
id: '467'
title: 'How to support optional variables in ERB templates '
languages:
- ruby
tags:
- frameworks
- golang
- web-development
---
This will give the variable "something" a value of "nothing" if it's not defined:


```ruby
<%
  something = 'nothing' if local_assigns.has_key? :something
%>
```
    

