---
id: '343'
title: RubyCocoa HelloWorld
languages:
- ruby
tags:
---

```ruby
require 'osx/cocoa'; include OSX 
app = NSApplication.sharedApplication 

win = NSWindow.alloc.initWithContentRect_styleMask_backing_defer( 
    [0, 0, 200, 60], 
    NSTitledWindowMask|NSClosableWindowMask|NSMiniaturizableWindowMask|NSResizableWindowMask, 
    NSBackingStoreBuffered, 
    false) 

win.title = 'Hello World' 
button = NSButton.alloc.initWithFrame(NSZeroRect) 
win.contentView.addSubview(button) 

button.bezelStyle = NSRoundedBezelStyle 
button.title = 'Hello!' 
button.sizeToFit
button.frameOrigin = NSMakePoint((win.contentView.frameSize.width / 2.0) - (button.frameSize.width / 2.0), 
                                 (win.contentView.frameSize.height / 2.0) - (button.frameSize.height / 2.0)) 
button_controller = Object.new 
def button_controller.sayHello(sender) 
  puts "Hello World!" 
end 

button.target = button_controller 
button.action = 'sayHello:' 

win.display 
win.orderFrontRegardless 
app.run
```
    

