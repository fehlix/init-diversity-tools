#!/bin/sh

if [ -d /run/systemd/system ]; then
    # systemd
    /usr/bin/systemctl poweroff $@
elif [ -p /run/initctl ]; then
    # sysvinit
    /usr/lib/sysvinit/poweroff $@
else
    # nothing left - so try busybox
   sleep 3
   /usr/bin/busybox poweroff -f
fi
exit 0
