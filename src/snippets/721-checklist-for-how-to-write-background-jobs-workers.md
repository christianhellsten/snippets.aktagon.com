---
id: '721'
title: Checklist for how to write background jobs/workers
languages:
tags:
---
Checklist
---------

1.  Idempotent

    Jobs should be idempotent. If a job is performed multiple times the work should only be performed once, or at least the end-result should be the same.

<!-- -->

1.  Optimistic/pessimistic/distributed locking

    You need to use different types of strategies to prevent code from being executed more than once in a distributed environment. Jobs can be executed twice under many circumstances, e.g. because of:
    - misconfiguration of Sidekiq
    - a bug in Sidekiq
      - https://github.com/mperham/sidekiq/issues/897
      - https://github.com/mperham/sidekiq/pull/624)
      - https://github.com/mperham/sidekiq/issues/694#issuecomment-18591582
    - queueing job twice
    - millions of other reasons

Solving these issues can be done with, e.g.: optimistic locking, pessimistic locking, and distributed locking, e.g. with redis-semaphore.

1.  Retry
    Set retry to zero for jobs that don’t need to or shouldn’t be retried.

<!-- -->

1.  Priority
    Specify a queue and a queue priority for jobs that need a higher or lower priority.

<!-- -->

1.  Transactions
    Does the job need database transactions? Use transactions e.g. when a job does more than one insert, update, delete, or create, otherwise you will end up having data duplication/inconsistency issues.

<!-- -->

1.  Messaging
    Sidekiq is not a messaging queue. At-least-once execution is 100% guaranteed by Sidekiq Pro. I don't trust that guarantee 100%, but that is another story. The question is: what happens if the job fails (dead job queue, dev null)? What you usually need is "job successfully executed at-least-once" not "job executed at-least once".

Ensuring jobs are performed at-least-once and at-most-once
----------------------------------------------------------

You can't rely on Sidekiq, or any other messaging or job queue, to execute your job (business logic) once and exactly once. All work needs to be checked for consistency.

For example, messages/jobs can be lost under many circumstances, and the same job (business logic) can be executed an unlimited amount of times unless your application takes the necessary steps to ensure that the job is performed correctly. A background processing/messaging server should be considered unreliable.

### At-least-once

Use a reconsiliation step, e.g. a separate worker that runs once per day, to make sure jobs are executed at least once: <http://www.mikeperham.com/2014/05/27/the-reconciliation-step/>

1.  Databases: At-least-once is achieved when you have the data in your database and are polling to see if the job has been performed. Locking => performance issues.
2.  Sidekiq: At-least-once is achieved when you monitor the dead job queue 100% using available eyeballs.
3.  Messaging queues: At-least-once is achieved through message acknowledgment and/or through monitoring the dead letter queue 100% using available eyeballs.

### At-most-once

Use a flag, nonce, or a guid to ensure a job is only run once, i.e. do nothing if a job is queued twice for some reason. Avoid locking database tables when possible. Use optimistic/pessimistic/distributed locks when locking is needed.

### Order

- Should jobs be executed in order?
- What happens if job is executed, e.g., 1 month too late?

Conclusion
----------

Don't trust your messaging and background processing server to do its job without either manual supervision (eyeballs) or automated supervision (at-least-once and at-most-once).

