---
id: '244'
title: Gmail checker plugin for wmii.
languages:
- ruby
tags:
---
I take no credit for this. The original URL is <http://dmy999.com/src/gmail-check.rb>. The reason it is here is that I don't want to lose it just in case the original site is taken down.


```ruby
#
# gmail check plug in
# by Derek Young
#
# periodically read gmail's atom feed for new messages.
# if one is found, display the username and subject of
# the message.
#
# The applet wakes up after a configurable period to check (by default
# 3 minutes).  You can also cause it to check immediately by pressing
# the key binding for the gmail-check binding (MODKEY-g by default).
#
# place this file in ~/.wmii-3/plugins and
# add the following to your wmiirc-config.rb file to enable:
# 
#  plugin_config["dmy999@gmail.com:gmail"]["username"] = 'my user name'
#  plugin_config["dmy999@gmail.com:gmail"]["password"] = 'my password'
#  plugin_config["dmy999@gmail.com:gmail"]["interval"] = 3
#  use_bar_applet "dmy999@gmail.com:gmail", 50
#  use_binding "dmy999@gmail.com:gmail-check"
#
# atom parsing based on code from Evan Martin
#  http://neugierig.org/software/misc/gmail-notifier
#
# Copyright Derek Young, 2007
# Use as you wish but please give credit.
#

Plugin.define "dmy999@gmail.com" do
  author '"Derek Young" <dmy999@gmail.com>'

  def_settings "gmail/interval" do |wmii|
    wmii.plugin_config["dmy999@gmail.com:gmail"]["interval"] = 3 * 60
  end

  CERTPATH = '/etc/ssl/certs'

  # return title, email, author name of first new message
  def gmail_check(username, password)
    req = Net::HTTP::Get.new '/mail/feed/atom'
    req.basic_auth(username, password)

    http = Net::HTTP.new('mail.google.com', 443)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER
    http.ca_path = CERTPATH

    res = http.request req

    doc = REXML::Document.new res.body
    entries = doc.root.get_elements('/feed/entry')
    return nil if entries.length == 0
    title = entries[0].elements['title'].text
    email = entries[0].elements['author/email'].text
    name = entries[0].elements['author/name'].text
    [ title, email, name ]
  end

  bar_applet("gmail", 100) do |wmii, bar|
    require 'net/https'
    require 'rexml/document'

    interval = wmii.plugin_config["dmy999@gmail.com:gmail"]["interval"]
    username = wmii.plugin_config["dmy999@gmail.com:gmail"]["username"]
    password = wmii.plugin_config["dmy999@gmail.com:gmail"]["password"]

    @gmail_check_thread = Thread.new do
      loop do
        bar.data = "checking..."
        first = gmail_check(username, password)
        if first
          title, email, name = first
          user, domain = email.split('@')
          bar.data = "#{user}:#{title}"
        else
          bar.data = 'no mail'
        end
        sleep (interval * 60)
      end
    end
  end

  binding("gmail-check", "MODKEY-g") do |wmii,|
    LOGGER.info "gmail check requested"
    @gmail_check_thread.run if @gmail_check_thread
  end

end
```
    

