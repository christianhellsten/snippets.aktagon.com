---
id: '148'
title: A simple and easy to use PHP XML parser
languages:
- php
tags:
- haproxy
- imfile
- rails
- rsyslog
---
The PHP XML parser:


```php
class XML
{
	static function parse($data, $handler, $encoding = "UTF-8")
	{
		$parser = xml_parser_create($encoding);

		xml_set_object($parser, $handler);
		
		xml_set_element_handler($parser,
			array(&$handler, 'start'),
			array(&$handler, 'end')
		);
			
		xml_set_character_data_handler(
			$parser,
			array($handler, 'content')
		);
			
		$result = xml_parse($parser, $data);

		if(!$result)
		{
			$error_string = xml_error_string(xml_get_error_code($parser));
			$error_line	  = xml_get_current_line_number($parser);
			$error_column = xml_get_current_column_number($parser);
			
			$message = sprintf("XML error '%s' at line %d column %d", $error_string, $error_line, $error_column);
			
			throw new Exception($message);
		}

		xml_parser_free($parser);
	}
}
```
    

A result handler:


```php
class ResultHandler
{
	var $tag;

	function start ($parser, $tagName, $attributes = null)
	{
		echo "start";
		$this->tag .= $tagName; # Use .= to work around bug...
	}

	function end ($parser, $tagName)
	{
		echo "end";
		$this->tag = null;

	}

	function content ($parser, $content)
	{
		echo "$this->tag: $content" ;
	}
}
```
    

Then in your code:


```php
$xml = "<a>bah</a>";
XML::parse($xml, new ResultHandler());
```
    

Note that HTML/XML entities are considered to be tags by PHP's XML parser, so your start tag handler will be called three times for this tag, once for "really", once for "&" and once for " bad parser":


```php
<data>really &amp;  bad parser</data>
```
    

I guess this is a bug... You can

