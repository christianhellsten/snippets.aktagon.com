---
id: '149'
title: 'Populating a table with n checkbox fields '
languages:
- ruby
tags:
---
Let's say you have 10 checkboxes and you want to display 4 per line as shown here:


```ruby
x  x  x  x
x  x  x  x
x  x
```
    

This can be achieved with the following code:


```ruby
<table>
<% 
	from = 0
	to   = checkboxes.size
	cols = 4

	from.step(to, cols) do |i| 
%>
	<tr>
	<% for checkbox in checkboxes.slice(i..i + (cols -1)) %>
   		<td><input type="checkbox" id="<%= checkbox.name %>" name="column" value="<%= checkbox.value %>"/> <label for="<%= column.name %>"><%= column.name%></label></td>
	<% end %>
	</tr>
<% end %>
</table>
```
    

If you're using Rails you can also use the built in method described [here](http://weblog.rubyonrails.org/2006/03/01/new-in-rails-enumerable-group_by-and-array-in_groups_of/).


```ruby
%w(1 2 3 4 5 6 7).in_groups_of(3) {|g| p g}
["1", "2", "3"]
["4", "5", "6"]
["7", nil, nil]
```
    

You can also use the [Enumerator class](http://www.ruby-doc.org/stdlib/libdoc/enumerator/rdoc/index.html)

