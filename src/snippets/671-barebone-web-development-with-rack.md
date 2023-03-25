---
id: '671'
title: Barebone Web Development With Rack
languages:
- ruby
tags:
---
Create a file named **config.ru**:


```ruby
run lambda { |env|
  [200, {"Content-Type" => "text/html"}, [view(env)]]
}

def view(env)
  res = ""
  res << "<html><body><pre>"
  env.sort.each do |key, value|
    res << "#{key}: #{value}"
    res << "\n"
  end
  res << "</pre></body></html>"
  res
end
```
    

Start the server with e.g. **rackup**, puma, or thin:


```ruby
$ rackup
```
    

Access http://localhost:9292 to see the request headers.

