---
id: '734'
title: A gulp.js template for React.js and ES6 projects
languages:
- javascript
tags:
---
This gulp.js template will compile JSX to JS and ES6 to ES5 using [Babel](https://babeljs.io).

Features:

-   browserify (dependency management)
-   sourcemaps
-   ES6 to ES5
-   React.js (with JSX to JS compilation)
-   Error notifications


```javascript
var gulp       = require('gulp');
var browserify = require('browserify');
var babelify   = require('babelify');
var notify     = require("gulp-notify");
var source     = require('vinyl-source-stream');

var paths = {
  	js : { src : [ 'app/**/*.js', 'app/**/*.jsx' ], dest : 'public/js/' }
};

gulp.task('default', ['build']);

//
// Watch
//
gulp.task('watch', function () {
  	gulp.watch(paths.js.src, ['compile']);
});

//
// Compile
//
gulp.task('build', [ 'compile' ]);

gulp.task('compile', function () {
  browserify({
    entries: [ './app/index.js' ],
    extensions: [ '.js', '.jsx' ],
    debug: true // Add sourcemaps
  })
  .transform(babelify) // JSX and ES6 => JS
  .bundle() // Browserify bundles required files
    .on('error', console.error.bind(console))
    .on("error", notify.onError({
      message: 'Error: <%= error.message %>',
      sound: 'Sosumi'
    }))
  .pipe(source('app.js')) // Desired filename of bundled files
  .pipe(gulp.dest(paths.js.dest));
});
```
    

package.json:


```javascript
{
  "name": "snippets",
  "version": "0.0.1",
  "author": "christian@aktagon.com",
  "main": "app/index.js",
  "dependencies": {},
  "devDependencies": {
    "babelify": "^6.1.2",
    "browserify": "^10.2.1",
    "gulp": "^3.6.2",
    "gulp-notify": "^2.2.0",
    "material-ui": "^0.8.0",
    "mocha": "*",
    "react": "^0.13.3",
    "react-tap-event-plugin": "^0.1.7",
    "vinyl-source-stream": "^1.1.0"
  },
  "scripts": {
    "main": "gulp",
    "test": "gulp build && mocha"
  }
}
```
    

First save the files to your project directory then install the dependencies:


```javascript
$ brew install npm
$ npm install
```
    

Start coding (app/index.js):


```javascript
import React from 'react';
import Modernizr from './modernizr'; // Not managed by npm
import _ from 'lodash';
```
    

