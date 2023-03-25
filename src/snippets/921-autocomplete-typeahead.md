---
id: '921'
title: Autocomplete / Typeahead
languages:
- html
- javascript
tags:
---
Javascript (jQuery):

```javascript
function autocomplete(options) {
  var input = $(options.input);
  var resultsElem = $(options.results);
  var url = options.url;
  var cache = {};
  var result = null;
  var minQueryLength = options.minQueryLength;
  var debounce = null;
  var waitingFor = null; // Ajax responses might not arrive in order
  var show = function() {
    if(result == null) {
      return;
    }
    resultsElem.fadeIn(100);
  };
  var hide = function() {
    resultsElem.fadeOut(100);
  };
  // Hide when clicking outside autocomplete elements
  $('body').click(function(){
    hide();
  });
  // Stop propagation so that event does not reach the body handler 
  $('.autocomplete').click(function(e){
    e.stopPropagation();
  });
  var renderResults = function(query, results) {
    if (query !== waitingFor) {
      return;
    }
    resultsElem.html(results);
    if (results != undefined) {
      show();
    } else {
      hide();
    }
  };
  var search = function() {
    var query = input.val();
    console.log("Searching for '" + query + "'")
    waitingFor = query;
    if (query in cache) {
      console.log('Using cache')
      renderResults(query, cache[query]);
    } else {
      console.log('Not using cache')
      if (query.length > minQueryLength) {
        $.ajax({url: url, data: {query: query}, type: 'GET'}).then(function(data) {
          result = data;
          cache[query] = result;
          renderResults(query, result);
        });
      } else {
        renderResults(query, null);
      }
    }
  };
  var searchWithDebounce = function(e) {
    clearTimeout(debounce);
    debounce = setTimeout(search, 100);
  };
  input.on('blur', hide);
  input.on('focus', show);
  input.on('keyup', searchWithDebounce);
};

autocomplete({
  input: '#autoComplete',
  results: '#autocomplete-results',
  url: '/search',
  minQueryLength: 2
});
```

HTML (Bootstrap 4):

```html
<form action="/search" class="form-inline ml-2 my-2 my-lg-0 ml-auto mr-auto" id="site-search" method="GET">
  <input aria-label="Search" autocomplete="off" class="autocomplete form-control mr-sm-2" id="autoComplete" name="query" placeholder="Search" tabindex="1" type="search">
  <div class="autocomplete shadow" id="autocomplete-results"></div>
</form>
```

Todo: run a linter.
