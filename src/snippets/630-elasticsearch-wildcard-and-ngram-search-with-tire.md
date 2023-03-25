---
id: '630'
title: ElasticSearch Wildcard and NGram Search With Tire
languages:
- ruby
tags:
---
How to implement wildcard search with Tire and Elasticsearch:


```ruby
settings analysis: {
    filter: {
      ngram_filter: {
        type: "nGram",
        min_gram: 1,
        max_gram: 15
      }
    },
    analyzer: {
      index_ngram_analyzer: {
        tokenizer: "standard",
        filter: ['standard', 'lowercase', "stop", "ngram_filter"],
        type: "custom"
      },
      search_ngram_analyzer: {
        tokenizer: "standard",
        filter: ['standard', 'lowercase', "stop"],
        type: "custom"
      }
    }
  }

  mapping do
    indexes :name,
      search_analyzer: 'search_ngram_analyzer',
      index_analyzer: 'index_ngram_analyzer', 
      #analyzer: 'index_ngram_analyzer', 
      boost: 100.0
      # …
  end
```
    

With curl, make sure the mapping is set up properly:


```ruby
curl 'http://localhost:9200/activities/_mapping?pretty=true'
{
  "skulls" : {
    "skull" : {
      "_all" : {
        "auto_boost" : true
      },
      "properties" : {
        "name" : {
          "type" : "string",
          "boost" : 100.0,
          "analyzer" : "index_ngram_analyzer"
        }
      }
    }
  }
}
```
    

You now have wildcard search as long as you remember to specify the fields that you want to search, because by default the \_all field is used for search:


```ruby
# This searches the _all field
curl 'http://localhost:9200/activities/_search?q=simpsons&pretty=true'

# Yes, it really works
curl -XGET 'http://localhost:9200/activities/_search?pretty' -d ' 
{ 
   "query" : { 
      "query_string" : { 
         "query" : "simpsons", 
         "fields" : ["name"] 
      } 
   } 
}'
```
    

