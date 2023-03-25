---
id: '23'
title: Validating an email address in Java
languages:
- java
tags:
---
The source of the regexp is this site: [Email unlimited](http://www.email-unlimited.com/stuff/email_address_validator.htm). According to [Wikipedia](http://en.wikipedia.org/wiki/E-mail_address) the regexp on the source page validates the email address according to [RFC 2822 - Internet Message Format](http://tools.ietf.org/html/rfc2822). I have still to write a comprehensive test suite, but the tests I do have for this validator pass.


```java
public class EmailValidator {
  public static boolean validate(final String emailAddress) {
    if ( emailAddress == null ) return false;
    String patternStr = "^[-!#$%&'*+/0-9=?A-Z^_a-z{|}~](\\.?[-!#$%&'*+/0-9=?A-Z^_a-z{|}~])*@[a-zA-Z](-?[a-zA-Z0-9])*(\\.[a-zA-Z](-?[a-zA-Z0-9])*)+$";
    Pattern emailPattern = Pattern.compile(patternStr);
    return emailPattern.matcher(emailAddress).matches();
  }
}
```
    

