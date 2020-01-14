#!/usr/bin/env bash

# startup programs for lxde
# add symlink to this file in the ~/.config/autostart folder:
# ln -s $MYDATA/git/bin-git/startup/lxde-startup.sh lxde-startup.sh

MYDATA=/home/codeman/.itsoflife/mydata

echo "$(date) lxde-startup.sh" >> $MYDATA/local/logs/mysystem.log

#add the tasks to execute below

nohup pcmanfm &> /dev/null &;

# sleep 1;
# pcmanfm --desktop-off
# 
# sleep 1;
# nohup conky -b &
