---
id: '445'
title: How to create a JSONP cross-domain webservice with Sinatra and Ruby
languages:
- ruby
tags:
---
Your [Sinatra](http://sinatrarb.com) app:


```ruby
get '/' do
    callback = params.delete('callback') # jsonp
    json = {'your' => 'data'}.to_json

    if callback
      content_type :js
      response = "#{callback}(#{json})" 
    else
      content_type :json
      response = json
    end
    response
  end
```
    

Your HTML:


```ruby
<script type="text/javascript">
    function parseResponse(json) {
    // Do something with the data
    }
    </script>
    <script type="text/javascript" src="http://xxx.com/?callback=parseResponse"></script>
```
    

You can also do the same with jQuery:


```ruby
$.ajax({
    type: 'get',
    url: '/',
    dataType: 'jsonp',
    success: function(data) {
      parseResponse(data);
    }
})
```
    

