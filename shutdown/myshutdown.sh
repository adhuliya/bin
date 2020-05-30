#!/usr/bin/env bash

# shutdown script (it has to be manually invoked)
# add symlink to this file in ~/.local/bin which should be in your path
# ln -s $MYDATA/git/bin-git/shutdown/myshutdown.sh myshutdown.sh

MYDATA=/home/codeman/.itsoflife/mydata

echo "$(date) myshutdown.sh start" >> $MYDATA/local/logs/mysystem.log

#BOUND START : addCommandsToRun

gitsyncall;

datasync;

#BOUND END   : addCommandsToRun

############### shutdown with a delay
DELAY=10
echo -en "\nShutting down in $DELAY seconds";
sleep $DELAY;
systemctl poweroff -i;

############### take final permission to shutdown
#echo -en "\nShall I shutdown? (y/n) ";
#read response;
#if [[ $response == "y" || $response == "Y" ]]; then
#  ############## power off !!!!!!!!!
#  echo "$(date) myshutdown.sh end BYE!!" >> $MYDATA/local/logs/mysystem.log
#  poweroff
#fi




