---
id: '590'
title: Zombie.js + CoffeeScript example
languages:
- javascript
tags:
- form_for
- view_component
---

```javascript
#
# Run:
# coffee -w test.coffee http://localhost:3000
#
# Installation:
#
# npm install coffee zombie
#
# Uses:
#
# Zombie
# http://zombie.labnotes.org/API
#
# CoffeeScript
# http://coffeescript.org/documentation/docs/command.html
#
# assert:
# http://nodejs.org/docs/v0.3.1/api/assert.html
#
Browser = require("zombie")
assert = require('assert')

class SignUpTest
  constructor: (@base_url) ->
    @url = @base_url + "/users/new"
    console.log @url
    this.run()
  run: ->
    browser = new Browser()
    browser.on "error", (error) ->
      console.error "Error: " + error
      #console.dir("Errors:", browser.errors)
    browser.visit @url, (error, browser) =>
      assert.ok browser.success
      rand = Math.floor(Math.random() * 10000)
      email = "jesus#{rand}@localhost"
      console.log email
      browser.fill('#input-email', email)
      browser.fill('#input-password', 'jes')
      browser.fill('#input-password-confirmation', 'jes')
      #console.log browser.html()
      browser.pressButton 'Sign up', ->
        assert.ok browser.success

url = process.argv[2] # e.g. http://localhost:3000
new SignUpTest(url)
```
    

