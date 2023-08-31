#!/usr/bin/env bash

# Displays the CPU freq setting for the given CPU ID (default 0).

if [[ $# -gt 1 ]]; then
  echo "usage: sudo <cmd> <cpu_id>";
  exit 1;
fi

if [[ -z $1 ]]; then CPUID=0; else CPUID=$1; fi

echo "Available governers: $(cat /sys/devices/system/cpu/cpu$CPUID/cpufreq/scaling_available_governors)";
echo "HT_STATUS: $(cat /sys/devices/system/cpu/smt/control 2> /dev/null)";
echo;
echo "CPU$CPUID: MIN: $(cat /sys/devices/system/cpu/cpu$CPUID/cpufreq/scaling_min_freq) KHz";
echo "CPU$CPUID: MAX: $(cat /sys/devices/system/cpu/cpu$CPUID/cpufreq/scaling_max_freq) KHz";
echo "CPU$CPUID: GOVERNOR: $(cat /sys/devices/system/cpu/cpu$CPUID/cpufreq/scaling_governor)"

