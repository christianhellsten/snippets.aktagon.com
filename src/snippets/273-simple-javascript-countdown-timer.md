---
id: '273'
title: Simple JavaScript countdown timer
languages:
- javascript
tags:
- debian
- ifupdown-extra
- route
- routing
- ubuntu
---
This JavaScript displays the days, hours, minutes and seconds left to the given date:


```javascript
function Countdown(then) {

	this.then = then;
	
	function setElement(id, value) {
		if (value.length < 2) {
	    	value = "0" + value;
		}
	
		window.document.getElementById(id).innerHTML = value;
	}
	
	function countdown() {
		now  		  = new Date();
	  	diff		  = new Date(this.then - now);
	  	
		seconds_left  = Math.floor(diff.valueOf() / 1000);
	
		seconds  = Math.floor(seconds_left / 1) % 60;
		minutes  = Math.floor(seconds_left / 60) % 60;
		hours    = Math.floor(seconds_left / 3600) % 24;
		days     = Math.floor(seconds_left / 86400) % 86400;
		
		setElement('countdown-days', days);
		setElement('countdown-hours', hours);
		setElement('countdown-minutes', minutes);
		setElement('countdown-seconds', seconds);
		
		countdown.timer = setTimeout(countdown, 1000);
	}
	
		
	function start() {
		this.timer = setTimeout(countdown, 1000);
	}
	
	start(then);	
}

Countdown(new Date("Dec 04 2008 12:00:00"));
```
    

Required HTML:


```javascript
<span id="countdown-days"></span> days

<span id="countdown-hours"></span>:<span id="countdown-minutes"></span>:<span id="countdown-seconds"></span>
```
    

Output is for example:


```javascript
23 days 23:00:12
```
    

