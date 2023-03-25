---
id: '986'
title: Rails silently committing transactions instead of rolling back
languages:
tags:
---
Rails will silently commit transactions instead of rolling back when using return, break, or throw to exit a transaction block.

You will see the following deprecation warning in Rails 6.1 and higher:

```
DEPRECATION WARNING: Using `return`, `break` or `throw` to exit a transaction block is                                        ] 54% Time: 00:00:02,  ETA: 00:00:02
deprecated without replacement. If the `throw` came from
`Timeout.timeout(duration)`, pass an exception class as a second
argument so it doesn't use `throw` to abort its block. This results
in the transaction being committed, but in the next release of Rails
it will rollback.
```

## Solutions

Possible solutions:

1. Use raise ActiveRecord::Rollback to exit the transaction block. This will rollback earlier changes and continue execution after the transaction block, in other words, the code will not raise an exception. The transaction WILL NOT commit.
2. Use next to exit the transaction block. Earlier changes will be commited. The transaction WILL commit.

## References:

https://github.com/rails/rails/pull/29333

https://github.com/rails/rails/commit/fc83920383b5f839cd6badbc5c962be9383fe150
