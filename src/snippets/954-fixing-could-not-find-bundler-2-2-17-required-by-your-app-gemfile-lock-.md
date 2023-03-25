---
id: '954'
title: Fixing "Could not find 'bundler' (2.2.17) required by your /app/Gemfile.lock."
languages:
- bash
tags:
---
Dockerfile:

```bash
RUN gem install --force "bundler:$(grep -A 1 "BUNDLED WITH" Gemfile.lock | tail -n 1)" rake && \
  bundle config set without development test && \
  bundle config set --local deployment 'true' && \
  bundle install --jobs 10 --retry 5 && \
  bundle clean --force
```
