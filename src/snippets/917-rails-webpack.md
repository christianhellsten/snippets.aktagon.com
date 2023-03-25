---
id: '917'
title: Rails+WebPack
languages:
- slim
tags:
---
"Pass all your pack names when using javascript_packs_with_chunks_tag helper otherwise you will get duplicated chunks on the page"

```slim
<%= stylesheet_pack_tag 'YOUR_PACK_NAME_HERE' %>

<%# DO %>
<%= javascript_packs_with_chunks_tag 'calendar', 'map' %>

<%# DON'T %>
<%= javascript_packs_with_chunks_tag 'calendar' %>
<%= javascript_packs_with_chunks_tag 'map' %>
```

https://github.com/rails/webpacker/blob/master/docs/webpack.md#add-splitchunks-webpack-v4
