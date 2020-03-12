#!/usr/bin/env bash

# Script to setup a new lubuntu system from scratch for user codeman.
# The script is idempotent. i.e. its harmeless to run it multiple times.

MSG_PREFIX=mysyssetup


# STEP 1: Setup environemnt variables and reboot.

COUNT=`grep ITSOFLIFE /etc/environment | wc -l`;

if [[ $COUNT -eq 0 ]]; then
  echo "MYDIRNAME=itsoflife" | sudo tee -a /etc/environment
  echo "ITSOFLIFE=/home/codeman/.itsoflife" | sudo tee -a /etc/environment
  echo "MYDATA=/home/codeman/.itsoflife/mydata" | sudo tee -a /etc/environment
  echo "MYMLOCATEDB=/home/codeman/.itsoflife/mydata/local/files/mlocate.db" | sudo tee -a /etc/environment
else
  echo "$MSG_PREFIX: Env variable already added to /etc/environment";
  cat /etc/environment;
fi


