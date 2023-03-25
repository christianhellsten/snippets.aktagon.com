---
id: '536'
title: How to lazy-load Disqus with jQuery
languages:
- javascript
tags:
---
This JavaScript snippet will load Disqus when a link or button is clicked:


```javascript
<script type="text/javascript">
  //window.disqus_developer = 1
  window.disqus_shortname = 'xxx'; 
  window.disqus_identifier = 'xxx';

  $('#show-disqus').click(function() {
    $.ajax({
        type: "GET",
        url: "http://" + disqus_shortname + ".disqus.com/embed.js",
        dataType: "script",
        cache: true
    }) 
  });
</script>
<div id="disqus_thread"></div>
```
    

