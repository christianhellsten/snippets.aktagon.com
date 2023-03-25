---
id: '60'
title: Syntax highlighting code with Ruby and Ultraviolet
languages:
- ruby
tags:
---
This site uses [Ultraviolet](http://ultraviolet.rubyforge.org/) for syntax highlighting. Ultraviolet supports 50 languages and 20 themes, so it's sometimes difficult to pick the best theme, which is why I created the following code snippet that renders the code in all available themes and creates an HTML page displaying them all:


```ruby
require 'uv'

language      = ARGV[1]
input_file    = ARGV[0]
line_numbers  = true
output_format = "xhtml"

input = File.read(input_file)

# Render input using all available themes
syntax_highlighted_code = ""
Uv.themes.each do |theme|
  syntax_highlighted_code << "<h2>#{theme}</h2>"
  syntax_highlighted_code << Uv.parse( input, output_format, language, line_numbers, theme)
end

# Template for output file
page_template = <<HTML_DOC
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
        <head>
        <title>test</title>
    #{Uv.themes.map{|theme| %Q(<link rel="stylesheet" type="text/css" href="css/#{theme}.css" />\n)}}
                <script type="text/javascript" src=""></script>
                <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        </head>
        <body>
  #{syntax_highlighted_code}
        </body>
</html>
HTML_DOC

# Write highlighted text to output
File.open("output.html", "w") do |file|
  file << page_template
end
```
    

Yes, using ERB templates would be better but interpolated strings work just fine... Save the code in highlight.rb and run it as follows:


```ruby
highlight.rb ruby input_file.rb
```
    

