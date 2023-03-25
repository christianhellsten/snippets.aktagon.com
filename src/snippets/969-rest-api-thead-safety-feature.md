---
id: '969'
title: REST API thead-safety feature
languages:
tags:
---
REST API safety feature:

1. Include a request ID in the request and response.
2. Check that the response contains the request ID.


Benefits:

- You will be able to notice any concurrency issues in your own code and 3rd party code, which might cause the wrong response to be returned
- Easier to debug requests and responses
