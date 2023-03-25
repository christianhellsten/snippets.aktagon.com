---
id: '889'
title: How to dump Postgres extensions and all schemas with Rails
languages:
- bash
- ruby
tags:
---
When running **rake db:reset** you might get one of the following informative errors:

```bash
  function public.gen_random_uuid() does not exist
```

```bash
  db/structure.sql:22: ERROR:  schema "public" already exists
```

To fix them tell Ruby to dump everything by editing config/application.rb:

```ruby
module XXX
  class Application < Rails::Application
    config.active_record.dump_schemas = :all
```

Tested with Rails 6.

References:
https://github.com/rails/rails/issues/17157#issuecomment-77400517
