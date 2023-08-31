#!/usr/bin/env bash

# Disables hyperthreading.
# To disable hyper-threading on specific cores, disable those specific cores.

echo off > /sys/devices/system/cpu/smt/control;
