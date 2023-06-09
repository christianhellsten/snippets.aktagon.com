---
id: '710'
title: Gulpfile.js example with Slim, Coffeescript, Sass, Browser Sync, Lint
languages:
- coffeescript
tags:
---
A Gulpfile.js example with Slim, Coffeescript, Sass, Browser Sync, Lint. The script is suitable for building e.g. static websites and prototyping mobile apps.

Gulpfile expects your project to be structured in the following way (configurable):
- src/css/\*.scss,\*.css
- src/js/\*.coffee,\*.js
- src/\*.slim

Output is written to "www" folder.


```coffeescript
#
# Gulpfile with:
#
# - Slim
# - Sass
# - Lint
# - Browsersync
# - CSS and HTML compression
#
# Install dependencies:
#
#   $ npm install gulp gulp-concat gulp-uglify event-stream gulp-coffee gulp-sass gulp-cssmin gulp-coffee gulp-coffeelint browser-sync gulp-util gulp-shell
#
# Then start developing:
#
#   $ gulp
#

gulp        = require 'gulp'
concat      = require 'gulp-concat'
es          = require('event-stream')
sass        = require 'gulp-sass'
uglify      = require 'gulp-uglify'
streamqueue = require 'streamqueue' # Preserves file order (vendor...)
coffee      = require 'gulp-coffee'
gutil       = require 'gulp-util'
shell       = require 'gulp-shell'
cssmin      = require 'gulp-cssmin'
coffeelint  = require 'gulp-coffeelint'
browserSync = require 'browser-sync'

isProd = gutil.env.type is 'prod'

sources =
  sass: 'src/css/**/*.scss'
  css: 'src/css/**/*.css'
  html: 'src/**/*.slim'
  js: 'src/js/**/*.js'
  coffee: 'src/js/**/*.coffee'

targets =
  css: 'www/css'
  html: 'www/'
  js: 'www/js'

# Check for errors
gulp.task 'lint', ->
  gulp.src(sources.js)
    .pipe(coffeelint())
    .pipe(coffeelint.reporter())

# Compile Coffeescript
gulp.task 'js', ->
  stream = streamqueue(objectMode: true)
  # Vendor files
  stream.queue(gulp.src(sources.js))
  # App files use Coffee
  stream.queue(gulp.src(sources.coffee).pipe(coffee(bare:true)))
  stream.done()
    .pipe(concat("all.js"))
    .pipe(if isProd then uglify() else gutil.noop())
    .pipe(gulp.dest(targets.js))

# Compile Slim
gulp.task 'slim', ->
  gulp.src(sources.html)
    .pipe(shell(["slimrb -r ./lib/helpers.rb -p <%= file.path %> > ./#{targets.html}/<%= file.relative.replace(\".slim\", \".html\") %>"]))

# Compile CSS
gulp.task 'css', ->
  stream = streamqueue(objectMode: true)
  # Vendor files
  stream.queue(gulp.src(sources.css))
  # App files
  stream.queue(gulp.src(sources.sass).pipe(sass(style: 'expanded', includePaths: ['src/css'], errLogToConsole: true)))
  stream.done()
    .pipe(concat("all.css"))
    .pipe(if isProd then uglify() else gutil.noop())
    .pipe(gulp.dest(targets.css))

# Reload browser
gulp.task 'server', ->
  browserSync.init null,
    open: true
    server:
      baseDir: targets.html
    reloadDelay: 2000 # Prevent white screen of death
    watchOptions:
      debounceDelay: 1000

# Watch files for changes
gulp.task 'watch', ->
  gulp.watch sources.js, ['js']
  gulp.watch sources.css, ['css']
  gulp.watch sources.html, ['slim']
  gulp.watch 'www/**/**', (file) ->
    browserSync.reload(file.path) if file.type is "changed"

# Build everything
gulp.task 'build', ['lint', 'js', 'css', 'slim']

# Start a server and watch for file changes
gulp.task 'default', ['watch', 'server']
```
    

Also see [A gulp.js template for React.js and ES6 projects](http://snippets.aktagon.com/snippets/734-a-gulp-js-template-for-react-js-and-es6-projects)

