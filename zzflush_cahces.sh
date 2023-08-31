#!/usr/bin/env bash

# flush out system caches to free up ram.
# do this before running any process for benhmarking etc.
sync;
echo 3 > /proc/sys/vm/drop_caches;
echo 1 > /proc/sys/vm/compact_memory;
