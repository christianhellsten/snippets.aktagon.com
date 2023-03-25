---
id: '202'
title: Showing ActiveRecord error messages from jQuery Ajax actions and scripts
languages:
- ruby
tags:
- browser
- locale
- ruby
---
The HTML, in a layout file, for example application.html.erb:


```ruby
<div id="error-message" style="display:none">
</div>
```
    

The JavaScript, rendered by for example create.js.erb:


```ruby
<% if !@category.valid? %>
<%
  errors = <<ERR
  <p>Please fix the following errors:</p>
  <ul>
    #{@category.errors.collect{|err| "<li>" + err[0] + " " + err[1] + "</li>" } }
  </ul>
ERR
%>
$('#error-message').html('<%= escape_javascript(errors) %>');
$('#error-message').show();
<% else %>
$('#error-message').hide();
<% end %>
```
    

