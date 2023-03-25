---
id: '422'
title: 'Fix for "Code Sign error: The identity ''iPhone Developer'' doesn''t match
  any valid certificate/private key pair in the default keychain"'
languages:
tags:
---
I got this error the other day:


```
Code Sign error: The identity 'iPhone Developer' doesn't match any valid certificate/private key pair in the default keychain
```
    

The fix for me was this:

-   Login to iPhone Developer Program
-   Click on Certificates
-   Under Current Development Certificates click on the button to download your certificate. It gets saved as developer\_identity.cer.
-   Open the Keychain tool
-   Make sure the "login" keychain is selected in the left pane.
-   Make sure that "login" is the default keychain (right-click on the login item to do this)
-   Drag the developer\_identity.cer file to the login keychain's list of certificates.
-   Build your app


