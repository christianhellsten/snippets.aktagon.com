---
id: '207'
title: How to parse RSS/Atom feeds with the ROME Java library
languages:
- java
tags:
---
This is a simple example of how to use the ROME library to parse feeds:


```java
import com.sun.syndication.io.*;
import com.sun.syndication.feed.synd.*;
import java.net.URL;
import java.util.*;

public class RomeParserTest {

	public static void main(String args[]) {
		try {
			SyndFeedInput sfi = new SyndFeedInput();

			String urls[] = {
				"...", 
				"..." 
			};
			
			for(String url:urls) {
				SyndFeed feed = sfi.build(new XmlReader(new URL(url)));

				List entries = feed.getEntries();

				System.out.println(feed.getTitle());			
				System.out.println(entries.size());
			}
		} catch (Exception ex) {
			throw new RuntimeException(ex);
		}
	}
}
```
    

