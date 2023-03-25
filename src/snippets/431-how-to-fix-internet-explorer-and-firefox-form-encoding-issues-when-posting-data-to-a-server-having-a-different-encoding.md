---
id: '431'
title: How to fix Internet Explorer and Firefox form encoding issues when posting
  data to a server having a different encoding
languages:
- html
tags:
- dynamic
- materialized
- postgres
- sql
- view
---
This snippet explains how to fix Internet Explorer and Firefox form encoding issues when posting data to a server having a different encoding than the source system.

This happens, for example, when you host a form on a server using ISO-8859-1 that posts data to a server using UTF-8.

The fix for Firefox (and Opera and other sensible browsers) is to use the accept-charset attribute:


```html
<form ...  accept-charset="utf-8">
```
    

The fix for Internet Explorer is to use a hack:


```html
<form ...  accept-charset="utf-8">
  <input type="hidden" name="enc" value="&#153;">
</form>
```
    

The hidden input field will make Internet Explorer understand that you want it [to support UTF-8](http://stackoverflow.com/questions/153527/setting-the-character-encoding-in-form-submit-for-internet-explorer).

