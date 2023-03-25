---
id: '518'
title: "How to use the Hominid Ruby gem to send newsletters through MailChimpâ\x80\x99s
  API"
languages:
- ruby
tags:
---
This example uses an existing campaign as a template for subsequent campaigns:


```ruby
require 'hominid' # https://github.com/terra-firma/hominid

key = 'xxx' # MailChimp API key

h = Hominid::API.new(key, {:secure => true, :timeout => 60})

#
# List campaigns & templates
#
campaigns = h.campaigns
templates = h.templates
lists = h.lists

# From the lists above
campaign_id = '111'
list_id = '222'
template_id = 333

#
# Create a campaign
#
# http://apidocs.mailchimp.com/1.3/campaigncreate.func.php

options = { :list_id => list_id, :template_id => template_id, :subject => 'xxx' }
campaign = h.campaign_create('regular', options, content)

#
# Copy a campaign
#
new_campaign_id = h.campaign_replicate(campaign_id)

#
# Update a campaign
# 
html_title = 'XXX'
html_description = 'Hello!'
html_content = %Q{
  <div>
    <h2>WOW</h2>
  </div>
}

#
# In this example we have a template with 3 editable content areas
# that are marked with mc:edit="title", mc:edit="description", mc:edit="content"
# See templates documentation for details
#
content = { 'html_title' => html_title, 'html_description' => html_description, 'html_content' => html_content }

result = h.campaign_update(new_campaign_id, :content, content)

#
# Send a campaign
#
# http://apidocs.mailchimp.com/1.3/campaignsendnow.func.php
# http://apidocs.mailchimp.com/1.3/campaignsendtest.func.php
#
result = h.campaign_send_now(new_campaign_id, %w(bill.gates@gmail.com))

#
# Templates
#
# http://kb.mailchimp.com/article/getting-started-with-mailchimps-template-language
# http://kb.mailchimp.com/article/template-language-creating-editable-content-areas/

#
# View available content areas:
#
result = h.campaign_template_content(new_campaign_id)
```
    

