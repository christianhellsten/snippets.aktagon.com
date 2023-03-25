---
id: '835'
title: Postgres SQL query for extracting and querying a JSON object containing an
  array of JSON objects
languages:
- json
- sql
tags:
---
Postgres 12 supports the SQL/JSON Path Language which makes querying JSON documents a lot easier than before:
https://www.postgresql.org/docs/12/functions-json.html#FUNCTIONS-SQLJSON-PATH

Example:

```json
'$.track.segments[*].location'
```

For older versions we have to do the extraction the hard way...

For example, if we want to extract data from a JSONB column stored in PostgreSQL. The JSON object (hash, dictionary, map, object) contains an array of JSON objects:

```json
{
  "responses": [
    {
      "patient": {
        "ssid": "101010-XXXX",
      },
      "patient": {
        "ssid": "070710-XXXX",
      }
   ]
 }
}
```

In Postgresql 9.4 and higher we can write the following query to query nested arrays of objects:

```sql
SELECT
   * 
FROM
   messages 
WHERE
   body -> 'responses' @> '[{"patient":[{"ssid":"070710-XXXX"}]}]';
```

In earlier versions of Postgres we can use the jsonb_array_elements function:

```sql
WITH json_messages AS (
 SELECT jsonb_array_elements(body#>'{responses}')->'patient'->>'ssid', id from messages
)
SELECT * FROM json_messages WHERE ssid = '010150-XXXX';
```

To extract the values, we can use a lateral join and jsonb_array_elements:

```sql
SELECT DISTINCT(o.data -> 'status')
FROM json_messages m, jsonb_array_elements(m.body_json -> 'reports') d(data), jsonb_array_elements(d.data -> 'results') o(data)
```

## Reference

- https://www.postgresql.org/docs/current/functions-json.html
- https://stackoverflow.com/a/33640161
