#!/usr/bin/env bash

# shutdown script for lxde
# add symlink to this file in ~/.local/bin which should be in your path
# ln -s $MYDATA/git/bin-git/shutdown/myshutdown.sh myshutdown.sh

MYDATA=/home/codeman/.itsoflife/mydata

echo "$(date) myshutdown.sh start" >> $MYDATA/local/logs/mysystem.log

#BOUND START : addCommandsToRun

gitsyncall;

#BOUND END   : addCommandsToRun

############## power off !!!!!!!!!
echo "$(date) myshutdown.sh end BYE!!" >> $MYDATA/local/logs/mysystem.log
poweroff


