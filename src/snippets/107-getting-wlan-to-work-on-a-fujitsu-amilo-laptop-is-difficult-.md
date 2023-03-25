---
id: '107'
title: Getting WLAN to work on a Fujitsu Amilo laptop is difficult...
languages:
tags:
---
I fought and won over WLAN drivers and Linux, but later switched to using a Mac, because driver support for WLAN, printers and other hardware is non-existent Linux:


```
apt-get install wpasupplicant

http://ubuntuforums.org/showthread.php?t=313914

vim /etc/wpa_supplicant.conf

ctrl_interface=/var/run/wpa_supplicant
ctrl_interface_group=0
eapol_version=1
ap_scan=2
fast_reauth=1


network={
    ssid="...yer-ssid..."
    scan_ssid=1
    proto=WPA
    key_mgmt=WPA-PSK
    psk="...yer-pass..."
    priority=5
    pairwise=TKIP
}

vim /etc/network/interfaces

auto lo
iface lo inet loopback

auto eth1
iface eth1 inet dhcp
   wpa-driver wext
   wpa-conf /etc/wpa_supplicant.conf

auto wlan0
iface wlan0 inet dhcp

iface eth0 inet dhcp

auto eth0

vim /etc/init.d/wpasupplicant

#!/bin/sh

PATH=/usr/sbin:/usr/bin:/sbin:/bin

case "$1" in
        start|restart|force-reload)
                wpa_supplicant -Dwext -iwlan0 -c/etc/wpa_supplicant.conf -dd -B
                ;;
        stop)
                killall -9 wpa_supplicant
                ;;
        *)
                echo "Usage: $0 {start|stop|restart|force-reload}" >&2
                exit 3
                ;;
esac

exit 0

----------------

chmod +x ...
cd /etc/rcS.d
ln -s ../init.d/wpasupplicant S40iwpa


-------------

auto lo
iface lo inet loopback

auto eth1
iface eth1 inet dhcp

auto wlan0
iface wlan0 inet dhcp
```
    

