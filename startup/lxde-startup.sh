#!/bin/bash
# startup programs for lxde

sleep 1;
pcmanfm --desktop-off

sleep 1;
nohup conky -b &
