#!/usr/bin/env bash

# This script sets the max frequency of the given CPUs.

if ! [[ $# -eq 3 ]]; then
  echo "usage: sudo <cmd> <from_cpu_id> <to_cpu_id> <freq_KHz>";
  exit 1;
fi

FROM=$1;
TO=$2;
FREQ=$3

for i in $(seq $FROM $TO); do
  echo "Setting CPU $i max freq to $FREQ";
  FILE="/sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq;
  echo $FREQ > $FILE;
done
