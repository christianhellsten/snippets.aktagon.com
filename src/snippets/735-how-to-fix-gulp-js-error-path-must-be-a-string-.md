---
id: '735'
title: 'How to fix Gulp.js "Error: path must be a string"'
languages:
- javascript
tags:
---
gulpfile.js:


```javascript
...
  browserify({
    entries: [ './app/index.js' ],
    extensions: [ '.js', '.jsx' ],
    debug: true // Add sourcemaps
  })
  .transform(babelify()) // JSX and ES6 => JS
...
```
    

A close-up of the issue:


```javascript
.transform(babelify()) // JSX and ES6 => JS
```
    

The solution:


```javascript
.transform(babelify) // JSX and ES6 => JS
```
    

