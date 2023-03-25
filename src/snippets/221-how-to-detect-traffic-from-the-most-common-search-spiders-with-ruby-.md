---
id: '221'
title: 'How to detect traffic from the most common search spiders with Ruby '
languages:
- ruby
tags:
---
This snippet detects traffic from the following bots, which is enough for me:

-   Google - Googlebot/2.1 ( http://www.googlebot.com/bot.html)
-   Google Image - Googlebot-Image/1.0 ( http://www.googlebot.com/bot.html)
-   MSN Live - msnbot-Products/1.0 (+http://search.msn.com/msnbot.htm)
-   Yahoo - Mozilla/5.0 (compatible; Yahoo! Slurp;)

The code ([via](http://wiki.rubyonrails.org/rails/pages/UserAgent)):


```ruby
user_agent = request.user_agent.downcase
@bot = [ 'msnbot', 'yahoo! slurp','googlebot' ].detect { |bot| user_agent.include? bot }
```
    

When the Google bot visists your site the @bot string will contain 'googlebot'.

If you need to detect more bots than these, then the [user-agents.org](http://www.user-agents.org/) site contains a list of various user agents for both bots and browsers.

