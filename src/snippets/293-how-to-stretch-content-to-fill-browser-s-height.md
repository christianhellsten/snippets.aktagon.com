---
id: '293'
title: How to stretch content to fill browser's height
languages:
- html
tags:
- kubernetes
- label
- node
---
Note that load\_translations and store\_translations have been removed.


```html
<html>
<body>
<style type="text/css">
html, body {
  overflow: hidden; 
  height: 100%; 
  max-height: 100%; 
  margin: 0;
  padding: 0;
}

#container {
  display: block;
  overflow: hidden;
  background-color: green;
  height: 100%; /** IE 6 */
  min-height: 100%;
}

#navigation { overflow: auto; float: left; width: 260px; background: white; height: 100%; }

#content { overflow: auto; background: blue; margin-left: 260px; height: 100%; border-bottom: 2px solid white;}

</style>
  <div id="container">
    <div id="navigation">
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
	</div>
    <div id="content">
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>
		<p>Content</p>

	</div>
  </div>
</body>
</html>
```
    

