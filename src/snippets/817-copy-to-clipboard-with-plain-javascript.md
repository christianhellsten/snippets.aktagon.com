---
id: '817'
title: Copy-to-clipboard with plain Javascript
languages:
- html
- javascript
tags:
---
```javascript
var Copy2Clipboard = {
  init: function(selector) {
    var btns = document.querySelectorAll(selector);
    for (var i = 0, len = btns.length; i < len; i++) {
      var btn = btns[i]
      btn.addEventListener('click', function(event) {
        var btn = event.target
        try {
          console.debug("click")
          var textarea = document.getElementById(btn.getAttribute('data-target'))
          if (textarea == null) {
            alert("copy-to-clipboard target is undefined")
            return
          }
          textarea.select();
          var successful = document.execCommand && document.execCommand('copy')
          if (successful) {
            btn.innerHTML = 'Copied...'
          } else {
            alert("Press Ctrl+C or Cmd+C to copy")
          }
        } catch (err) {
          console.log('Oops, unable to copy')
        }
      })
    }
  }
}

Copy2Clipboard.init('.copy-to-clipboard')
```

```html
<textarea id="embed-code">
  This will be copied to the clipboard.
```
