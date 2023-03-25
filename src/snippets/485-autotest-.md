---
id: '485'
title: Autotest...
languages:
- ruby
tags:
---
Getting autotest to run your tests is f\*****\*g impossible sometimes. Instead of beating up your keyboard, try this:


```ruby
require 'autotest/fsevent'

class Autotest
  
  def get_to_green
    begin
      rerun_all_tests
      wait_for_changes unless all_good
    end until all_good
  end
                            
end
```
    

From <http://ph7spot.com/musings/getting-started-with-autotest#running_the_whole_test_suite_for_all_changes>

