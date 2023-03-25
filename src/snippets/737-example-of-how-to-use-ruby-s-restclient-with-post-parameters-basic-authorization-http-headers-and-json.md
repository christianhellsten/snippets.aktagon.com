---
id: '737'
title: Example of how to use Ruby's RestClient with POST parameters, basic authorization,
  HTTP headers, and JSON
languages:
- ruby
tags:
---
Example of how to use Ruby's RestClient with POST parameters, basic authorization, HTTP headers, and JSON:


```ruby
response = RestClient::Request.new({
      method: :post,
      url: 'https://xyz,
      user: 'someone',
      password: 'mybirthday',
      payload: { post_this: 'some value', post_that: 'other value' },
      headers: { :accept => :json, content_type: :json }
    }).execute do |response, request, result|
      case response.code
      when 400
        [ :error, parse_json(response.to_str) ]
      when 200
        [ :success, parse_json(response.to_str) ]
      else
        fail "Invalid response #{response.to_str} received."
      end
    end
```
    

