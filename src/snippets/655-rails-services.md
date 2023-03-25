---
id: '655'
title: Rails Services
languages:
- ruby
tags:
---
Put your business logic in a service layer, not in your controllers, helpers, models, or anywhere else.

**app/services/service.rb**:


```ruby
#
# Base service.
#
class Service
  def self.call(*args)
    new(*args).call
  end
end
```
    

**app/services/create\_report.rb**:


```ruby
#
# Create order user story.
#
class CreateOrder < Service
  def initialize(user, product)
    @user = user
    @product = product
    validate
  end

  def call
    Order.transaction do
      ...
    end
  end

  def validate
    ...
  end
end
```
    

Usage:


```ruby
class OrdersController # or OrderJob
  def create
    ...
    @order = CreateOrder.call(user, product)
    ...
  end
end
```
    

Naming conventions:
\* app/services/verb\_subject.rb
\* class VerbSubject
\* app/services/namespace/verb\_subject.rb
\* class Namespace::VerbSubject

Benefits:
\* maintainability
\* readability
\* testability
\* etc

