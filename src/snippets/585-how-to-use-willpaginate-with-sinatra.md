---
id: '585'
title: How to use WillPaginate with Sinatra
languages:
- ruby
tags:
- sql
- unicode
---

```ruby
require 'will_paginate'
require 'will_paginate/active_record'
require 'will_paginate/view_helpers/sinatra'

class App < Sinatra::Base
  helpers WillPaginate::Sinatra::Helpers

  helpers do
    def paginate(collection)
       options = {
         #renderer: BootstrapPagination::Sinatra,
         inner_window: 0,
         outer_window: 0,
         previous_label: '&laquo;',
         next_label: '&raquo;'
       }
      will_paginate collection, options
    end
  end
end
```
    

Also see [will\_paginate-bootstrap](https://github.com/nickpad/will_paginate-bootstrap).

