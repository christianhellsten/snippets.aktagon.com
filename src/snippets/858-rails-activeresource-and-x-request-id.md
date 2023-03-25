---
id: '858'
title: Rails ActiveResource and X-Request-ID
languages:
- ruby
tags:
---
How to share X-Request-ID between Rails frontend (ActiveResource) and backend (REST API).

```ruby
class ModelX < ActiveResource::Base
end

class ApplicationController < ActionController::Base
  before_action do
    ModelX.headers['X-Request-ID'] = request.uuid
  end
end
```

See:
https://github.com/rails/activeresource/blob/326b452d59e8b9207069642fa6f1bf2e9b3907f1/lib/active_resource/base.rb#L322
