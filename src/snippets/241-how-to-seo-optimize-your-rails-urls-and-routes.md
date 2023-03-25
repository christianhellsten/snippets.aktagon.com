---
id: '241'
title: How to SEO optimize your Rails URLs and routes
languages:
- ruby
tags:
---
My idea for achieving optimal content crawlability and SEO optimized URLs is to use permalinks instead of ids and the default Rails routes. The permalinks can contain whatever you decide is optimal from a SEO point of view.

As an example, let's take a recipe site that has a recipe at http://xxx/recipes/asia/china/beijing-duck.html.

First let's configure the .html extension to be handled by the RecipesController:


```ruby
map.connect 'recipes/*permalink.html', :controller => 'recipes', :action => 'show'
```
    

In the code we use the URI, which is the permalink of the recipe, to retrieve the recipe from the database:


```ruby
class RecipesController
  def show
    @product = Recipe.find_by_permalink(request.path)
  end
end
```
    

To handle the categories and subcategories, we use the following route:


```ruby
map.connect 'recipes/*permalink/', :controller => 'categories', :action => 'show'
```
    

And create the CategoriesController:


```ruby
class CategoriesController
  def show
    @category = Category.find_by_permalink(request.path)
  end
end
```
    

Now what's left is for you to figure out how to generate the permalinks... I recommend having a look at permalink\_fu.

