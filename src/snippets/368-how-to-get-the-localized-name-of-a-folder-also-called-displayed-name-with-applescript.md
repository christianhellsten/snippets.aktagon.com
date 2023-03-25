---
id: '368'
title: How to get the localized name of a folder also called displayed name with AppleScript
languages:
- applescript
tags:
---
Not using the localized name of folders or items is a basic mistake made in almost all AppleScript examples I've seen.

For example, this code won't work on a Swedish OSX where the Applications folder's name is Program:


```applescript
tell application "Finder"
	-- Mount a DMG
	.
	.
	.
	set position of item "Applications" to {175, 65}
end tell
```
    

The correct way of referencing folders is by using the localized name which you can get through the displayed name attribute like this:


```applescript
tell application "Finder"
	-- Mount a DMG
	.
	.
	.
	set applications_folder to displayed name of (path to applications folder) -- i18n name
	set position of item applications_folder to to {175, 65}
end tell
```
    

This is the line which retrieves the localized name of the folder and stores it in a variable named applications\_folder:


```applescript
set applications_folder to displayed name of (path to applications folder) -- i18n name
```
    

