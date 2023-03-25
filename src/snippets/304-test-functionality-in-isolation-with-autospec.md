---
id: '304'
title: Test functionality in isolation with Autospec
languages:
- ruby
tags:
- for
- loop
- postgres
---
This configuration will make autospec run "spec/models/xyz\_spec" when a file in "lib/xyz/ is modified". No other tests are run.

Put the following code in ./.autotest:


```ruby
Autotest.add_hook :initialize do |at|
  at.clear_mappings
  %w{.svn .hg .git vendor}.each {|exception| at.add_exception(exception)}

  at.add_mapping(%r%^lib/xyz/.*\.rb$%) {
    at.files_matching %r%^spec/models/xyz_spec\.rb$%
#
# Uncomment if more tests are needed...
# +   at.files_matching %r%^spec/models/xyz_spec\.rb$%
#
  }
end
```
    

