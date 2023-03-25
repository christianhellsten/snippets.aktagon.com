---
id: '791'
title: How to get rid of Gulp, Grunt, and <your favorite JS build tool>
languages:
- bash
tags:
---
I would happily pay 50-100€ for a build tool that would help me get rid of Gulp, Grunt, etc, and save me from hours of unproductive fighting with unreliable tools.

The following snippet is not quite a full solution for getting rid of Gulp/Grunt.

## Installation

```bash
npm install -g node-sass browserify babelify uglify-js
```

## Usage
```bash
# Compile JS modules into one file
browserify js/app.js -o dist/js/app.js -t [ babelify --presets [ es2015 ] ]
# Compile CSS/SASS modules into one file
node-sass css/app.scss --output-style compressed --include-path node_modules/bootstrap-sass/assets/stylesheets dist/css/app.css
# Minify JS
uglifyjs --compress --mangle -o dist/js/app.js -- dist/js/app.js
```

Note:
- node-sass supports a watch switch.
- browserify does not support a watch switch. However, you can use beefy: https://github.com/chrisdickinson/beefy

See [How to Use npm as a Build Tool](https://www.keithcirkel.co.uk/how-to-use-npm-as-a-build-tool/).
