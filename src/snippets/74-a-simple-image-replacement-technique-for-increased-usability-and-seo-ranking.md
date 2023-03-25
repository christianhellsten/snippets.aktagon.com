---
id: '74'
title: A simple image replacement technique for increased usability and SEO ranking
languages:
- css
tags:
- babelify
- browserify
- gulp
- javascript
---
This is currently my favorite image replacement technique. I don't remember where I found it... Using it can improve both your site's usability and your search engine ranking, by allowing both screen readers and search engines to find your h1 headlines. First create the h1 and the description of your page/site, for example:


```css
<h1 id="logo">Viagra, Botox, you name it</h1>
```
    

Then create the CSS rule for the page title:


```css
h1#logo {
  text-indent: -9000px;
  background: url(logo.gif);
  width: 200px; /* Width of image */
  height: 50px; /* Height of image */
}
```
    

People using a modern browser that support CSS will see your logo (the image), and search engines and people using less modern browsers will see the content of the h1 header tag.

Note that if you replace the text of a link then use the outline CSS property to remove the dotted border:


```css
.text-replacement {
	text-indent: -9000px;
}

.text-replacement a {
	outline: none;
}
```
    

