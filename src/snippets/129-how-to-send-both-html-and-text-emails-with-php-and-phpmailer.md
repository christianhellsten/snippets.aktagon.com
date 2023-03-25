---
id: '129'
title: How to send both HTML and text emails with PHP and PHPMailer
languages:
- php
tags:
---
This is an example on how to use [PHPMailer](http://phpmailer.sourceforge.net/) to send an HTML email. It also shows how to include a text only version of the same email for clients, such as mutt, that don't support HTML emails.


```php
$mail = new PHPMailer();

$mail->IsHTML(true);
$mail->CharSet = "text/html; charset=UTF-8;";
$mail->IsSMTP();

$mail->WordWrap = 80;
$mail->Host = "smtp.thehost.com"; 
$mail->SMTPAuth = false;

$mail->From = $from;
$mail->FromName = $from; // First name, last name
$mail->AddAddress($to, "First name last name");
#$mail->AddReplyTo("reply@thehost.com", "Reply to address");

$mail->Subject =  $subject;
$mail->Body =  $htmlMessage; 
$mail->AltBody  =  $textMessage;    # This automatically sets the email to multipart/alternative. This body can be read by mail clients that do not have HTML email capability such as mutt.

if(!$mail->Send())
{
  throw new Exception("Mailer Error: " . $mail->ErrorInfo);
}
```
    

