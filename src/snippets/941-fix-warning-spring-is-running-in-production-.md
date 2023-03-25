---
id: '941'
title: 'Fix "WARNING: Spring is running in production"'
languages:
- ruby
tags:
---
To fix "WARNING: Spring is running in production", run the following in the project directory:

```ruby
bundle config set with production
bundle config set without test development
```

For example, in a Dockerfile:

```ruby
RUN bundle config set with production
RUN bundle config set without test development
```
