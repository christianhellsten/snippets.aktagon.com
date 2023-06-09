---
id: '51'
title: How to Calculate a reference number with Ruby
languages:
- ruby
tags:
---
This code can be used for calculating reference numbers. We inject a new method into the String and Fixnum classes that calculates the reference number for the corresponding string or fixnum:


```ruby
class InvalidReferenceNumber < StandardError
end

module ReferenceNumber
  def to_reference_number
    input = self  
    
    if(input.is_a? Fixnum)
      input = self.to_s
    end
    
    raise InvalidReferenceNumber, "Input should be between 3 to 19 characters long" if (input.length < 3 || input.length > 19)
    raise InvalidReferenceNumber, "Only spaces and numbers are allowed" if (input =~ /[^ \d]/) != nil

    input.gsub!(/ /, "")
    input.sub!(/0*/, "") # remove leading zeros

    raise InvalidReferenceNumber, "Input can't be just spaces and zeroes." if(input.length == 0)

    input.reverse!
    base = "731" * 50
    
    index = 0
    sum   = 0

    input.each_byte do |b|
      result = b.chr.to_i * base[index % 3].chr.to_i
      sum = sum + result
      index = index + 1
    end
    
    # Calculate the last number. If sum = 94 then number is 6.
    difference = (10 - (sum % 10)) % 10

    input = "#{difference}#{input}".reverse!
  end
end

class String
  include ReferenceNumber
end

class Fixnum
  include ReferenceNumber
end
```
    

Example usage:


```ruby
"1111".to_reference_number
1111.to_reference_number
```
    

The above example prints out "11112".

This example shows how to generate a series of reference number:


```ruby
(1000..1023).to_a.each do |number|
  puts number.to_reference_number
end
```
    

Here's a unit test:


```ruby
class ReferenceNumberGeneratorTest < Test::Unit::TestCase
  def test_100_is_1009
    assert_equal "1009", "100".to_reference_number
  end
  def test_000100_is_1009
    assert_equal "1009", "000100".to_reference_number
  end
  def test_1000_is_10003
    assert_equal "10003", "1000".to_reference_number
  end
  def test_10000_is_100007
    assert_equal "100007", "10000".to_reference_number
  end
  def test_234_is_2341
    assert_equal "2341", "234".to_reference_number
  end
  def test_0234_is_2341
    assert_equal "2341", "0234".to_reference_number
  end
  def test_123123123234234234_is_1231231232342342349
    assert_equal "1231231232342342349", "123123123234234234".to_reference_number
  end
  def test_1000000000_is_10000000003
    assert_equal "10000000003", "1000000000".to_reference_number
  end
end
```
    

