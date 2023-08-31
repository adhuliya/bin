#!/usr/bin/env bash

# Disable transparent huge pages

echo never > /sys/kernel/mm/transparent_hugepage/enabled;
echo "THP Status: $(cat /sys/kernel/mm/transparent_hugepage/enabled)";

