---
id: '850'
title: How to read barcodes with ZXing and ZBar
languages:
- bash
tags:
---
How to read barcodes

- zxing (https://github.com/zxing/zxing)

```bash
$ java -cp javase.jar:core.jar com.google.zxing.client.j2se.CommandLineRunner barcode.png --try_harder --format=DATA_MATRIX
```

- zbar (http://zbar.sourceforge.net/)

```bash
$ zbarimg barcode.png
```

Note that cropping might improve detection accuracy. For example, crop image to show only the top-right corner using imagemagick's convert (width 1500, height 500):

```bash
$ convert example.png -gravity northeast -crop 1500x500+0+0 cropped.png
```

**NOTE**

- if you need data correction (reliability) use a Data Matrix (used on e.g. products), Aztec (used on e.g. tickets), or QR code. These allow up to 30% of the image to be unreadable.
- do not use a barcode that uses code 39 or 128. There is no error correction in code 39 and 128.
- SimpleCV can also be used to detect barcodes.
