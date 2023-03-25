---
id: '704'
title: Daemonization Best-Practices
languages:
tags:
---
[Don't daemonize your daemons](http://mikeperham.com/2014/09/22/dont-daemonize-your-daemons/)

<quote>
What’s the result? In development mode, your process will run in the foreground, as yourself and log to stdout: perfect for developers. In production mode, the init system will run your process as a configured user with logging sent to a specific location and log rotated automatically. Less system administration, easier debugging, simpler code, all because you leveraged the init system to do the work for you!</quote>

[Running processes](http://dustin.sallings.org/2010/02/28/running-processes.html#whatswrong)

<quote>
Note: In every case, it’s assumed that you have a program that wants to run that does not daemonize on its own. Self-daemonizing programs start you down the path to hell. You can’t use any sane keepalive techniques so you have to resort to polling process lists or checking the pid or something. Even managing that pidfile gets hard when you combine it with things that change their own uid for safety (because you should never run anything as root).</quote>

[Ubuntu, upstart, and creating a pid for monitoring](http://stackoverflow.com/a/10539980)

<quote>
If start-stop-daemon is available on your machine, I would highly recommend using it to launch your process. start-stop-daemon will handle launching the process as an unprivileged user without forking from sudo or su (recommended in the upstart cookbook) AND it also has built in support for pid file management.</quote>

[Foreman](http://ddollar.github.io/foreman/)

<quote>
Foreman is a manager for Procfile-based applications. Its aim is to abstract away the details of the Procfile format, and allow you to either run your application directly or export it to some other process management format.</quote>

