---
id: '715'
title: How to Open Safari's Web Inspector With Applescript to Debug a Phonegap App
languages:
- applescript
tags:
---
This trick will save years of your life. This applescript will make Safari's Web Inspector connect to a Phonegap application running on my iPhone that was started through XCode:


```applescript
#!/usr/bin/osascript

set device_name to "Christian Hellsten iPhone"
tell application "Safari"
	activate
	tell application "System Events"
		try
			click menu item "index.html" of menu device_name of menu item device_name of menu "Utvecklare" of menu bar item "Utvecklare" of menu bar 1 of application process "Safari"
		end try
	end tell
end tell
```
    

Save the file, as e.g. open-web-inspector.applescript, then execute it:


```applescript
chmod +x open-web-inspector.applescript
./open-web-inspector.applescript
```
    

For English version, change "Utvecklare" to "Develop".

Troubleshooting
---------------

1.  [Error -1719](http://stackoverflow.com/questions/10140334/applescript-system-events-error-access-for-assistive-devices-is-disabled) most likely means you need to enable assistive access for iTerm or whatever app you're running the script from.

<!-- -->

1.  Error -10810 means "bad luck" in Applescript. Try restarting the computer.

If all else fails, run the script using the Applescript Editor. Also see, [this script](https://gist.github.com/dts/5771273).

Tested on OSX Yosemite.

