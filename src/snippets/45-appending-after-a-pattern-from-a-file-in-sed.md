---
id: '45'
title: Appending after a pattern from a file in sed
languages:
- bash
tags:
- activerecord
- i18n
- key
- localization
---
Useful when you want to append the contents of a whole file into something you are sed'ing. Be careful if you use -i, it will replace the working file.


```bash
sed -i "/attr_accessor :config/r ../patch_for_application.rb.tmpl" app/controllers/application.rb
```
    

