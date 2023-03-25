---
id: '918'
title: D3.js ticks every n months, weeks, years, and quarters
languages:
- javascript
tags:
---
Use D3.js ranges to display ticks every n months, weeks, years, and quarters:

```javascript
var xAxis = d3.axisBottom()
xAxis.tickValues(d3.timeMonths(firstQtr, lastQtr, 4))
```

Reference:
https://github.com/d3/d3-time#ranges
