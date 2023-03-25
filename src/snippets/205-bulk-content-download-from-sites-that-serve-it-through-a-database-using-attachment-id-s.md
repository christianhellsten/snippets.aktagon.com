---
id: '205'
title: Bulk content download from sites that serve it through a database using attachment
  id's
languages:
- bash
tags:
---
This needs to be customized according to site. The --content-disposition is experimental. It also may cause files by the same name to be downloaded. Wget will name them like abc.jpg, abc.jpg.1, abc.jpg.2 and so on. You can always [rename](http://snippets.aktagon.com/snippets/4-Bulk-renaming-of-files) them afterwards :)


```bash
#!/bin/bash
destination_dir=$HOME/thecontent
mkdir -p $destination_dir
for page in 0 1 2 3 4 5 6 7 8 9; do 
	attachment_ids=$(wget -O - "http://www.xyz.com/showthread.php?page=77${page}" |grep attachmentid|cut -d'"' -f2| cut -d'=' -f3 |cut -d'&' -f1)
	for attachment_id in $attachment_ids; do
		wget --content-disposition --directory-prefix=$destination_dir http://www.xyz.com/attachment.php?attachmentid=${attachment_id}
	done
done
```
    

