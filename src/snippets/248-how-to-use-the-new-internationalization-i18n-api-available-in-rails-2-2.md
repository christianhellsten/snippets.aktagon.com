---
id: '248'
title: How to use the new internationalization (I18n) API available in Rails 2.2
languages:
- ruby
tags:
---
Not yet released, but you can try it out by first installing the i18n gem:


```ruby
sudo gem install i18n
```
    

And then testing the following code:


```ruby
require 'rubygems'
require 'i18n'

I18n.store_translations 'en-US',
	:yes => "yes",
	:no => "no", 
	:inbox => {
	  :one => '1 message', 
	  :other => '{{count}} messages'
	}

I18n.store_translations 'sv',
	:yes => "ja",
	:no => "nej", 
	:inbox => {
	  :one => '1 meddelande', 
	  :other => '{{count}} meddelanden'
	}

I18n.locale = 'en-US'

puts I18n.translate(:yes)
puts I18n.translate(:inbox, :count => 1)
puts I18n.translate(:inbox, :count => 2)
puts I18n.localize Time.now


I18n.locale = 'sv'


puts I18n.translate(:yes)
puts I18n.translate(:inbox, :count => 1)
puts I18n.translate(:inbox, :count => 2)
puts I18n.localize Time.now
```
    

Troubleshooting
---------------

Note that the gem doesn't contain localization data, so you'll get the following error:


```ruby
translation missing: en-US, time, formats (I18n::MissingTranslationData)
```
    

To fix this, simply tell the I18n gem where to find the locales you want to use:


```ruby
I18n.load_translations "#{RAILS_ROOT}/locales/#{locale}.rb"
```
    

Creating a shortcut for i18n.translate
--------------------------------------

I recommend you create a shortcut for I18n.translate to the Symbol and String classes:


```ruby
class Symbol
	def t(params = {})
		I18n.t(self, params)
	end
end

class String
	def t(params = {})
		I18n.t(self.to_s, params)
	end
end
```
    

Now instead of this:


```ruby
puts I18n.translate(:yes)
puts I18n.translate(:inbox, :count => 1)
puts I18n.translate(:inbox, :count => 2)
```
    

You can type:


```ruby
puts :yes.t
puts :inbox.t(:count => 1)
puts :inbox.t(:count => 2)
```
    

Handling missing translations
-----------------------------

You can use this code to change the default behavior for missing translations, instead of showing "Missing translation" this code allows you to log the missing translation:


```ruby
module I18n
  module DateTimeExtensions

    def l(params = {})
      params.update({:format => :short})

      I18n.l(self, params)
    end
  end

  module StringExtensions

    def t(params = {})
      params.update({:raise => true})

      key = self
      key = self.downcase.to_s if key.is_a?(String)

      begin
        I18n.t(key, params)
      rescue I18n::MissingTranslationData
        RAILS_DEFAULT_LOGGER.info("Translation for '#{self}' is missing")
        self
      end
    end
  end

end

class Symbol
  include I18n::StringExtensions
end

class String
  include I18n::StringExtensions
end

class Time
  include I18n::DateTimeExtensions
end
```
    

References
----------

1.  <http://github.com/svenfuchs/i18n/>
2.  <http://github.com/clemens/i18n_demo_app/>
3.  <http://www.artweb-design.de/2008/7/18/the-ruby-on-rails-i18n-core-api>
4.  [How to use the new I18n API with Rails](http://almosteffortless.com/2008/07/21/simple-localization-in-rails-22/)


