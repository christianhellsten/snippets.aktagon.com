---
id: '8'
title: Unit testing of DAO's
languages:
- java
tags:
---
This "snippet" explains how to unit test DAO's outside of a J2EE container. This is a bit bigger than a snippet, but worth so much. Some Spring magic could also be used, but I'm not polluting this example with xml in fear of it getting too tedious and complicated to understand.

DAO
---

Your DAO needs a protected constructor that takes a ConnectionFactory as parameter. You also need to modify your DAO's getConnection() method as shown below.


```java
public class UserDAO {
  // irrelevant elements of DAO left out for brevity
  protected UserDAO(ConnectionFactory connectionFactory) {
    this.connectionFactory = connectionFactory;
  }
  private Connection getConnection() {
    // modify getConnection() logic. test if we have been
    // given a ConnectionFactory or not. If we have then
    // return a connection from there.
    if ( this.connectionFactory != null ) {
      return this.connectionFactory.getConnection();
    }
    // else return the connection from JNDI
  }
}
```
    

ConnectionFactory interface
---------------------------

We need to define a ConnectionFactory interface.


```java
public interface ConnectionFactory {
  Connection getConnection();
}
```
    

ConnectionFactory implementation
--------------------------------

We need an implementation of our ConnectionFactory.


```java
public class JdbcConnectionFactory implements ConnectionFactory {
  // exception handling removed for brevity
  private String username, password, host, databaseName;
  public JdbcConnectionFactory(String username, String password, String host, String databaseName) {
    this.username = username;
    this.password = password;
    this.host = host;
    this.databaseName = databaseName;
  }
  public Connection getConnection() {
    // set up a jdbc connection and return it. mind the code, our concern 
    // is not about performance here.
    Class.forName("oracle.jdbc.driver.OracleDriver");
    String connectionUrl = "jdbc:oracle:thin:@"+host+":1544:"+databaseName;
    DriverManager.getConnection(connectionUrl, username, passwd);
  }
}
```
    

Base class for DAO testing
--------------------------

Then we set up the base class for our DAO unit tests.


```java
public class DaoTestBase extends TestCase {
  protected ConnectionFactory getConnectionFactory() {
    return new JdbcConnectionFactory("ora","ora123","hostnameOfMyDatabaseServer","myDb");
  }
}
```
    

DAO test class
--------------

Finally we write the test case itself.


```java
public class UserDAOTest extends DaoTestBase {
  private UserDAO userDao;
  public void setUp() {
    super.setUp();
    this.userDao = new UserDAO(getConnectionFactory());
  }
  public void testFindByUsernameShouldReturnExactlyOneUser() {
    String username = "marko";
    User user = userDao.create(username);
    userDao.save(user);
    assertEquals(1, userDao.findByUsername(username).size());
  }
}
```
    

Caveats
-------

**Never, ever use the protected constructor in production code!** Its sole purpose is to enable a simple jdbc connection that can be used in unit tests. The production code gets a bit polluted (one import and seven LOC), but it's a really small sacrifice for such a great cause.

