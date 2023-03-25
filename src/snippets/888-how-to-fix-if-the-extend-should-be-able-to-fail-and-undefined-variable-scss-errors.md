---
id: '888'
title: How to fix "if the extend should be able to fail" and "undefined variable"
  SCSS errors
languages:
- bash
tags:
---
If you get an error similar to one of these:

> Use "@extend .navbar-inverse !optional" if the extend should be able to fail":

> Undefined variable: $some_variable

The solution might be the one explained here.

My issue was that I had the SCSS partials in the root folder like this:

```bash
❯ tree app/assets/stylesheets
app/assets/stylesheets
├── application.scss
├── _bootstrap-custom.scss
├── _bootstrap-overrides.scss
└── _theme.scss
```

The problem with this flat folder structure is that all the SCSS files, including partials, are compiled separately. This is the case with Rails' Sprockets at least.

The solution for me was to move all partials into a subdirectory, like this:
    
```bash
❯ tree app/assets/stylesheets
app/assets/stylesheets
├── application.scss
├── partials
│   ├── _bootstrap-custom.scss
│   ├── _bootstrap-overrides.scss
│   ├── _theme.scss
└── vendor
    └── introjs.min.css
```

This way Sprockets, which compiles SCSS in Rails applications, will only compile the application.scss, which includes the partials.

## References

https://github.com/rails/sprockets/blob/master/UPGRADING.md#manifestjs

> You will have to edit the manifest.js to specify those files.

> You may also find that some files that were not previously compiled as top-level targets now are. For instance, if your existing app has any js files directly at ./app/assets/javascripts or css/scss files ./app/assets/stylesheets, Rails with Sprockets 4 will now compile them as top-level targets. Since they were not previously treated as such, you probably don't mean them to be; if they are .scss partials referencing variables meant to be defined in other files, it may even result in an error message that looks like Undefined variable: $some_variable.

> To correct this, you can move these files to some subdirectory of ./app/assets/stylesheets or javascripts; or you can change the manifest.js to be more like how Rails with Sprockets 3 works, linking only the specific application files as top-level targets:

Rails log:

```bash
2019-12-19 15:52:49 +0200: Rack app error handling request { GET / }
#<ActionView::Template::Error: Error: "#nav" failed to @extend ".navbar-inverse".
       The selector ".navbar-inverse" was not found.
       Use "@extend .navbar-inverse !optional" if the extend should be able to fail.
        on line 64:11 of app/assets/stylesheets/_theme.scss
>>   @extend .navbar-inverse;

   ----------^
>
/Users/christian/projects/rails-app/app/assets/stylesheets/_theme.scss:64
/Users/christian/.rbenv/versions/2.6.2/lib/ruby/gems/2.6.0/gems/sassc-2.2.1/lib/sassc/engine.rb:49:in `render'
/Users/christian/.rbenv/versions/2.6.2/lib/ruby/gems/2.6.0/gems/sprockets-4.0.0/lib/sprockets/sassc_processor.rb:59:in `block in call'
/Users/christian/.rbenv/versions/2.6.2/lib/ruby/gems/2.6.0/gems/sprockets-4.0.0/lib/sprockets/utils.rb:138:in `module_include'
/Users/christian/.rbenv/versions/2.6.2/lib/ruby/gems/2.6.0/gems/sprockets-4.0.0/lib/sprockets/sassc_processor.rb:58:in `call'
/Users/christian/.rbenv/versions/2.6.2/lib/ruby/gems/2.6.0/gems/sprockets-4.0.0/lib/sprockets/sassc_processor.rb:31:in `call'
/Users/christian/.rbenv/versions/2.6.2/lib/ruby/gems/2.6.0/gems/sprockets-4.0.0/lib/sprockets/processor_utils.rb:84:in `call_processor'
/Users/christian/.rbenv/versions/2.6.2/lib/ruby/gems/2.6.0/gems/sprockets-4.0.0/lib/sprockets/processor_utils.rb:66:in `block in call_processors'
/Users/christian/.rbenv/versions/2.6.2/lib/ruby/gems/2.6.0/gems/sprockets-4.0.0/lib/sprockets/processor_utils.rb:65:in `reverse_each'
/Users/christian/.rbenv/versions/2.6.2/lib/ruby/gems/2.6.0/gems/sprockets-4.0.0/lib/sprockets/processor_utils.rb:65:in `call_processors'
/Users/christian/.rbenv/versions/2.6.2/lib/ruby/gems/2.6.0/gems/sprockets-4.0.0/lib/sprockets/processor_utils.rb:22:in `block in <class:CompositeProcessor>'
/Users/christian/.rbenv/versions/2.6.2/lib/ruby/gems/2.6.0/gems/sprockets-4.0.0/lib/sprockets/processor_utils.rb:33:in `call'
/Users/christian/.rbenv/versions/2.6.2/lib/ruby/gems/2.6.0/gems/sprockets-4.0.0/lib/sprockets/processor_utils.rb:84:in `call_processor'
/Users/christian/.rbenv/versions/2.6.2/lib/ruby/gems/2.6.0/gems/sprockets-4.0.0/lib/sprockets/processor_utils.rb:66:in `block in call_processors'
/Users/christian/.rbenv/versions/2.6.2/lib/ruby/gems/2.6.0/gems/sprockets-4.0.0/lib/sprockets/processor_utils.rb:65:in `reverse_each'
/Users/christian/.rbenv/versions/2.6.2/lib/ruby/gems/2.6.0/gems/sprockets-4.0.0/lib/sprockets/processor_utils.rb:65:in `call_processors'
```
