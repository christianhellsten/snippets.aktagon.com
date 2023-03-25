---
id: '169'
title: Notes on how to develop a Firefox extension
languages:
tags:
---
Create a new profile for extension development
----------------------------------------------

http://lifehacker.com/software/firefox/geek-to-live%E2%80%94manage-multiple-firefox-profiles-231646.php

Tweak Firefox configuration for extension development
-----------------------------------------------------

http://developer.mozilla.org/en/docs/Setting\_up\_extension\_development\_environment

Create a skeleton extension
---------------------------

http://ted.mielczarek.org/code/mozilla/extensionwiz/

Extract it to the your project folder, for example:


```
/home/name/projects/my_extension
```
    

Setup Firefox to load your extension
------------------------------------

Follow these instructions to configure Firefox to load your extension from /home/name/projects/my\_extension:
http://developer.mozilla.org/en/docs/Setting\_up\_extension\_development\_environment\#Custom\_code\_location
http://developer.mozilla.org/en/docs/Setting\_up\_extension\_development\_environment\#Using\_directories\_rather\_than\_JARs

Install the Extension developer
-------------------------------

http://ted.mielczarek.org/code/mozilla/extensiondev/

Start Firefox with the development profile
------------------------------------------


```
firefox-bin -P development -no-remote
```
    

To start the default profile use:


```
firefox-bin -P THE_PROFILE_NAME -no-remote
```
    

Build your extension
--------------------

http://www.xulplanet.com/

The extension wizard includes a build script, but it might be a good idea to upgrade it to the latest version, which can be found here (including a Windows build script):
http://kb.mozillazine.org/Bash\_build\_script

Gotchas
-------

If you're on windows and using CygWin, you might get this error:


```
./build.sh: line 6: $'\r': command not found
./build.sh: line 29: $'\r': command not found
./build.sh: line 40: $'\r': command not found
./build.sh: line 70: syntax error near unexpected token $'do\r''
'/build.sh: line 70: for CHROME_SUBDIR in $CHROME_PROVIDERS; do
```
    

The solution is to run the dos2unix command on the \*.sh files:


```
d2u build.sh
d2u config_build.sh
```
    

