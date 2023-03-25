---
id: '927'
title: How to use PostgreSQL advisory locks with SQLAlchemy and Python
languages:
- python
tags:
---
advisory_lock.py

```python
from models import Session
from sqlalchemy import func, select


def execute(session, lock_fn, lock_id, scope):
    """
    Executes the lock function
    """
    return session.execute(select([lock_fn(lock_id, scope)])).scalar()


def obtain_lock(session, lock_id, scope):
    """
    Obtains the advisory lock
    """
    lock_fn = func.pg_try_advisory_lock
    return execute(session, lock_fn, lock_id, scope)


def release_lock(session, lock_id, scope):
    """
    Releases the advisory lock
    """
    lock_fn = func.pg_advisory_unlock
    return execute(session, lock_fn, lock_id, scope)


def with_lock(my_func, lock_id, scope=1):
    """
    Executes my_func if the lock can be obtained.
    """
    session = Session()
    obtained_lock = False
    try:
        obtained_lock = obtain_lock(session, lock_id, scope)
        if obtained_lock:
            my_func()
    finally:
        if obtained_lock:
            release_lock(session, lock_id, scope)
```

Usage:

```python
from advisory_lock import with_lock

def run():
    print("It runs")

if __name__ == '__main__':
    with_lock(run, 300000)
```

There are two types of advisory locks:

- session-level: released when session ends (might be never when using session pooling), or manually with pg_advisory_unlock

For example: pg_try_advisory_lock

- transaction-level: released automatically on commit and rollback

For example: pg_advisory_xact_lock
