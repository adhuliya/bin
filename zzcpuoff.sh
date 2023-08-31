#!/usr/bin/env bash

# This script turns CPUs OFF on a linux machine.

if ! [[ $# -eq 2 ]]; then
  echo "usage: sudo <cmd> <from_cpu_id> <to_cpu_id>";
  exit 1;
fi

FROM=$1;
TO=$2;

for i in $(seq $FROM $TO); do
  echo $i;
  sudo echo 0 > /sys/devices/system/cpu/cpu$i/online;
done
