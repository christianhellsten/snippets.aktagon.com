---
id: '953'
title: Postgrest docker-compose.yml
languages:
- yaml
tags:
---
```yaml
version: "3"
services:
  postgrest:
    container_name: postgrest
    image: postgrest/postgrest:v7.0.1
    # entrypoint: ''
    # command: ls -l
    ports:
      # Forward host port 8080 to postgrest
      - "8080:3000"
    environment:
      PGRST_DB_URI: postgres://user:password@192.168.0.1:5432/db_name
      # The schema that Postgrest exposes
      PGRST_DB_SCHEMA: public
      # The role that is used to perform unauthenticated queries
      PGRST_DB_ANON_ROLE: app_user
      PGRST_SERVER_PROXY_URI: "http://127.0.0.1:3001"

  swagger:
    image: swaggerapi/swagger-ui
    ports:
      # Forward host port 8081 to swagger
      - "8081:8080"
    expose:
      - "8080"
    environment:
      # Tell Swagger to document the postgrest API
      API_URL: http://localhost:8080/
```
