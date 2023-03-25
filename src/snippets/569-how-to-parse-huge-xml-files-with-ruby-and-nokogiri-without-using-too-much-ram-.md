---
id: '569'
title: How to parse huge XML files with Ruby and Nokogiri (without using too much
  RAM)
languages:
- ruby
tags:
---
Parse huge XML files, without using too much RAM, with Ruby and Nokogiri and the following code:


```ruby
require 'nokogiri'
#  Public: BigXML helps you parse XML efficiently with minimal RAM usage. Parse 1GB, 2GB, 100GB, whatever and so on..
#
#  Examples:
#    # Filter an XML file efficiently by selecting only users, groups and messages.
#    File.open(ARGV[1], 'w') do |out_file|
#      xml = BigXML.new(ARGV[0])
#      xml.each_node do |node, path|
#        # users
#        if node.name == 'user' # or use the element's path: path == 'export/users/user'
#          out_file << node.outer_xml
#        # groups
#        elsif node.name == 'group' # or use the element's path and content: path == 'export/groups/group' && node.outer_xml.match(/<private type="boolean">false/m)
#          out_file << node.outer_xml
#        # messages
#        elsif node.name == 'message' # or use the element's path and content: path == 'export/messages/message' && node.outer_xml.match(/<private type="boolean">false/m)
#          out_file << node.outer_xml
#        end
#      end
#    end
#
class BigXML
  # Public: Initializes a parser.
  #
  # xml_file - The path of the XML file you want to parse
  def initialize(xml_file)
    raise ArgumentError, "Please provide the path of the XML file, not a #{xml_file.class}" unless xml_file.is_a?(String)
    @xml_file = xml_file
  end

  # Public: Iterate over each node in the XML document.
  #
  # attributes_in_path - Default false. Setting this to true will include attributes in the node path, e.g. /groups/@id=1. instead of just /groups
  #
  # Yields the node (Nokogiri::XML::Reader) and path (String) of the current XML node.
  #
  # Returns nothing.
  def each_node(attributes_in_path=false)
    reader = Nokogiri::XML::Reader(File.open(@xml_file))
    nodes = ['']
    reader.each do |node|
      # start tag
      if node.node_type == Nokogiri::XML::Reader::TYPE_ELEMENT.
        # store path
        if attributes_in_path && node.attributes.size > 0
          attributes = []
          node.attributes.sort.each do |name, value|
            attributes << "@#{name}=#{value}"
          end
          nodes << "#{node.name}/#{attributes.join('/')}"
        else
          nodes << node.name
        end
        path = nodes.join('/')
        yield node, path
      end
      # end tag
      if node.node_type == Nokogiri::XML::Reader::TYPE_END_ELEMENT || node.self_closing?
        nodes.pop
      end
    end
  end
end

if __FILE__ == $0
  require 'minitest/unit'
  class TestBigXML < MiniTest::Unit::TestCase
    def test_grep
      xml = BigXML.new(ARGV[0])
      users = 0
      groups = 0
      messages = 0
      File.open(ARGV[1], 'w') do |out_file|
        xml.each_node do |node, path|
          # users
          if node.name == 'user' && path == '/export/users/user'
            users += 1
            out_file << node.outer_xml
            out_file << "\n"
          # groups
          elsif node.name == 'group' && path == '/export/groups/group'.
            doc = Nokogiri::XML.parse(node.outer_xml)
            group = doc.at('/group/private')
            is_public = group && group.inner_text == 'false'
            if is_public
              groups += 1
              out_file << node.outer_xml
              out_file << "\n"
            end
          # messages
          elsif node.name == 'message' && path == '/export/messages/message'
            doc = Nokogiri::XML.parse(node.outer_xml)
            group = doc.at('/message/group/private')
            is_public = group && group.inner_text == 'false'
            if is_public
              messages += 1
              out_file << node.outer_xml
              out_file << "\n"
            end
          end
        end
        assert_equal 100, users
        assert_equal 100, groups
        assert_equal 100, messages
      end
    end
  end
  MiniTest::Unit.autorun
end
```
    

[BigXML on Github](http://github.com/christianhellsten/big-xml)

