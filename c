#!/usr/bin/env bash
# Puts a single line text given as command line argument in to $CLIPBOARD_FILE

CLIPBOARD_FILE=$ITSOFLIFE/knotes-git/clipboard.txt

if [[ -z "$@" ]]; then                    # argument: None: open file
  vi + $CLIPBOARD_FILE;
elif [[ "$@" == "n" ]]; then              # argument: 'n': add new line
  echo ""     >> $CLIPBOARD_FILE;
else
  echo "$@"   >> $CLIPBOARD_FILE;         # argument: others: append to file
fi
