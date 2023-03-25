---
id: '930'
title: Customizing Rails SQL dumps
languages:
- ruby
tags:
---
config/application.rb:

```ruby
require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module YourApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    # Set to :all to dump all schemas
    config.active_record.dump_schemas = :all
    # Don't dump in Docker
    config.active_record.dump_schema_after_migration = !File.exist?('/.dockerenv')
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.active_record.schema_format = :sql
  end
end
```

If all else fails, override the rake task in Rakefile:

```ruby
Rake::Task["db:schema:dump"].clear
Rake::Task["db:structure:dump"].clear

namespace :db do
  namespace :schema do
    task :dump do
      Kernel.system "pg_dump -s -x -O -f db/structure.sql --schema=xxx xxx_development && sed do_xyz_with_dump"
    end
  end
end
```
