#!/bin/sh

if [ -z "`pidof clash`" ]; then
	/etc/init.d/clash start
fi