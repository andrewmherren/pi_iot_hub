#!/bin/bash
sysctl net.ipv4.ip_forward
sysctl net.ipv4.ip_forward=1
awk '{if($0 ~ /net.ipv4.ipforward=1/){print "net.ipv4.ipforward=1"}else{print $0}' < /etc/systl.conf
echo "denyinterfaces wlan0" >> /etc/dhcpd.conf
