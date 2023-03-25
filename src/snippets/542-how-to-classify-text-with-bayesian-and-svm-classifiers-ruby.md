---
id: '542'
title: How to Classify Text with Bayesian and SVM Classifiers + Ruby
languages:
- ruby
tags:
---
There are at least 4 Bayesian and Support Vector Machine classifiers for Ruby that you can use for e.g. sentiment analysis: Ankusa, Eluka, Classifier and the Hoatzin. My favorite is Ankusa..

[Ankusa](https://github.com/livingsocial/ankusa):


```ruby
require "ankusa"
require 'ankusa/file_system_storage'

file  = 'training.txt'
storage = Ankusa::FileSystemStorage.new(file)
classifier = Ankusa::NaiveBayesClassifier.new(storage)

training = []
training << OpenStruct.new(:sentiment => :happy, :text => "I'm so happy")
training << OpenStruct.new(:sentiment => :sad, :text => "I'm so sad")

training.each do |tweet|
  classifier.train(tweet.sentiment, tweet.text)
end

puts classifier.classify "I'm sad"
puts classifier.classifications("I'm sad").inspect
```
    

[Hoatzin](https://github.com/rattle/hoatzin):


```ruby
c = Hoatzin::Classifier.new
c.train(:positive, "Thats nice")
c.classify("Thats nice")
```
    

[Classifier](https://github.com/cardmagic/classifier):


```ruby
b = Classifier::Bayes.new 'Interesting', 'Uninteresting'
b.train_interesting "here are some good words. I hope you love them"
b.train_uninteresting "here are some bad words, I hate you"
b.classify "I hate bad words and you" # returns 'Uninteresting'
```
    

[Eluka](https://github.com/arrac/eluka):


```ruby
classifier = Eluka::Model.new
training.each do |tweet|
  classifier.add(tweet.features, tweet.sentiment)
end
classifier.build
sentiment = classifier.classify tweet.features
```
    

Hoatzin, Classifier and Eluka use libsvm. Reference [Sentiment Analysis in Ruby by Mateusz Drożdżyński](http://srug.pl/assets/mateusz-drozdzynski-sentiment-analysis-in-ruby.pdf)

