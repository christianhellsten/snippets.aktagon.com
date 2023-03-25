---
id: '951'
title: Could not find 'bundler' (2.2.16) required by your Gemfile.lock
languages:
- bash
tags:
---
You need to install the version listed in the Gemfile.lock file to fix this error:

```bash
gem install --force "bundler:$(grep -A 1 "BUNDLED WITH" Gemfile.lock | tail -n 1)"
```

In a Dockerfile you could run it like this:

```bash
RUN gem install --force "bundler:$(grep -A 1 "BUNDLED WITH" Gemfile.lock | tail -n 1)" rake && \
  bundle config set without development test && \
  bundle config set --local deployment 'true' && \
  bundle install --jobs 5 --retry 5 && \
  bundle clean --force
```
