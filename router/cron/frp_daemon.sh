#!/bin/sh

if [ -z "`pidof frpc`" ]; then
	/etc/init.d/frpc start
fi