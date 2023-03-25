---
id: '975'
title: Simple backup script with GPG encryption
languages:
- bash
tags:
---
Save to a file named backup and run **chmod +x backup**:

```bash
#!/bin/bash
#
# Uses tar to store files in one TAR file.
# Uses gpg to encrypt the TAR file.
#
# Example:
#
# ./backup /folder-to-backup
#
#
export DIR_NAME=$1
export BACKUP_DATE=`date +"%Y%m%d-%H%M"`
export BACKUP_FILE=$DIR_NAME-$BACK_UPDATE.tar
tar -cvf $BACKUP_FILE $DIR_NAME
#
# TODO:
# --exclude="*.log"
# -r = recipient (only one who can decrypt)
#
gpg --encrypt -r x@y.com $BACKUP_FILE
```
