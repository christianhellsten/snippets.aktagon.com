---
id: '105'
title: Show and Hide (toggle) the Blueprint Grid with a JavaScript
languages:
- javascript
tags:
---
This snippet--which could be improved on--allows you to easily display and hide the [BlueprintCSS](http://code.google.com/p/blueprintcss/) grid.

Put the following code inside the &lt;head&gt; element:


```javascript
<style title="grid" type="text/css">
		.container { }
</style>
<script type="text/javascript">
	function toggleGrid() {
		if (!document.styleSheets) return;
	
		var cssTitle  	 = "grid"
		var selectorName = ".container";
		var cssText   	 = "background: url('images/grid.png');";
		var css = new Array();
	
		// Find the stylesheet
		for(i = 0; i < document.styleSheets.length; i++)
		{
			var styleSheet = document.styleSheets[i];
			
			if(styleSheet.title == cssTitle) {
				if (document.styleSheets[i].cssRules)
					css = document.styleSheets[i].cssRules;
				else if (document.styleSheets[i].rules)
					css = document.styleSheets[i].rules;
				else return;
				
				break;
			}
		}

		// Find the selector
		for (i = 0; i < css.length; i++) {
		
			if ((css[i].selectorText.toLowerCase() == selectorName)) {
				if(css[i].style.cssText == "") {
					css[i].style.cssText = cssText;
				}
				else {
					css[i].style.cssText = "";
				}
			}
		}
	}
</script>
```
    

Change selectorName or cssText, if needed. Next add the following link, for example, to the footer:


```javascript
<a href="javascript:toggleGrid();" id="toggle-grid">Show grid</a>
```
    

Now when you click the link, the grid will be displayed. Click again to hide it.

Note that this is a simple example of how to change a CSS style sheet dynamically with JavaScript. You can use it to change any selector at runtime.

