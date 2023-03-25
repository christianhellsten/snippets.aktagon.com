---
id: '466'
title: How to embed Google Maps driving directions on your site
languages:
- html
tags:
- activerecord
- exists
- not
- rails
---

```html
<form action="http://maps.google.com/maps" method="get">
  <label for="saddr">Where are you starting your trip?</label>
  <input type="text" name="saddr" id="saddr" value="Adelaide, Australia" />
  <input type="submit" value="Go" />
  <input type="hidden" name="daddr" value="Melbourne, Australia" />
  <input type="hidden" name="hl" value="en" />
</form>
```
    

