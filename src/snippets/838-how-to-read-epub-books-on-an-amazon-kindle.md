---
id: '838'
title: How to read Epub books on an Amazon Kindle
languages:
- bash
tags:
---
The Amazon Kindle does not support the Epub format, so to read Epub books on an Amazon Kindle you need to convert the book to the Mobi format.

## Convert from Epub to Mobi

- Download the book in Epub format.

- Download the KindleGen command line tool from Amazon:
https://www.amazon.com/gp/feature.html?ie=UTF8&docId=1000765211

- Open a command line terminal and convert the Epub file to Mobi:

```bash
$ ./kindlegen your_book.epub
```

## Send the book to your Kindle via email

- Open Amazon's Manage Your Kindle page in a browser:
https://www.amazon.com/hz/mycd/myx

- Find your Kindle's email address on the Your Devices page

For example:  xxx_xxx@kindle.com

- Send the book to your Kindle as an email attachment
