---
id: '111'
title: PHP XML-RPC example using Pear's XML_RPC package
languages:
- php
tags:
---
First you need to install XML\_RPC and VAR\_DUMP:

Installing XML\_RPC
-------------------


```php
pear install XML_RPC
pear install VAR_DUMP
```
    

Example XML-RPC client
----------------------

Note this code hasn't been tested, so may contain errors.

Anyway, VAR\_DUMP is great for debugging...


```php
<?php
  require_once("XML/RPC.php");
  require_once('Var_Dump.php');

  Var_Dump::displayInit(array('display_mode' => 'HTML4_Text'), array('mode' => 'normal','offset' => 4));
  
  $host = "xxx.com";
  $uri = "/xxx/xmlrpc";

  $function   = "eat";
  $parameters = array(
    new XML_RPC_Value("a"),
    new XML_RPC_Value(0),
    new XML_RPC_Value(10),
    new XML_RPC_Value("b")
  );
  
  $message = new XML_RPC_Message($function, $parameters);
    
  $client = new XML_RPC_Client($uri, $host, 80);
  $client->setDebug(1);
  $client->proxy = "127.0.0.1";

  $result = $client->send($message);

  if (!$result) {
    echo 'Communication error: '.$client->errstr;
	Var_Dump::display($client);
    exit;
  }

  if($result->faultCode())
  {
     echo "** ERROR **n";
     echo 'Fault Code: ' . $result->faultCode() . "n";
     echo 'Fault Reason: ' . $result->faultString() . "n";
     exit;
  }

  echo "<pre>".htmlentities($message->serialize()). "</pre>";

  Var_Dump::display($result);

  $val = $result->value();
  $ticket = $val->scalarval();
  
  echo $ticket;
?>
```
    

Data types
----------

**struct**


```php
$user_params =  array(
	'username' 	  	 => new XML_RPC_Value(".."),
	'email' 	 	 => new XML_RPC_Value("..."),
	'time'  => new XML_RPC_Value(gmdate("Ymd\TH:i:s"), 'dateTime.iso8601')
	);

$rpc_param = new XML_RPC_Value($user_params, 'struct')
```
    

**dateTime.iso8601**


```php
'time'  => new XML_RPC_Value(gmdate("Ymd\TH:i:s"), 'dateTime.iso8601')
```
    

