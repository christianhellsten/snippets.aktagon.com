---
id: '757'
title: How to Join Two Tables with jmoiron/sqlx
languages:
- go
tags:
---
Here's an example of how to define relationships between structs when using SQL joins and sqlx:


```go
type Feed struct {
  ID        int       `json:"id"`
  Title     string    `json:"title"`
  URL       string    `json:"url"`
  CreatedAt time.Time `json:"created_at" db:"created_at"`
}

type FeedItem struct {
  ID          int            `json:"id"`
  Title       string         `json:"title"`
  Description sql.NullString `json:"description"`
  URL         string         `json:"url"`
  CreatedAt   time.Time      `json:"created_at" db:"created_at"`
  FeedId      int            `json:"feed_id" db:"feed_id"`
  Feed        `db:"feed"` // << NOTE PREFIX 
}

func getFeeds() (*[]Feed, error) {
  feeds := []Feed{}
  err := db.Select(&feeds, "SELECT * FROM feeds")
  return &feeds, err
}

func getFeedItems() (*[]FeedItem, error) {
  items := []FeedItem{}
  sql := `SELECT
      feed_items.*,
      feeds.id "feed.id",
      feeds.title "feed.title",
      feeds.url "feed.url",
      feeds.created_at "feed.created_at"
    FROM
      feed_items JOIN feeds ON feed_items.feed_id = feeds.id;`
  err := db.Select(&items, sql)
  return &items, err
}
```
