#!/usr/bin/env bash

# This script sets the min frequency of the given CPUs.

if ! [[ $# -eq 3 ]]; then
  echo "usage: sudo <cmd> <from_cpu_id> <to_cpu_id> <freq_KHz>";
  exit 1;
fi

FROM=$1;
TO=$2;
FREQ=$3

for i in $(seq $FROM $TO); do
  echo "Setting CPU $i min freq to $FREQ";
  FILE="/sys/devices/system/cpu/cpu$i/cpufreq/scaling_min_freq;
  echo $FREQ > $FILE;
done
