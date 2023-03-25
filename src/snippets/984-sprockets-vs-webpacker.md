---
id: '984'
title: Sprockets vs. Webpacker
languages:
tags:
---
Which to choose?

> You should choose Webpacker over Sprockets on a new project if you want to use NPM packages and/or want access to the most current JavaScript features and tools. You should choose Sprockets over Webpacker for legacy applications where migration might be costly, if you want to integrate using Gems, or if you have a very small amount of code to package.

Sprockets vs. Webpacker concepts

```
# sprockets concept = webpacker equivalent
Gemfile dependencies = npm_modules
stylesheet_link_tag	= stylesheet_pack_tag
javascript_include_tag = javascript_pack_tag
image_path = image_pack_tag
asset_path = asset_pack_tag
require = import or require
```

Webpacker depends on NPM (Node package manager registry) and Yarn. 

Example:

```
app/javascript:
  ├── packs:
  │   # only webpack entry files here
  │   └── application.js
  │   └── application.css
  └── src:
  │   └── my_component.js
  └── stylesheets:
  │   └── my_styles.css
  └── images:
      └── logo.svg
```

If you want to avoid problems, use esbuild.

Reference:
https://guides.rubyonrails.org/webpacker.html
