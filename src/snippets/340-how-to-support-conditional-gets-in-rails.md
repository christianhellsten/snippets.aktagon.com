---
id: '340'
title: How to support conditional gets in Rails
languages:
- ruby
tags:
---
From the [When to Tell Your Kids About Client Caching RailsConf presentation (PDF)](http://assets.en.oreilly.com/1/event/24/When%20to%20Tell%20Your%20Kids%20About%20Client%20Caching%20Presentation.pdf)


```ruby
def fresh?(response)
def stale?(:etag => @object, :last_modified => updated_at.utc)
def not_modified?(modified_at)
def etag_matches?(etag)
```
    


```ruby
class PeopleController < ApplicationController
	def show
		@person = Person.find(params[:id])
		response.last_modified = @person.updated_at.utc
		response.etag = @person	
		return head(:not_modified) if request.fresh?(response)

		respond_to do |wants|
			#...
		end
	end
end
```
    


```ruby
response.etag = @person # => “5cb44721b6ce18857ff6900486dc4aba”
@person.cache_key # => "people/5-20071224150000"
```
    


```ruby
class PeopleController < ApplicationController
	def show
		@person = Person.find(params[:id])
		if stale?(:etag => @person, :last_modified => @person.updated_at.utc)
			respond_to do |wants|
			#...
			end
		end
	end
end
```
    

