---
id: '416'
title: How to make sure new is called on a JavaScript object
languages:
- javascript
tags:
---

```javascript
function User(first, last){ 
  if ( !(this instanceof arguments.callee) ) 
    return new User(first, last); 
   
  this.name = first + " " + last; 
}

// Prevents issues with
var user = User("John", name);
//
var user = new User("John", name);
```
    

From [Learning advanced JavaScript](http://ejohn.org/apps/learn/#38)

