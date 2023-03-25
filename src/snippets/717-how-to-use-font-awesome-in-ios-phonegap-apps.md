---
id: '717'
title: How to use Font Awesome in iOS/Phonegap apps
languages:
tags:
---
First, install Font Awesome:

1.  Download the latest [Font Awesome](http://fortawesome.github.io/Font-Awesome/) version
2.  Double-click fontawesome-webfont.ttf and install it on your laptop/desktop (optional)
3.  Copy fontawesome.css to www/css
4.  Remove the references to font files in fontawesome.css, i.e. remove @font-face declaration

Then in Xcode:

1.  Copy fontawesome-webfont.ttf into "Your Project/Resources/fonts/fontawesome-webfont.ttf"
2.  Add Font Awesome to the .plist file by selecting the "Info" tab
3.  Add a new property named "Fonts provided by application" and set the value to "fontawesome-webfont.ttf"

Clean and build your project. Font Awesome is now ready to be used.

Phonegap example:


```
<i class="fa fa-cog"/>
```
    

