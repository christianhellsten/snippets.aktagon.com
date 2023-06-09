---
id: '134'
title: How to use RSpec and ZenTest in a standalone Ruby project
languages:
- ruby
tags:
---
First install the RSpec and ZenTest gem:


```ruby
$ sudo gem install rspec zentest
```
    

Next create the spec folder:


```ruby
$ cd project_folder
$ mkdir spec
```
    

Save the following to **spec/helper.rb**:


```ruby
$LOAD_PATH.unshift File.dirname(__FILE__) + '/..'

require 'rubygems'
require 'spec'
#require 'spec/rake/spectask' not needed, because ZenTest supports rspec now
```
    

Now create **spec/transcoder\_spec.rb**, and add the following test to it:


```ruby
require File.dirname(__FILE__) + '/helper'
require File.dirname(__FILE__) + '/../transcoder.rb'

context "Transcoder" do
  setup do
    # Setup your stuff here
  end
  
  it "should support 3gp format" do
    Transcoder.convert("me_and_you.3gp").should == true
  end
end
```
    

Let's not forget the class we're testing, put this code in **lib/transcoder.rb**:


```ruby
class Transcoder
  def initialize
  end
  
  def self.convert(file)
    return true
  end
end
```
    

Note that autotest automatically looks for your code in the lib folder.

Now run the test with the zentest command:


```ruby
autotest
```
    

Change your files and autotest will run the test again.

Tip: Read [Getting started with Autotest - Continuous Testing](http://ph7spot.com/articles/getting_started_with_autotest) and [Setting up autotest to use Growl on OSX](http://wincent.com/knowledge-base/Setting_up_autotest_to_use_Growl) for more information on how to increase your productivity.

