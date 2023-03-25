---
id: '110'
title: Generate a 56-bit DES encrypted (htpasswd) password with Ruby
languages:
- css
tags:
---
Run the following in an irb console to generate a 56-bit DES encrypted password:


```css
"password".crypt("salt")
```
    

The password can be used in an Apache or Nginx htpasswd file to enable basic authentication.

The generated password can also be used in other Unix password files.

