---
id: '112'
title: How to upload a file with PHP and lib_curl
languages:
- php
tags:
---
This is an example of how to upload a file from PHP to another server that may or may not be running PHP.

Note that using Pear's [HTTP\_Request](http://pear.php.net/package/HTTP_Request/) package is probably easier.


```php
<?php
  require_once('Var_Dump.php');
  Var_Dump::displayInit(array('display_mode' => 'HTML4_Text'), array('mode' => 'normal','offset' => 4));

  $url = 'www.aktagon.com/upload';
  $file = '/tmp/file_to_upload';
  $post_data = array();

  $post_data['username'] = '';
  $post_data['password'] = '';
  $post_data['file'] = "@$file";

  $ch = curl_init();

  curl_setopt($ch, CURLOPT_URL, $url);
  curl_setopt($ch, CURLOPT_HTTPHEADER, array(
#    'Cookie: xxxx',
#    'Content-Type: xxxx'
  ));
  curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
  curl_setopt($ch, CURLOPT_POST, true);
  #curl_setopt($ch, CURLOPT_PROXY, '127.0.0.1:8888');

  curl_setopt($ch, CURLOPT_POSTFIELDS, $post_data);

  $response  = curl_exec($ch);
  $info      = curl_getinfo($ch); 
  $http_code = $info['http_code'];
  $speed     = round($info['speed_upload'] / 1024);
  $size      = round($info['size_upload'] / 1024);

  if($http_code != 200)
  {
    echo "Upload failed with HTTP code $http_code. Uploaded $size kilobytes with $speed kilobytes/s.<br/>";
    echo "<h1>Response</h1><pre>$response</pre><h1>Debug information</h1>";

    Var_Dump::display($info);
  }
  else
  {
    echo "Uploaded successful. Uploaded $size kilobytes with $speed kilobytes / s.<br/>";
    echo "<h1>Response</h1><pre>$response</pre>";
  }
  curl_close($ch);
?>
```
    

You can remove the Var\_Dump code (Pear module), if you haven't installed it, or don't need it.

