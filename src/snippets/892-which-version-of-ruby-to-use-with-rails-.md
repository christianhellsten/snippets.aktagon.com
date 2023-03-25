---
id: '892'
title: Which version of Ruby to use with Rails?
languages:
tags:
---
To know which version of Ruby is safe to use with Rails one option is to look at the Travis configuration, for example, Rails 5.2:
https://github.com/rails/rails/blob/ee1278cc841a883835918fbedb70add96c84543b/.travis.yml#L64-L69

Note the allowed_failures configuration:
https://github.com/rails/rails/blob/172bb64ca8d3f1cf88ca7daa4f6a58436e577c69/.travis.yml#L145-L148

This works for Rubygems too:
https://github.com/bblimke/webmock/blob/a3c8de2550122d0998cb47292be0bbd2e3f203bf/.travis.yml#L4-L14

