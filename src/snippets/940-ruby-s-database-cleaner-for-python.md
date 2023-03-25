---
id: '940'
title: Ruby's database_cleaner for Python
languages:
- python
tags:
---
A simple version of Ruby s database_cleaner gem for Python:

db.py:

```python
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

engine = create_engine(
    'postgresql+psycopg2://',
    connect_args={"options": f"-c timezone=utc -csearch_path=public"}
)
Session = sessionmaker(bind=engine, autoflush=True)
```

tests/conftest.py:

```python
import pytest
from db import Session, engine

# You can also use "autouse"
# @pytest.fixture(autouse=True)
@pytest.fixture
def session():
    connection = engine.connect()
    session = Session(bind=connection)
    transaction = connection.begin()
    try:
        yield session
    finally:
        session.close()
        transaction.rollback()
        connection.close()
```

tests/test_something.py:

```python
def test_something_with_session(session):
    # Session is automatically inserted by the fixture
end
```

Also see:
https://docs.sqlalchemy.org/en/14/orm/session_transaction.html#tracking-transaction-state-with-events

