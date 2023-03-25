---
id: '894'
title: How to call JavaScript code from Ruby
languages:
- javascript
- js
- ruby
tags:
---
Gemfile:

```ruby
source 'https://rubygems.org'
gem "therubyracer"
# commonjs.rb provides 'require' needed to import modules
gem 'commonjs'
```

add_with_javascript.rb:

```javascript
require 'v8'
require 'commonjs'
env = CommonJS::Environment.new(V8::Context.new, path: './node_modules')
env.require('add.js').add(2, 2)
```

node_modules/add.js:

```js
function add(a, b) {
  // Require works, if the package is available in node_modules
  // require('xyz');
  // Console is not available by default
  // console.log(msg);
  return a + b;
}

exports.add = add;
```

```ruby
$ bundle exec ruby add_with_javascript.rb
```

Tested with:
- commonjs (0.2.7)
- libv8 (3.16.14.19)
- therubyracer (0.12.3)
