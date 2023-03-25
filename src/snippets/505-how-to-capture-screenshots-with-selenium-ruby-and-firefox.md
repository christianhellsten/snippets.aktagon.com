---
id: '505'
title: How to capture screenshots with Selenium, Ruby and Firefox
languages:
- ruby
tags:
---
Option \#1 Selenium-WebDriver gem
---------------------------------

First install the selenium-webdriver gem:


```ruby
gem install selenium-webdriver
```
    

Then start using it:


```ruby
require 'selenium-webdriver'
width = 1024
height = 728
driver = Selenium::WebDriver.for :firefox
driver.navigate.to 'http://google.com'
driver.execute_script %Q{
  window.resizeTo(#{width}, #{height});
}
driver.save_screenshot('/tmp/screenshot.png')
driver.quit
```
    

[Reference](http://rubydoc.info/gems/selenium-webdriver/0.2.2/frames).

Option \#2 Selenium Server and the Selenium Gem
-----------------------------------------------

I was using this option for quite some time, when it stopped working I started using the selenium-webdriver gem instead.

First create a separate Firefox profile:


```ruby
firefox -ProfileManager -no-remote
```
    

Find the path to the profile by executing this code in the JavaScript error console in Firefox:


```ruby
Components.classes["@mozilla.org/file/directory_service;1"].getService( Components.interfaces.nsIProperties).get("ProfD", Components.interfaces.nsIFile).path
```
    

The path looks somewhat like this on OSX:


```ruby
/Users/christian/Library/Application Support/Firefox/Profiles/xxx
```
    

Now download the [Selenium Server](http://seleniumhq.org/download/). Then start a Selenium server:


```ruby
java -jar ~/Downloads/selenium-server-standalone-2.0b1.jar -firefoxProfileTemplate "/Users/christian/Library/Application Support/Firefox/Profiles/9eb0mn2d.screenshots/" -singleWindow
```
    

Next install the Selenium Ruby client:


```ruby
gem install selenium-client
```
    

Take a screenshot with Ruby:


```ruby
require 'rubygems'
require 'selenium'

@selenium = Selenium::SeleniumDriver.new("localhost", 4444, "*firefox", "http://www.cnn.com", 10000);
@selenium.start
@selenium.open "/US/"
@selenium.wait_for_page_to_load(60)
@selenium.send(:sleep, 7) # Wait for Flash and other crap to load
@selenium.capture_entire_page_screenshot('/tmp/screenshot.png', '');
@selenium.stop
```
    

Want more? Read the [Selenium RC](http://release.seleniumhq.org/selenium-remote-control/0.9.0/doc/ruby/) and [Selenium client documentation](http://selenium-client.rubyforge.org/classes/Selenium/Client/GeneratedDriver.html)

