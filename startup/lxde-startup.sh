#!/usr/bin/env bash

# startup script for lxde
# see mylxde-startup.desktop

MYDATA=/home/codeman/.itsoflife/mydata

echo "$(date) lxde-startup.sh" >> $MYDATA/local/logs/mysystem.log

# add the tasks to execute below (no gui programs)
# For gui programs use a separate .desktop file

# sleep 1;
# pcmanfm --desktop-off
# 
# sleep 1;
# nohup conky -b &
