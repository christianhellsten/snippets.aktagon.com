---
id: '243'
title: How to test Rails routing with RSpec
languages:
- ruby
tags:
---

```ruby
route_for(:controller => 'categories', :action => 'show', :permalink => ['one', 'two', 'three']).should.equal '/one/two/three'
route_for(:controller => 'categories', :action => 'index').should.equal '/'
      
params_from(:get, "/").should.equal {:controller => "categories", :action => "index"}
params_from(:get, "/something/").should.equal {:controller => "categories", :action => "show", :permalink => ["something"]}
```
    

The test\_spec\_on\_rails plugin also allow you to test routing and much more, see [the docs](http://github.com/uhlenbrock/test_spec_on_rails/tree/master) for more information.

