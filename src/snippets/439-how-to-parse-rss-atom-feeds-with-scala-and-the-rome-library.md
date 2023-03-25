---
id: '439'
title: How to parse RSS/Atom feeds with Scala and the Rome library
languages:
- java
tags:
---
This snippet shows how to parse feeds with Scala and the Rome library:


```java
import com.sun.syndication.io._
import com.sun.syndication.feed.synd._
import java.net.URL

object FeedParser {
  def main(args: Array[String]): Unit = {
    try {
      val sfi = new SyndFeedInput()

      val urls = List("http://hbl.fi/rss.xml")
      
      urls.foreach(url => {
        val feed = sfi.build(new XmlReader(new URL(url)))

        val entries = feed.getEntries()

        println(feed.getTitle())
        println(entries.size())
      })
    } catch {
      case e => throw new RuntimeException(e)
    }
    
  }
}
```
    

Also see:
<https://gist.github.com/585235/bf328d90d094305121cec0ba2a646ce0093fa654>

