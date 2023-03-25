---
id: '919'
title: Idempotency with Rails and Turbolinks
languages:
- ruby
tags:
---
To achieve idempotency with Rails and Turbolinks you have many options including these:

- Option 1: Destroy DOM elements

Destroy existing elements that were created on the first page load. This works well with most libraries, including D3.js.

The is also the easiest to implement if you put everything under one root DOM element.

- Option 2: Set a flag

Set a flag. Check if the flag is set before running the script. Note that you will have to use delegated event listeners or attach event listeners again. This is hard to do with, for example, D3.js.

```ruby
document.addEventListener("turbolinks:load", function() {
  $('.linechart').each(function(_ix, el) {
    // Option 1: Destroy existing elements that were created on the first page load
    el = $(el);
    el.empty(); // empty removes all child elements. Normally this would be put in the script itself
    linechart(el)
    // Option 2: Set a flag to avoid calling the script twice 
    //if(el.attr('data-initialized') == null) {
    //  console.log("not initialized")
    //  linechart(el)
    //} else {
    //  console.log("initialized")
    //}
    // // Attach event listeners again
    // linechart.attachDelegatedEventListeners(el);
    //el.attr('data-initialized', true);
  });
});
```
