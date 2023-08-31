#!/usr/bin/env bash

# This script sets scaling governor modes.

if ! [[ $# -eq 3 ]]; then
  echo "usage: sudo <cmd> <from_cpu_id> <to_cpu_id> <performance|powersave|ondemand>";
  exit 1;
fi

FROM=$1;
TO=$2;
MODE=$3

for i in $(seq $FROM $TO); do
  echo "Setting CPU $i scaling governer to $MODE";
  FILE="/sys/devices/system/cpu/cpu$i/cpufreq/scaling_governer;
  echo $MODE > $FILE;
done
