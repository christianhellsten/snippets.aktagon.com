---
id: '950'
title: Troubleshooting Python's Celery
languages:
- python
tags:
---
## Task celery.chord_unlock[38d5105a-12f2-4119-80e5-184167998f4b] retry: Retry in 1.0s

The notes https://docs.celeryproject.org/en/latest/userguide/canvas.html#chords:

> If you’re using chords with the Redis result backend and also overriding the Task.after_return() method, you need to make sure to call the super method or else the chord callback won’t be applied.

## TypeError: task() argument after ** must be a mapping, not list

## missing 3 required positional arguments

If you get this error:

> TypeError: after_return() missing 3 required positional arguments: 'args', 'kwargs', and 'einfo'

You might have specified the arguments incorrectly, for example:

```python
job = job_task.subtask(1, 2, 3)
```

Use a list to fix the error:

```python
job = job_task.subtask((1, 2, 3))
```
