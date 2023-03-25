---
id: '611'
title: How to use ElasticSearch with Python
languages:
- python
tags:
---
This is a short example on how to use ElasticSearch with Python.

First install pyes ([pyes documentation](http://pyes.readthedocs.org/en/latest/)).

Then run this code:


```python
# https://pyes.readthedocs.org/en/latest/references/pyes.es.html
# http://davedash.com/2011/02/25/bulk-load-elasticsearch-using-pyes/
from pyes import *

index_name = 'xxx'
type_name = 'car'

conn = ES('127.0.0.1:9200', timeout=3.5)

docs = [
    {"name":"good",  "id":'1'},
    {"name":"bad", "id":'2'},
    {"name":"ugly", "id":'3'}
]

# Bulk index
for doc in docs:
    # index(doc, index, doc_type, id=None, parent=None, force_insert=False, op_type=None, bulk=False, version=None, querystring_args=None)
    conn.index(doc, index_name, type_name, id=doc['id'], bulk=True)

print conn.refresh()

# Search
def search(query):
    q = StringQuery(query, default_operator="AND")
    result = conn.search(query=q, indices=[index_name])
    for r in result:
        print r


search("good")
```
    

You can also use CURL to verify that it works:


```python
# Show index mapping
curl -vvv "http://127.0.0.1:9200/xxx/_mapping?pretty=1"

# Delete index
curl -XDELETE -vvv "http://127.0.0.1:9200/xxx"

# Search
curl -vvv "http://127.0.0.1:9200/xxx/_search?pretty=1"
```
    

