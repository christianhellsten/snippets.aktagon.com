---
id: '938'
title: Namespaced singular routes for uncountables in Rails
languages:
- ruby
tags:
---
Having problems with singular routes for an uncountable namespaced model in Rails?

Problem:

```ruby
$ rails console
> Namespace::SMS.model_name.singular_route_key => namespace_sm
> app.polymorphic_path(Namespace::SMS.first) => NoMethodError namespace_sm_path
```

Solution:

```ruby
ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.uncountable %w(namespace_sms)
end
```

Voila:

```ruby
$ rails console
> Namespace::SMS.model_name.singular_route_key => namespace_sms
```
