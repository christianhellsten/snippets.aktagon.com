---
id: '966'
title: Celery tips
languages:
tags:
---
1. Set a global task timeout

The default is no timeout.

CELERYD_TASK_SOFT_TIME_LIMIT = 30
CELERYD_TASK_TIME_LIMIT = 60

2. Use autoretry_for

By default, no exceptions will be retried.

3. Set max_retries at task or global level

The default is 3 retries. None means unlimited retries.

4. Use queues

Otherwise, low priority tasks might prevent higher priority tasks from being executed.

> @app.task(base=SqlAlchemyTask, queue='medium')

5. Use Flower for monitoring

https://docs.celeryproject.org/en/latest/userguide/monitoring.html#flower-real-time-celery-web-monitor

6. Separate slow tasks from fast tasks

Slow tasks will monopolizes workers, even if you have separate queues.

7. Use late_ack=True

Setting late_ack to True means we acknowledge the message after the task has run, not when received. This increases reliability.

8. Make tasks idempotent

9. There's no exactly-once

Exactly-once is a lie.

Reference:

- https://docs.celeryproject.org/en/stable/userguide/tasks.html

- https://lc0.github.io/blog/2013/05/01/celery-messaging-at-scale-at-instagram/
