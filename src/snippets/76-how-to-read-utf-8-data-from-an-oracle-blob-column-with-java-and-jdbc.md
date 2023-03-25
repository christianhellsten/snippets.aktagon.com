---
id: '76'
title: How to read UTF-8 data from an Oracle BLOB column with Java and JDBC
languages:
- java
tags:
---
This example works with Oracle:


```java
private String getBlobAsString(Blob blob)
{
    StringBuffer result = new StringBuffer();
    
    if ( blob != null ) 
    {
        int read = 0;
        Reader reader = null;
        char[] buffer = new char[1024];
                                
        try
        {
            reader = new InputStreamReader(blob.getBinaryStream(), "UTF-8");

            while((read = reader.read(buffer)) != -1) 
            {
                result.append(buffer, 0, read);
            }
        }
        catch(SQLException ex)
        {
            throw new RuntimeException("Unable to read blob data.", ex);
        }
        catch(IOException ex)
        {
            throw new RuntimeException("Unable to read blob data.", ex);
        }
        finally
        {
            try { if(reader != null) reader.close(); } catch(Exception ex) {};
        }
    }
    
    return result.toString();
}
```
    

Then use the method like this:


```java
ResultSet resultSet = your JDBC result set;

String utf8 = getBlobAsString(resultSet.getBlob("xml"));
```
    

