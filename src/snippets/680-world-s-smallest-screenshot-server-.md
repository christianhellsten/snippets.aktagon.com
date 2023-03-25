---
id: '680'
title: World's Smallest Screenshot Server?
languages:
- ruby
tags:
---

```ruby
require 'base64'
require 'selenium-webdriver'

class ScreenshotMiddleware
  def initialize(app)
    @app = app
  end

  def screenshot(url, width, height, file)
    begin
      driver = Selenium::WebDriver.for :firefox
      driver.manage.window.resize_to(width, height)
      driver.navigate.to url
      driver.save_screenshot("screenshots/#{file}")
      file
    ensure
      driver.quit
    end
  end

  def call(env)
    req = Rack::Request.new(env)
    width = req.params.fetch('width') { 1024 }
    height = req.params.fetch('height') { 768 }
    url = req.params.fetch('url')
    file = Base64.urlsafe_encode64(req.params.inspect) + ".png"
    screenshot(url, width, height, file)
    env['PATH_INFO'] = "/#{file}"
    @app.call(env)
  end
end

use ScreenshotMiddleware
run Rack::URLMap.new  "/" => Rack::Directory.new('screenshots')
```
    

Also see [How to capture screenshots with Selenium, Ruby and Firefox](http://snippets.aktagon.com/snippets/505-how-to-capture-screenshots-with-selenium-ruby-and-firefox).

[Screenshot server API](https://github.com/christianhellsten/screenshot-server)

