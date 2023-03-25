---
id: '743'
title: HTTP parameter named "action" is reserved in Rails
languages:
- ruby
tags:
---
The "action" and "controller" HTTP parameters are reserved in Rails, so you cannot access them through the params object.

To access them you can do this:

```ruby
def index
  if request.post?
    request.POST['action']
  else
    request.GET['action']
  end
end
```
