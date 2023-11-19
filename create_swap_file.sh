#!/usr/bin/env bash
#REF: https://www.digitalocean.com/community/tutorials/how-to-add-swap-space-on-ubuntu-22-04

SIZE_IN_GB=16;

if [[ -n $1 ]]; then
SIZE_IN_GB=$1;
fi

# STEP 1: Create the swap file.
sudo fallocate -l ${SIZE_IN_GB}G /swapfile;
ls -lh /swapfile; sleep 2; # verify

# STEP 2: Prepare the swapfile
sudo chmod 600 /swapfile;
sudo mkswap /swapfile;

# STEP 3: Enable the swapfile.
sudo swapon /swapfile;

# STEP 4: Verify that the swap is used.
sudo swapon --show;
free -h;

