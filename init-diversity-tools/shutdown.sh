#!/bin/bash

if [ -d /run/systemd/system ]; then
    # systemd
    /usr/lib/systemd/shutdown $@ &
    exit 0
elif [ -p /run/initctl ]; then
    # sysvinit
    if [ "$UID" -ne 0 ]; then
        # show "must run as root" error prompt for normal user
        /usr/lib/sysvinit/shutdown $@
    else
        # silence systemd error message when running dual-init
        if [ -d /run/systemd ] && [ ! -d /run/systemd/system ]; then
            mkdir /run/systemd/system
        fi
        /usr/lib/sysvinit/shutdown $@ &
        if [ -d /run/systemd/system ]; then
            rmdir /run/systemd/system
        fi
    fi
else
    # nothing left - so try busybox
   sleep 3
   sudo /usr/bin/busybox reboot -f
fi
exit 0
