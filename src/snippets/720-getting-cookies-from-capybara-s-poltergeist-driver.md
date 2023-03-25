---
id: '720'
title: Getting cookies from Capybara's Poltergeist driver
languages:
- ruby
tags:
---
List cookies:


```ruby
page.driver.browser.cookies
```
    

Remove cookie:


```ruby
page.driver.browser.remove_cookie 'hello'
```
    

Also see [show\_me\_the\_cookies](https://github.com/nruth/show_me_the_cookies/blob/master/lib/show_me_the_cookies/adapters/poltergeist.rb)

