---
id: '421'
title: How to use the Perl DBI module
languages:
- perl
tags:
---
Basic usage
-----------


```perl
use strict;
use DBI;
use DBD::mysql;

my $host = 'localhost';
my $database = 'xxx';
my $user = 'xxx';
my $password = '';

my $dsn = "dbi:mysql:$database:$host:3306";
my $db = DBI->connect($dsn, $user, $password);
 
my $sql = q(
  INSERT INTO 
    what (name, instructions) 
  VALUES (?, ?)
);

my $p = $db->prepare($sql);

my $result = $p->execute($name, $instructions);

print $result;

my $id = $dbh->{'mysql_insertid'};
```
    

One-liner for selecting one row
-------------------------------


```perl
my $c = 'Horse';
my ($id, $instructions) = $db->selectrow_array("select id, instructions from categories where name = ?", undef, $c);
```
    

