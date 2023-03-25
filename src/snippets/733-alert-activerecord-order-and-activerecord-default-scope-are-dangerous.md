---
id: '733'
title: 'ALERT: ActiveRecord#order and ActiveRecord#default_scope are dangerous'
languages:
- ruby
tags:
---
Consider this model:


```ruby
class Transaction
  default_scope -> { order("created_at ASC") }

  def self.latest
    order('created_at DESC')
  end

   def self.approved_for_customer(customer)
    where('approved is not null and customer_id = ?', customer).order('approved_at DESC')
  end
end
```
    

And this controller:


```ruby
class TransactionsWorker
   def perform(...)
      transaction = Transaction.approved_for_customer.latest # WTF!
   end
end
```
    

The order will be "ORDER BY created\_at ASC, approved\_at DESC, created\_at DESC", not "created\_at DESC".

Solutions:

-   Don't return an instead of ActiveRecord::Relation if you use order, return an array (.all, .first, etc)
-   Don't use order and default\_scope at all in models, ordering usually belongs in the business-logic layer.
-   Use reorder as the last method call if chaining ActiveRecord::Relation, e.g. Transaction.where('...').reorder(:approved\_at)

A safer model:


```ruby
class Transaction
   def self.latest
    order('created_at DESC').all
  end

   def self.for_customer(customer)
    where('approved is not null and customer_id = ?', customer).order('approved_at DESC').all
  end
end
```
    

