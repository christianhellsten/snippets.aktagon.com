---
id: '952'
title: Exactly-once delivery with RabbitMQ
languages:
tags:
---
Use late acknowledgment and idempotency to fake exactly-once delivery with RabbitMQ. Remember, there's no exactly-once delivery even if your messaging software provider claims so.

Late acknowledgment = acknowledge the message after the message has been processed and the database transaction has been committed.

Idempotency = ensure the effect is the same when processing the same message multiple times. In other words, don't process the same message twice.

Reconciliation step = if you need 100% reliability create a process (manual or automatic) that checks that all work is done, if not resend the message.

The customer is the last line of defense and they will let you know if one of the above steps have failed.
