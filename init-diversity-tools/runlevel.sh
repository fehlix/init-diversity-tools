#!/bin/sh

if [ -d /run/systemd/system ]; then
    /usr/lib/systemd/runlevel $@
elif [ -p /run/initctl ]; then
    /usr/lib/sysvinit/runlevel $@
fi

exit 0
