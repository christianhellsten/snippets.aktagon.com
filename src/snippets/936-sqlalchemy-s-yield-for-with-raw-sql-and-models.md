---
id: '936'
title: SQLAlchemy's yield_for with raw SQL and models
languages:
- python
tags:
---
```python
from sqlalchemy import text

session = ...
q = session.query(Report).from_statement(text("""
SELECT
    id
FROM
    reports
WHERE
    id = '51812'
ORDER BY
    id DESC;
""")).yield_per(100)
```
