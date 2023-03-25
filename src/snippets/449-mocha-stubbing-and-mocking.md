---
id: '449'
title: Mocha stubbing and mocking
languages:
- ruby
tags:
- docker
- docker-compose
- no-www
- redirect
---
Mocking with expectations:


```ruby
@domain = Domain.new
Domain.expects(:new).returns(@domain)
@domain.errors.add(:name, 'WTF')
```
    

Stubbing:


```ruby
Domain.stubs(:new).returns(@domain)
```
    

