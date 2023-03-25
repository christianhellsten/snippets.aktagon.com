---
id: '419'
title: How to warn a user when he's leaving and there's unsaved data
languages:
- javascript
tags:
- print
- vim
---

```javascript
function confirmExit(enabled) {
  window.onbeforeunload = (enabled) ? onUnloadMessage : null;
}

function onUnloadMessage() {
  return "You're about to leave without saving!";
}

// Enable
$('.input').change(function() {
  confirmExit(true);
});
```
    

