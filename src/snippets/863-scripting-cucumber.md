---
id: '863'
title: Scripting Cucumber
languages:
- ruby
tags:
---
POC for scripting Cucumber:

```ruby
require 'cucumber'
opts = {
  strict: Cucumber::Core::Test::Result::StrictConfiguration.new,
  require: ["features/support", "features/step_definitions"],
  dry_run: false,
  formats: [['json', {}, outs]], # This is not working
  excludes: [],
  tag_expressions: [],
  tag_limits: {},
  name_regexps: [],
  env_vars: {},
  diff_enabled: true,
  snippets: true,
  source: true,
  duration: true,
  retry: 0,
  default_profile: "default"
}
configuration = Cucumber::Configuration.new(opts)
runtime = Cucumber::Runtime.new(configuration)
Cucumber::Cli::Main.new([]).execute!(runtime)
```
