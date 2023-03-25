---
id: '458'
title: jQuery increment/decrement plugin
languages:
- javascript
tags:
- rails
- webpack
---
With the [jQuery increment-decrement plugin](http://github.com/christianhellsten/jquery-increment-decrement):


```javascript
(function($){  
  /**
   * Returns the current value of the counter.
   */
  function value(counter) {
    return parseInt(counter.html());
  }
  /**
   * Changes the counter's value.
   */
  function change(counters, step) {
    return counters.each(function() {  
      var $counter = $(this);
      // Increment counter
      var count = value($counter) + step;
      $counter.html(count);
      // Trigger event
      var event_name = step > 0 ? 'increment' : 'decrement';
      $counter.trigger(event_name, [$counter, count]);
      return count;
    });  
  }
  $.fn.increment = function(step) {  
    if(!step) { step = 1; }
    change(this, step);
  };  
  $.fn.decrement = function(step) {  
    if(!step) { step = -1; }
    change(this, step);
  };  
  $.fn.counterValue = function() {  
    return value($(this));
  };  
})(jQuery);
```
    

and the following HTML:


```javascript
<div id="counter">0</div>
```
    

you can call these methods to increment/decrement the number:


```javascript
$('#counter').increment();
$('#counter').increment(10)
$('#counter').decrement();
$('#counter').decrement(-10)
```
    

Event listeners
---------------

You can also listen to the increment and decrement events:


```javascript
$('#counter').bind('increment', function(event, counter, value) {
  console.log('Incremented ' + counter + value);
});
$('#counter').bind('decrement', function(event, counter, value) {
  console.log('Decremented ' + counter + value);
});
```
    
