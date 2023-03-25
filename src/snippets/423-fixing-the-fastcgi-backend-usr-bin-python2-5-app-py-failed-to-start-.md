---
id: '423'
title: Fixing "the fastcgi-backend /usr/bin/python2.5 app.py failed to start:"
languages:
tags:
---
If you're getting an error similar to this one on Ubuntu:


```
$ 2010-01-07 11:35:20: (log.c.97) server started 
2010-01-07 11:35:20: (mod_fastcgi.c.1051) the fastcgi-backend /usr/bin/python2.5 /var/www/xxx/app.py failed to start: 
2010-01-07 11:35:20: (mod_fastcgi.c.1055) child exited with status 1 /usr/bin/python2.5 /var/www/xxx/app.py 
2010-01-07 11:35:20: (mod_fastcgi.c.1058) If you're trying to run PHP as a FastCGI backend, make sure you're using the FastCGI-enabled version.
You can find out if it is the right one by executing 'php -v' and it should display '(cgi-fcgi)' in the output, NOT '(cgi)' NOR '(cli)'.
For more information, check http://trac.lighttpd.net/trac/wiki/Docs%3AModFastCGI#preparing-php-as-a-fastcgi-programIf this is PHP on Gentoo, add 'fastcgi' to the USE flags. 
2010-01-07 11:35:20: (mod_fastcgi.c.1365) [ERROR]: spawning fcgi failed. 
2010-01-07 11:35:20: (server.c.902) Configuration of plugins failed. Going down.
```
    

check the following:

\* are the /var/www and /var/www/python-test directories readable by the www-data group? If not: chgrp -R /var/www
\* are you specifying the full path to both python binary and the script?
\* have you installed flup? If not: sudo easy\_install flup or sudo easy\_install-2.5 flup
\* can the www-data user run the script? Check with: su - www-data then /usr/bin/python2.5 /var/www/xxx/app.py.
\* does your configuration work? This works for me:


```
"/app.py" => ((
                "bin-environment" => (
                    "REAL_SCRIPT_NAME" => ""
                ),
                "check-local" => "disable",
                "min-procs" => 1,
                "bin-path" => "/usr/bin/python2.5 /var/www/xxx/app.py",
                "socket"   => "/tmp/fastcgi.socket"
        ))
```
    

