---
id: '860'
title: View Presenters Pattern in Rails
languages:
- html
- ruby
tags:
---
View (app/views/episodes/show.slim):

```html
- ep = EpisodePresenter

ul
  li = ep.name(@episode)
  li = ep.producer_name(@episode)
  li = ep.director_name(@episode)
  li = ep.link_to(@episode, view: self)
```

BasePresenter (app/presenters/base_presenter.rb):

```ruby
class BasePresenter
  #
  # Delegate methods to model
  #
  def self.method_missing(method, *args, &block)
    model = args.shift
    if model && model.respond_to?(method)
      model.send(method, *args, &block)
    else
      raise NoMethodError, method
    end
  end
end
```


Presenter (app/views/presenters/episode_presenters.rb):

```ruby
class EpisodePresenter < BasePresenter
  #
  # NOTE: method missing delegates to the model, so no need to define this
  #
  # def self.name(episode)
  #   episode.name
  # end
  
  def self.producer_name(episode)
    "#{episode.producer.first_name} #{episode.producer.last_name}"
  end

  def self.director_name(episode)
    "#{episode.director.first_name} #{episode.director.last_name}"
  end
 
  #
  # NOTE: Rails helpers can be accessed through the view, if needed.
  #
  def self.link_to(episode, view:, classes: '', text: nil)
    attrs = {
      href: view.episode_path(episode),
      class: classes
    }
    view.content_tag :a, attrs do
      text.presence || 'View'
    end
  end
end
```
