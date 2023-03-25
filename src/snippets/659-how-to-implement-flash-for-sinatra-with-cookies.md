---
id: '659'
title: How to Implement Flash for Sinatra with Cookies
languages:
- css
- javascript
- ruby
tags:
---
Storing your application's flash messages in a cookie means you can cache the whole page.

## Ruby/Sinatra

```ruby
def flash(key, value)
  fail "Invalid key '#{key}'" unless [ :info, :error ].include?(key)
  response.set_cookie "flash_#{key}", value: I18n.t(value), path: '/'
end
```
    

Put the code in a helper or controller.

## Javascript

```javascript
var Flash;

Flash = (function() {
  function Flash(flash_holder, cookie_prefix) {
    this.flash_holder = flash_holder;
    this.cookie_prefix = cookie_prefix;
    if (this.flash_holder == null) {
      this.flash_holder = '#flash';
    }
    if (this.cookie_prefix == null) {
      this.cookie_prefix = 'flash_';
    }
  }

  Flash.prototype.show = function() {
    var i, key, len, name, ref, results, value;
    ref = ['info', 'error'];
    results = [];
    for (i = 0, len = ref.length; i < len; i++) {
      key = ref[i];
      name = this.cookie_prefix + key;
      value = Cookies.get(name);
      if (value) {
        $(this.flash_holder).attr('class', name).html(value).show('fast');
        results.push(Cookies.remove(name));
      } else {
        results.push(void 0);
      }
    }
    return results;
  };

  return Flash;

})();

$(function() {
  new Flash().show();
  return new Flash('#flash_holder', 'cookie_prefix').show();
});
```
    

## HTML


```javascript
<div id="#flash"></div>
```
    

## CSS


```css
#flash {
  display: none
}

.flash_info {
  color: darkgreen
}

.flash_error {
  color: darkred
}
```
    

Usage
-----

In your controller:


```javascript
get '/' do
  flash :info, 'login.failed'
end
```
    

## Dependencies

* [js-cookie](https://github.com/js-cookie/js-cookie)
* I18n gem

