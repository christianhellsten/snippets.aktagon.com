---
id: '426'
title: How to manually sign/create a package for the Android Market (Titanium Developer)
languages:
- bash
tags:
---
Generate cert:


```bash
keytool -genkey -v -keystore android -alias android -keyalg RSA -validity 11000
```
    

Building the package in Titanium Developer doesn't work for me, so I have to do this:


```bash
jarsigner -storepass xxx -keystore /Users/christian/keystores/android -signedjar /tmp/app.apk /Users/christian/Projects/xxx-titanium/XXX/build/android/bin/app-unsigned.apk xxx
```
    

