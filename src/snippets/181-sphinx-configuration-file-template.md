---
id: '181'
title: Sphinx configuration file template
languages:
tags:
---

```
source feed_items
{
        type                    = mysql

        sql_host                = 127.0.0.1
        sql_user                = root
        sql_pass                =
        sql_db                  = xxx_production
        sql_port                = 3306  # optional, default is 3306
        sql_sock                = /var/run/mysqld/mysqld.sock

        sql_query_pre           = SET NAMES utf8
        #sql_query_pre          = SET SESSION query_cache_type=OFF

	# Unique ID should be first column
        sql_query               = \
                SELECT i.id, i.title, i.link, f.link, f.title FROM feed_items i LEFT JOIN feeds f ON f.id = i.feed_id
}


index feed_items
{
        source                  = feed_items
        path                    = /var/sphinx/xxx
        morphology              = libstemmer_sv
        charset_type            = utf-8
}


indexer
{
        mem_limit               = 32M
}

searchd
{
        address                 = 127.0.0.1
        port                    = 3312
        log                     = /var/log/sphinx/searchd.log
        query_log               = /var/log/sphinx/query.log
        pid_file                = /var/log/searchd.pid
        max_matches             = 1000
}
```
    

