---
id: '413'
title: How to access Amazon product data with Ruby/AWS and the Amazon Associates Web
  Services API
languages:
- ruby
tags:
- format
- google
- spreadsheet
- time
- '"time report"'
---
First you need to decide which of the following Ruby libraries you want to use:

\* [Ruby/AWS](http://raa.ruby-lang.org/project/ruby-aws/)
\* [amazon-ecs](http://www.pluitsolutions.com/projects/amazon-ecs)

You can also find the code on GitHub.

In this example I've decided to go with Ruby/AWS because \[insert reason here\].

Installing Ruby/AWS
-------------------


```ruby
curl -O http://www.caliban.org/files/ruby/ruby-aws-0.7.0.tar.gz
tar zxvf ruby-aws-0.7.0.tar.gz
cd ruby-aws-0.7.0
ruby setup.rb config
ruby setup.rb setup
sudo ruby setup.rb install
```
    

Using Ruby/AWS
--------------

With Ruby/AWS installed you can now run this code:


```ruby
#!/usr/bin/ruby -w

require 'amazon/aws'
require 'amazon/aws/search'
 
include Amazon::AWS
include Amazon::AWS::Search

# Example of a batch operation, using the ASIN as the shared ID.
#
# The MerchantId restriction is to ensure that we retrieve only items that
# are for sale by Amazon. This is important when we later want to retrieve the
# availability status.
#
il = ItemLookup.new( 'ASIN', { 'ItemId' => 'B000AE4QEC', 'MerchantId' => 'Amazon' })
 
# You can have multiple response groups.
#
rg = ResponseGroup.new( 'Medium', 'Offers', 'Reviews' )
 
req = Request.new()
req.locale = 'uk'
 
resp = req.search( il, rg )
item_sets = resp.item_lookup_response[0].items
 
item_sets.each do |item_set|
  item_set.item.each do |item|
    attribs = item.item_attributes[0]
    puts attribs.label
    if attribs.list_price
      puts attribs.title, attribs.list_price[0].formatted_price
    end
  
    # Availability has become a cumbersome thing to retrieve in AWSv4.
    #
    puts 'Availability: %s' %
      [ item.offers[0].offer[0].offer_listing[0].availability ]
    puts 'Average rating: %s' % [ item.customer_reviews[0].average_rating ]
    puts 'Reviewed by %s customers.' %
      [ item.customer_reviews[0].total_reviews ]
  
    puts 'Customers said:'
    item.customer_reviews[0].review.each do |review|
      puts ' %s (%s votes)' % [ review.summary, review.total_votes ]
    end
  
    puts
  end
end
```
    

You'll get this error:


```ruby
/opt/local/lib/ruby/site_ruby/1.8/amazon/aws.rb:138:in get_page': HTTP response code 400 (Amazon::AWS::HTTPError)
```
    

You probably ran the code after August 2009 which is when Amazon started requiring signed requests.

Now if you run the code with **ruby -d code.rb** you'll see that the request signature is missing:


```ruby
<?xml version="1.0"?>
<ItemSearchErrorResponse xmlns="http://ecs.amazonaws.com/doc/2008-08-19/"><Error><Code>MissingParameter</Code><Message>The request must contain the parameter Signature.</Message></Error><RequestID>13563d70-7696-4b8f-afa3-064184874620</RequestID></ItemSearchErrorResponse>
```
    

This takes us to the next topic.

Configuring Ruby/AWS
--------------------

Create a file called **~/.amazonrc** and put the following in it:


```ruby
key_id = 'xxx'
secret_key_id = 'xxx'
associate = 'xxx-20'
cache = false
locale = 'uk'
encoding = 'iso-8859-15'
```
    

Next sign up you need to:

-   [Become an Amazon affiliate](http://docs.amazonwebservices.com/AWSECommerceService/2009-03-31/GSG/index.html?BecominganAssociate.html)
-   Find your Access Key ID (key\_id) and Secret Access Key (secret\_key\_id) [on the following page](https://aws-portal.amazon.com/gp/aws/developer/account/index.html?ie=UTF8&action=access-key)
-   Create an tracking ID (associate\_id)

That's it. If you want, [have a look at the examples](http://github.com/res0nat0r/ruby-aws/tree/master/example)

