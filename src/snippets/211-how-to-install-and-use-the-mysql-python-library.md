---
id: '211'
title: How to install and use the mysql-python library
languages:
- python
tags:
---
First download mysql-python from <http://sourceforge.net/projects/mysql-python>.

Extract it and run:


```python
python setup.py build
sudo python setup.py install
```
    

If you get this error you need to install python-dev package:


```python
In file included from _mysql.c:29:
pymemcompat.h:10:20: error: Python.h: No such file or directory
_mysql.c:30:26: error: structmember.h: No such file or directory
In file included from /usr/include/mysql/mysql.h:44,
                 from _mysql.c:40:
.
.
.
_mysql.c:2808: warning: return type defaults to 'int'
_mysql.c: In function 'DL_EXPORT':
_mysql.c:2808: error: expected declaration specifiers before 'init_mysql'
_mysql.c:2886: error: expected '{' at end of input
error: command 'gcc' failed with exit status 1
```
    

Installing the python-dev package on Debian is done with apt-get or synaptic:


```python
apt-get install python-dev
```
    

Installing the library should now work:


```python
python setup.py build
python setup.py install
```
    

Next test the library in the python console:


```python
import MySQLdb

# Note that this example uses UTF-8 encoding
conn = MySQLdb.connect(host='localhost', user='...', passwd='...', db='...', charset = "utf8", use_unicode = True)
cursor = conn.cursor()


cursor.execute ("SELECT * FROM cities")
rows = cursor.fetchall ()

for row in rows:
  print "%s, %s" % (row[0], row[1].encode('utf-8'))

print "Number of rows returned: %d" % cursor.rowcount
```
    

Don't forget to close the cursor and connection, and if you're inserting data commit before closing, because autocommit is disabled by default:


```python
cursor.close ()
conn.commit ()
conn.close ()
```
    

For more information about MySQLdb see [this article](http://www.kitebird.com/articles/pydbapi.html).

