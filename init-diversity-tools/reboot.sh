#!/bin/sh

if [ -d /run/systemd/system ]; then
    # systemd
    /usr/bin/systemctl reboot $@
elif [ -p /run/initctl ]; then
    # sysvinit
    /usr/lib/sysvinit/reboot $@
else
    # nothing left - so try busybox
   sleep 3
   sudo /usr/bin/busybox reboot -f
fi
exit 0
