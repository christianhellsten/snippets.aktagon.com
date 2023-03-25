---
id: '602'
title: 'How to fix "(103)Software caused connection abort: proxy: pass request body"'
languages:
- apacheconf
tags:
- activerecord
- analyze
- explain
---
If you find this in your Apache error logs:


```apacheconf
[error] (103)Software caused connection abort: proxy: pass request body failed to 127.0.0.1:50000 (127.0.0.1)                                                                           
[error] proxy: pass request body failed to 127.0.0.1:50000 (127.0.0.1) from 1.1.1.1.1 ()
```
    

Make sure you have read the [Apache manuals](http://httpd.apache.org/docs/current/mod/mod_proxy.html#proxypass)

Also read the "BalancerMember parameters" and "Balancer parameters" sections, e.g. maxattempts.

Relevant settings to test with your application and configuration might be:


```apacheconf
SetEnv proxy-sendchunked 1
SetEnv proxy-sendchunks 1

SetEnv downgrade-1.0 1
SetEnv proxy-sendcl 1
```
    

It all depends on where Apache is sending the requests and what features the backend supports.

If you're using Unicorn with e.g. Rails then read:
http://unicorn.bogomips.org/DESIGN.html
http://unicorn.bogomips.org/PHILOSOPHY.html

Unicorn doesn't support nokeepalive for a reason, so maybe you should switch to [Rainbows!](http://rainbows.rubyforge.org/), thin and/or nginx.

If changing the server you use is not an option, you could try:


```apacheconf
SetEnv force-proxy-request-1.0 1
  SetEnv proxy-nokeepalive 1
```
    

or e.g.:


```apacheconf
BalancerMember xxx keepalive=Off maxattempts=2
```
    

If you have issues with large file uploads and unicorn, [this might help](http://rubyforge.org/pipermail/mongrel-unicorn/2011-September/001195.html).
</code>

