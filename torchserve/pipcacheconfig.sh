#!/bin/sh

if [ "$PIP_CACHE" == "" ] ; then
	echo not using pip cache
	exit 0
fi

trusted_host=$(echo $PIP_CACHE|grep -Po '://\K[^/]+')
cat > /etc/pip.conf <<- EOC
[global]
index-url = $PIP_CACHE
trusted-host = $trusted_host
EOC

cat /etc/pip.conf
