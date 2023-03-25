---
id: '901'
title: Total hours between start and end time - Google Spreadsheet
languages:
tags:
---
I want to extract the total hours worked from a Google spreadsheet.

Given the following data in a Google spreadsheet:

- End time in column D using time format
- Start time in column C using time format

For example:

```
start,end,hours
10:00,12:00,2
9:00,12:00,3
```

To achieve this in a Google spreadsheet we can use the following formula:

```
=ARRAYFORMULA((HOUR(D496-C496))+(MINUTE((D496-C496)))/60)
```

Reference:
https://infoinspired.com/google-docs/spreadsheet/payroll-hours-time-calculation-in-google-sheets/
