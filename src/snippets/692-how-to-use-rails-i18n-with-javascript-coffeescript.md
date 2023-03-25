---
id: '692'
title: How to Use Rails I18n With JavaScript/CoffeeScript
languages:
- javascript
tags:
---
Option 1: Include all translations
----------------------------------

Your app/assets/javascripts/i18n.js.coffee.erb file:


```javascript
root = exports ? this
I18n = <%= I18n.backend.send(:translations).to_json.html_safe %>
$ ->
  root.I18n = I18n[$('body').data('lang')]
```
    

Option 2: Include a limited set of translations
-----------------------------------------------

Your app/assets/javascripts/i18n.js.coffee.erb file:


```javascript
root = exports ? this

I18n =
<%
I18n.available_locales.each do |lang|
  I18n.with_locale lang do
%>
  <%= lang %>:
    text: "<%= I18n.t("js.text") %>"
<%
  end
end
%>

$ ->
  root.I18n = I18n[$('body').data('lang')]
```
    

Include the Selected Locale in the Rails Layout
-----------------------------------------------

The view defines the user's selected locale:


```javascript
<body data-lang="<%= I18n.locale %>">
...
</body>
```
    

How to Translate JavaScript Strings
-----------------------------------

We can now translate strings in a JavaScript file:


```javascript
# remember to use $(document).ready...
alert(I18n.text)
```
    

