---
id: '796'
title: Storing, querying, and indexing XML with Postgres
languages:
- sql
- xml
tags:
---
## Create table

```sql
CREATE TABLE xbrl_reports
(
  id serial primary key NOT NULL,
  doc xml NOT NULL,
  cik varchar(255) NOT NULL
);
```

## Create function for importing XML

```sql
-- http://tapoueh.org/blog/2009/02/05-importing-xml-content-from-file
create or replace function xml_import(filename text)
  returns xml
  volatile
  language plpgsql as
$f$
    declare
        content bytea;
        loid oid;
        lfd integer;
        lsize integer;
    begin
        loid := lo_import(filename);
        lfd := lo_open(loid,262144);
        lsize := lo_lseek(lfd,0,2);
        perform lo_lseek(lfd,0,0);
        content := loread(lfd,lsize);
        perform lo_close(lfd);
        perform lo_unlink(loid);
 
        return xmlparse(document convert_from(content,'UTF8'));
    end;
$f$;
```

## Import XML

```sql
-- Import XML file into Postgres
insert into xbrl_reports(doc, cik) values(xml_import('/Users/Christian/Downloads/2016q3/ibm-20160930.xml'), '1');
```

XML namespaces:
```xml
<xbrl
  xmlns="http://www.xbrl.org/2003/instance"
  xmlns:dei="http://xbrl.sec.gov/dei/2014-01-31"
```

## Query data

```sql
-- Check if dei::TradingSymbol exists => t
SELECT xpath('//xbrl:xbrl/dei:TradingSymbol/text()', doc, '{{xbrl,http://www.xbrl.org/2003/instance},{dei,http://xbrl.sec.gov/dei/2014-01-31}}') from xbrl_reports;

-- Extract dei:TradingSymbol by declaring dei namespace => {IBM}
SELECT xpath('//xbrl:xbrl/dei:TradingSymbol/text()', doc, '{{xbrl,http://www.xbrl.org/2003/instance},{dei,http://xbrl.sec.gov/dei/2014-01-31}}') from xbrl_reports;

-- Extract dei:TradingSymbol by adding ((...)[1]::text) => IBM
SELECT ((xpath('//xbrl:xbrl/dei:TradingSymbol/text()', doc, '{{xbrl,http://www.xbrl.org/2003/instance},{dei,http://xbrl.sec.gov/dei/2014-01-31}}'))[1]::text) from xbrl_reports;
```

## Index data

```sql
-- Create index for faster lookups
create index xbrl_reports_ticker_idx on xbrl_reports using btree ((( xpath('//xbrl:xbrl/dei:TradingSymbol/text()', doc, '{{xbrl,http://www.xbrl.org/2003/instance},{dei,http://xbrl.sec.gov/dei/2014-01-31}}') )[1]::text)); 
```

## Materialized views for performance

```sql
CREATE MATERIALIZED VIEW company_reports AS SELECT
  ((xpath('//xbrl:xbrl/dei:TradingSymbol/text()', doc, '{{xbrl,http://www.xbrl.org/2003/instance},{dei,http://xbrl.sec.gov/dei/2014-01-31}}'))[1]::text) as ticker,
  ((xpath('//xbrl:xbrl/dei:EntityRegistrantName/text()', doc, '{{xbrl,http://www.xbrl.org/2003/instance},{dei,http://xbrl.sec.gov/dei/2014-01-31}}'))[1]::text) as name,
  ((xpath('//xbrl:xbrl/dei:DocumentType/text()', doc, '{{xbrl,http://www.xbrl.org/2003/instance},{dei,http://xbrl.sec.gov/dei/2014-01-31}}'))[1]::text) as document_type,
  ((xpath('//xbrl:xbrl/dei:DocumentPeriodEndDate/text()', doc, '{{xbrl,http://www.xbrl.org/2003/instance},{dei,http://xbrl.sec.gov/dei/2014-01-31}}'))[1]::text) as quarter,
  ((xpath('//xbrl:xbrl/dei:EntityCommonStockSharesOutstanding/text()', doc, '{{xbrl,http://www.xbrl.org/2003/instance},{dei,http://xbrl.sec.gov/dei/2014-01-31}}'))[1]::text) as shares_outstanding
FROM xbrl_reports;
```
