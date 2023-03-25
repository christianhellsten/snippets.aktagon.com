---
id: '971'
title: How to simulate TCP read, write, and connect timeouts
languages:
tags:
---
How to simulate TCP read, write, and connect timeouts:

- Connect timeout

Option 1: Drop all SYN packets with firewall or iptables rules

Option 2: Try connecting to a non-routable IP, e.g., 10.0.0.0

- Read timeout

Read from a socket to which the client or server is not writing while keeping the socket open on both ends.

- Write timeout

You're (almost) out of luck. There are OS-level buffers, so the write timeout might never happen.

Option 1: Use https://github.com/openresty/mockeagain and LD_PRELOAD to mock syscalls

Reference:

https://github.com/openresty/programming-openresty/blob/master/testing/testing-erroneous-cases.adoc

https://github.com/openresty/mockeagain
