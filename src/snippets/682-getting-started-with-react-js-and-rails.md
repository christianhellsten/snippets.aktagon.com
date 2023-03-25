---
id: '682'
title: Getting Started With React.js and Rails
languages:
- ruby
tags:
---
Why use React.js?
-----------------

-   React ~35kb vs. Amber.js ~100kb
-   Easy to learn compared to Ember.js and Angular.js
-   Supports server-side rendering
-   Great performance
-   Angular.js documentation is horrible
-   [Angular.js is the new EJB](https://docs.angularjs.org/guide/concepts?)

Why shouldn't you use React.js?
-------------------------------

-   React.js is difficult to integrate with JS libraries that move or create DOM elements, e.g. jQuery UI
-   React.js is still evolving. Expect API changes to break your app.

Installation
------------

Gemfile:


```ruby
gem 'active_model_serializers' # You probably want this gem too...
gem 'react-rails', '~> 1.0.0.pre', github: 'reactjs/react-rails'
```
    

From the console run:


```ruby
bundle
rails g react:install
```
    

Make sure you have this in app/assets/javascript/application.js:


```ruby
# ...
#= require react
# For the <div data-react-class...> syntax
#= require react_ujs
#= require_tree components
```
    

Add this to config/environments/production.rb


```ruby
Rails.config.react.variant = :production
```
    

And this to config/environments/development.rb


```ruby
Rails.config.react.variant = :development
```
    

Hello World
-----------

Create app/assets/javascripts/components/hello.jsx.coffee (note the file extension):


```ruby
###* @jsx React.DOM ###

window.Hello = React.createClass
  render: ->
    <div>{this.props.name}</div>
```
    

app/views/layouts/application.html.erb


```ruby
<html>
…
  <div data-react-class="Hello" data-react-props=<%= { name: 'John' }.to_json %>/>
or:
  <%= react_component 'Hello', name: 'John' %>
....
</html>
```
    

Troubleshooting
---------------

-   Unexpected token '&lt;' Error

Did you forget to add this to the top of your React component file (.js.jsx)?


```ruby
/** @jsx React.DOM */
```
    

or this to your CoffeeScript component (.jsx.coffee):


```ruby
###* @jsx React.DOM ###
```
    

-   Target container is not a DOM element.

Does the DOM element exist?

Did you forget to call React.renderComponent in jQuery’s $(document).ready?

-   Adjacent XJS elements must be wrapped in an enclosing tag

Multiple nodes need a parent element:


```ruby
<ul> // Doesn't work without <ul> wrapper
  <li></li>
  <li></li>
</ul>
```
    

-   Still doesn’t work?

react-rails is not stable; expect it to break.

Gotchas
-------

-   The only way to get a handle to a React Component instance outside of React is by storing the return value of React.renderComponent:
    <http://facebook.github.io/react/docs/component-api.html>

<!-- -->

-   Integration with e.g. Bootstrap is not trivial and will break when APIs change:
    <https://github.com/facebook/react/blob/master/examples/jquery-bootstrap/js/app.js>

Solutions:
[React.js Google Group](https://groups.google.com/forum/#!topic/reactjs/mHfBGI3Qwz4)
[React.js and jQuery sortable](http://jsfiddle.net/LQxy7/)
[React.js and select2](http://jsfiddle.net/pHp77/1/)
[React.js and Bootstrap Modal](https://github.com/facebook/react/blob/master/examples/jquery-bootstrap/js/app.js)
[React.js and Kendo UI](http://ifandelse.com/using-reactjs-and-kendoui-together/)

-   You need to change the HTML "class" attribute to "className" in JSX


