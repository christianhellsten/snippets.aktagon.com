---
id: '89'
title: Solving "Internet Explorer cannot open the Internet site http://xyz.com. Operation
  aborted."
languages:
- javascript
tags:
- channel
- go
- golang
- pattern
- worker
---
This bug exists in IE6 and IE7 and is caused by a JavaScript that tries to modify a tag that hasn't been closed (yet).

For example this one:


```javascript
<div id="x">
  <script type="text/javascript">
  $('x').replace("wrong");
  </script>
</div>
```
    

This example fixes the problem, because the script is defined after the tag that it tries to modify:


```javascript
<div id="x">
</div>
<script type="text/javascript">
  $('x').replace("correct");
</script>
```
    

See [BUG: Error message when you visit a Web page or interact with a Web application in Internet Explorer: 'Operation aborted'](http://support.microsoft.com/default.aspx/kb/927917) for a detailed explanation of the problem.

