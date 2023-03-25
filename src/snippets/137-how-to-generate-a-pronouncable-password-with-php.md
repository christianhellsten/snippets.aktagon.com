---
id: '137'
title: How to generate a pronouncable password with PHP
languages:
- php
tags:
- ecto
- elixir
- pagination
- phoenix
---
This is a slight modification of a script I found at [PHPFAQ](http://www.alt-php-faq.org/local/37/):


```php
class Password
{
	static function generate($length)
	{
		srand((double)microtime()*1000000);

		$vowels = array("a", "e", "i", "o", "u");
		$cons = array("b", "c", "d", "g", "h", "j", "k", "l", "m", "n", "p", "r", "s", "t", "u", "v", "w", "tr",
	    "cr", "br", "fr", "th", "dr", "ch", "ph", "wr", "st", "sp", "sw", "pr", "sl", "cl"); 

		$num_vowels = count($vowels);
		$num_cons = count($cons);

		$password = '';
		
		for($i = 0; $i < $length; $i++)
		{
			$password .= $cons[rand(0, $num_cons - 1)] . $vowels[rand(0, $num_vowels - 1)];
		}

		return substr($password, 0, $length);
	}
}
```
    

To use it try this code:


```php
require 'password.php'

echo Password.generate(10);
```
    

It will spit out passwords that are semi-pronouncable.

