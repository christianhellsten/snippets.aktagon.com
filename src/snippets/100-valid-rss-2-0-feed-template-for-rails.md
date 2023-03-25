---
id: '100'
title: Valid RSS 2.0 Feed Template for Rails
languages:
- ruby
tags:
---
If you like Atom more than RSS use the [atom\_feed\_helper](http://github.com/rails/atom_feed_helper/tree/master).

Here's the template, modify it to fit your needs. I know there are plugins and other ways of doing this, but I hate code that gets too abstract:


```ruby
<?xml version="1.0"?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
  <channel>
    <atom:link href="http://xxxxxxx" rel="self" type="application/rss+xml" />
    <title>Code Snippets - Aktagon</title>
    <link>http://snippets.aktagon.com/</link>
    <description>Share your code with the world. Allow others to review and comment.</description>
    <language>en-us</language>
    <pubDate><%= @snippets[0].created_at.rfc822 %></pubDate>
    <lastBuildDate><%= @snippets[0].created_at.rfc822 %></lastBuildDate>
    <docs>http://blogs.law.harvard.edu/tech/rss</docs>
    <generator>Aktagon Snippets</generator>
 <% for snippet in @snippets %>
    <item>
      <title><![CDATA[<%= snippet.title %>]]></title>
      <link><%= snippet_url(snippet) %></link>
      <description><![CDATA[<%= snippet.rendered_body %>]]></description>
      <pubDate><%= @snippets[0].created_at.rfc822 %></pubDate>
      <guid><%= snippet_url(snippet) %></guid>
	  <% for tag in snippet.tags%>
		<category domain="http://snippets.aktagon.com/snippets"><![CDATA[<%= tag.name %>]]></category>
	  <% end%>
    </item>
<% end %>
  </channel>
</rss>
```
    

Remember to serve the feed with the [correct HTTP headers](http://www.petefreitag.com/item/381.cfm).

It also helps to have an auto-discovery tag inside the head tag:


```ruby
<link rel="alternate" type="application/rss+xml" title="RSS feed" href="http://<%= request.host %>/rss/" />
```
    

