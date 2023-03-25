---
id: '63'
title: Parse a date in java
languages:
- java
tags:
---
A simple class that parses a date given in finnish formats d.m.yyyy, dd.mm.yyyy and ddmmyyyy.


```java
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateParser {

  Calendar calendar = null;

  public DateParser(String dateAsString) {
    if ( dateAsString == null || dateAsString.length() < 8 ) {
      throw new RuntimeException("String must be at least 8 characters long and in one of these formats: ddmmyyyy | d.m.yyyy | dd.mm.yyyy");
    }
    dateAsString = dateAsString.replaceAll("\\.","");
    String parseString = "ddMMyyyy";
    if ( dateAsString.length() < 8 ) {
      parseString="dMyyyy";
    }
    try {
      Date date = new SimpleDateFormat(parseString).parse(dateAsString);
      calendar = Calendar.getInstance();
      calendar.setTime(date);
    } catch (Exception e) {
      throw new RuntimeException("String must be at least 8 characters long and in one of these formats: ddmmyyyy | d.m.yyyy | dd.mm.yyyy",e);
    }
  }

  public int getDayOfMonth() {
    return calendar.get(Calendar.DATE);
  }

  public int getMonth() {
    return calendar.get(Calendar.MONTH) + 1;
  }

  public int getYear() {
    return calendar.get(Calendar.YEAR);
  }

  public Calendar getTime() {
    return calendar;
  }

}
```
    

