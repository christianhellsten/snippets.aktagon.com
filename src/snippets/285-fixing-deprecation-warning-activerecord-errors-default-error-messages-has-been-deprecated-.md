---
id: '285'
title: 'Fixing "DEPRECATION WARNING: ActiveRecord::Errors.default_error_messages has
  been deprecated."'
languages:
- ruby
tags:
- pg_current_wal_flush_lsn
- pg_last_wal_receive_lsn
- postgres
- replication
- streaming
---
With versions prior to Rails 2.2 you used to be able to translate ActiveRecord error messages through this method:


```ruby
ActiveRecord::Errors.default_error_messages[:too_long] = " är för långt (max %d tecken)"
```
    

Now with Rails 2.2 you'll get this error message:


```ruby
DEPRECATION WARNING: ActiveRecord::Errors.default_error_messages has been deprecated. Please use I18n.translate('activerecord.errors.messages').. (called from default_error_messages at /usr/local/lib/ruby/gems/1.8/gems/activerecord-2.2.2/lib/active_record/validations.rb:24)
```
    

In the view you'll see something like:


```ruby
* Stad translation missing: sv, activerecord, errors, models, order, attributes, city, too_short
```
    

To fix this, first create lib/initializers/i18n.rb:


```ruby
I18n.load_path += Dir[ File.join(RAILS_ROOT, 'lib', 'locale', '*.{rb,yml}') ]
I18n.default_locale = "en" # default language
```
    

This file initializes the i18n library, telling it where to find the translations and what the default locale is.

Next, create the file containing translations, for example lib/locale/en.yml:


```ruby
"en":
  activerecord:
      errors:
        templates:
          header:
            one: "1 error prohibited this {{model}} from being saved"
            other: "{{count}} errors prohibited this {{model}} from being saved"
          body: "there were problems with the following fields:"
        messages:
          accepted: "must be accepted"
          blank: "can't be blank"
          confirmation: "doesn't match confirmation"
          empty: "can't be empty"
          equal_to: "must be equal to {{count}}"
          even: "must be even"
          exclusion: "is reserved"
          greater_than: "must be greater than {{count}}"
          greater_than_or_equal_to: "must be greater than or equal to {{count}}"
          inclusion: "is not included in the list"
          invalid: "is invalid"
          less_than: "must be less than {{count}}"
          less_than_or_equal_to: "must be less than or equal to {{count}}"
          not_a_number: "is not a number"
          odd: "must be odd"
          taken: "is already taken"
          too_long: "is too long (maximum is {{count}} characters)"
          too_short: "is too short (minimum is {{count}} characters)"
          wrong_length: "is the wrong length (should be {{count}} characters)"
```
    

Credits go to [this thread](http://groups.google.com/group/rails-i18n/browse_thread/thread/ac1d532999a9f79f) which is where I found the code.

The I18n project has translations for most languages so it's best to copy them from there. For example, Swedish translation of text in Rails can be found here:
<http://github.com/svenfuchs/rails-i18n/raw/master/rails/locale/sv-SE.yml>

Translating attribute names
---------------------------

Use this code to translate the attribute names:


```ruby
class Order < ActiveRecord::Base

  def self.human_attribute_name(attr)
    I18n.t("#{class_name.downcase}.#{attr.to_sym}") || super
  end
```
    

Translating everything else
---------------------------

A full list of things you can translate can be found on the [rails i18n wiki](http://rails-i18n.org/wiki/pages/translations-available-in-rails)

