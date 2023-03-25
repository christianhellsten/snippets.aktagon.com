---
id: '75'
title: How to write UTF-8 data to an Oracle BLOB column with Java and JDBC
languages:
- java
tags:
---
This example works with Oracle:


```java
private Blob getBlob(Connection connection, String data)
{
  BLOB blob = BLOB.createTemporary(connection, true, BLOB.DURATION_SESSION);

  try
  {
      blob.open(BLOB.MODE_READWRITE);
      blob.putBytes(1, data.getBytes("UTF-8")); // Consider streaming, if data size is unknown. Note that setBytes doesn't work
  }
  catch(UnsupportedEncodingException ex)
  {
      throw new RuntimeException("Unable to get a blob for '" + data + "'", ex);
  }
  catch(SQLException ex)
  {
      throw new RuntimeException("Unable to get a blob for '" + data + "'", ex);
  }
  finally
  {
      try { if(blob != null) blob.close(); } catch(Exception ex) {};
  }
}
```
    

Then use the method like this:


```java
Connection connection = getConnection();
PreparedStatement statement = getPreparedStatement(yer sequel);

statement.setBlob(1, getBlob(connection,  <Mao's Little Red Book>));
```
    

