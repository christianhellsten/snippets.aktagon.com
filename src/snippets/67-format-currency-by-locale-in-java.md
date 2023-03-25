---
id: '67'
title: Format currency by Locale in Java
languages:
- java
tags:
---
There are a few ways to format currency to your own locale. If you want the formatted result to appear without the currency sign then this is probably one of the better ways to do it. In the real world you would dig the locale from the user's request or session and pass it as a parameter to the method.


```java
public static String formatCurrency(String amount) {
    NumberFormat decimalFormat = NumberFormat.getInstance(new Locale("fi", "FI", ""));
    decimalFormat.setMinimumFractionDigits(2);
    return decimalFormat.format(amount);
}
```
    

