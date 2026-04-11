#!/bin/sh

if [ ! -d /run/systemd/system -a -p /run/initctl -a -x /usr/lib/init/rc ]; then
    exec /usr/lib/init/rc "$@"
fi
exit 0
