---
id: '136'
title: How to extract video metadata with mplayer and Ruby
languages:
- ruby
tags:
---
You can easily extract video metadata into a hash with mplayer and Ruby:


```ruby
class Metadata
  
  def self.get(file)
    command  = "mplayer -vo null -ao null -frames 0 -identify #{file}"
    metadata = nil
    
    Open3.popen3(command) do |input, output, error|
      metadata = output.readlines.grep(/ID_.*/).collect {|name| name[3..name.length].split('=')}
      metadata = metadata.inject({}) {|hash, (key, value)| hash[key.to_sym] = value.chomp; hash}
    end
    
    return metadata
  end
  
end
```
    

Then in an RSpec test do:


```ruby
it "should support 3gp" do
    metadata = Metadata.get("videos/sony_ericsson_k850i.3gp")
    
    metadata[:DEMUXER].should == 'mov'
    metadata[:VIDEO_FORMAT].should == 's263'
    metadata[:VIDEO_WIDTH].should == '176'
    metadata[:VIDEO_HEIGHT].should == '144'
  end
```
    

Note to self: metadata.demuxer would perhaps be a slightly better syntax.

