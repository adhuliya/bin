#!/usr/bin/env bash

# INVARIANT CHECK: check if the the script is run from its directory location only
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )";
if [[ $DIR != "`pwd`" ]]; then
  echo "NOTE: Must run this script from its directory as './...'";
  exit;  # if not then exit
fi
