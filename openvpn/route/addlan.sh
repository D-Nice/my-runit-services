#!/bin/sh
# adds local LAN routes for access via currently
# default device/route

# only do this if local freenas is available!
# ping -c 1 192.168.1.42 || exit 0

DEF_ROUTE=$(ip route | grep "^default" | head -n1)
VIA=$(echo "$DEF_ROUTE" | grep -Po "via [\w\.]+")
DEV=$(echo "$DEF_ROUTE" | grep -Po "dev \w+")

# enable non VPN tunnelled LAN access
# for class C reserved addresses
ip route add 192.168.0.0/16 $VIA $DEV
#ip route add 192.168.100.0/24 $VIA $DEV
