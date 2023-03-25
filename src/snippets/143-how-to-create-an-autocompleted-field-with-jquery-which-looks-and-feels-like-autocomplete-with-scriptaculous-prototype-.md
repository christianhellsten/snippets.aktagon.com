---
id: '143'
title: 'How to create an autocompleted field with jQuery, which looks and feels like
  autocomplete with Scriptaculous & prototype '
languages:
- javascript
tags:
---
There are a lot of autocomplete plugins for jQuery, but not one of them seems to work similarly to Scriptaculous, except for the one at [bassistance.de](http://bassistance.de/jquery-plugins/jquery-plugin-autocomplete/).

To use it follow the instructions found [here](http://bassistance.de/jquery-plugins/jquery-plugin-autocomplete/).

There are a couple of gotchas for ex-scriptaculous users, like that the controller should return the list of tags with a newline character as separator, compared to an HTML list with Scriptaculous.

The other gotcha is the syntax, which is a lot prettier than Scriptaculous:


```javascript
<script type="text/javascript">
$("#tags-field").autocomplete("/tags/autocomplete", {
	multiple: true,
	autoFill: true,
	minChars: 3
});
</script>
```
    

Remember that /tags/autocomplete should render a list of tags delimited by linefeeds:


```javascript
ruby
php
java
perl
python
```
    

Note that jQuery sends the user typed text in a request parameter named 'q', so jQuery makes the following request to your controller: '/tags/autocomplete?q=ruby'.

The list that's shown when you type something can be styled with these CSS rules:


```javascript
div.ac_results {
	width: 350px;
	background: #fff;
}

div.ac_results ul {
	border:1px solid #888;
	margin:0;
	padding:0;
	width:100%;
	list-style-type:none;
}

div.ac_results ul li {
	margin:0;
	padding:3px;
}

// Hovering over list item
div.ac_results ul li.ac_over {
	background-color: #ffb;
}
```
    

The plugins documentation is quite good, but for some reason it was easier to figure out what was needed to get it working by reading the code.

