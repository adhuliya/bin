#!/usr/bin/env bash

TMP_FILE=`mktemp /dev/shm/tmp.XXXXXXXX`;
FILE_NAME=$ITSOFLIFE/knotes-git/clipboard.txt

vim $TMP_FILE;

cat $TMP_FILE >> $FILE_NAME;
