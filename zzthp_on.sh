#!/usr/bin/env bash

# Enable transparent huge pages

echo madvise > /sys/kernel/mm/transparent_hugepage/enabled;
echo "THP Status: $(cat /sys/kernel/mm/transparent_hugepage/enabled)";

