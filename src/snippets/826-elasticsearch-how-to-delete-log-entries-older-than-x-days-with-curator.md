---
id: '826'
title: 'Elasticsearch: How to delete log entries older than X days with Curator'
languages:
- bash
- cron
tags:
---
```bash
# Install curator
pip install curator
# Download curator config file
curl -o curator.yml https://raw.githubusercontent.com/elastic/curator/master/examples/curator.yml
```

Next, download, read, and edit the action file:
https://www.elastic.co/guide/en/elasticsearch/client/curator/current/actionfile.html

```bash
# Run curator
curator --config curator.yml action_file.yml
```

Add this to crontab:

```cron
# Run curator at 00:01
01 00 * * * /usr/local/bin/curator --config /etc/elasticsearch/curator/curator.yml /etc/elasticsearch/curator/remove-old-data.yml >> /var/log/elasticsearch-cu
rotor.log
```

Tested with Elasticsearch 6.0 and curator version 5.4.1.
