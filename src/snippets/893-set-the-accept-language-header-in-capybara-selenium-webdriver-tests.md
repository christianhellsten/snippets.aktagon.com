---
id: '893'
title: Set the accept-language header in Capybara / Selenium WebDriver tests
languages:
- ruby
tags:
---
To change the accept-language header that Chrome sends with each request in Capybara tests, add the 'selenium-webdriver (3.142.6)' preference to the driver's options:

```ruby
  opts.add_preference('intl.accept_languages', 'sv')
```

Example:

```ruby
Capybara.register_driver :chrome do |app|
  caps = Selenium::WebDriver::Remote::Capabilities.chrome(loggingPrefs: { browser: 'ALL' })
  opts = Selenium::WebDriver::Chrome::Options.new
  opts.add_preference('intl.accept_languages', 'sv')
  chrome_args = %w[--no-sandbox --disable-popup-blocking --enable-features=NetworkService,NetworkServiceInProcess --window-size=1920,1080]
  chrome_args.each { |arg| opts.add_argument(arg) }
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: opts, desired_capabilities: caps)
end
```

Tested with:
- capybara (3.30.3)
- selenium-webdriver (3.142.6)

