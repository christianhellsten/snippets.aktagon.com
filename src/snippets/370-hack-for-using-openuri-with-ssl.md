---
id: '370'
title: Hack for using OpenURI with SSL
languages:
- ruby
tags:
- createcontainerconfigerror
- k8s
- kubectl
---
This problem occurs with OpenURI and Ruby 1.8:


```ruby
/usr/lib/ruby/1.8/net/http.rb:586:in connect': SSL_connect returned=1 errno=0 state=SSLv3 read server certificate B: ce
rtificate verify failed (OpenSSL::SSL::SSLError)
        from /usr/lib/ruby/1.8/net/http.rb:586:in connect'
        from /usr/lib/ruby/1.8/net/http.rb:553:in do_start'
        from /usr/lib/ruby/1.8/net/http.rb:542:in start'
        from /usr/lib/ruby/1.8/open-uri.rb:242:in open_http'
```
    

With Ruby 1.9 you have an option to fix it like this:


```ruby
open(uri,:ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE)
```
    

For Ruby 1.8 you could do this:


```ruby
require 'open-uri'
require 'openssl'

url = 'https://www....'
proxy = 'http://...'

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

puts open(url, :proxy => proxy).read
```
    

[Code found here](http://www.peterkrantz.com/2007/open-uri-cert-verification/)

