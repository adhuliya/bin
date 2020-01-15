#!/usr/bin/env bash

# This script helps setup a new system from scratch for me.
# NOTE: This script should never delete old data.

# IMPORTANT:
#   1. update git ssh key on github,bitbucket,git.cse.iitb.ac.in,...
#   2. set: MYDIRNAME, ITSOFLIFE, MYDATA in /etc/environment

CURRDIR=`pwd`
_MYDIRNAME=$MYDIRNAME
_ITSOFLIFE=$ITSOFLIFE
_MYDATA=$MYDATA
MYHOME="`dirname $_ITSOFLIFE`";

echo "MYHOME is: $MYHOME";

# some redundancies are deliberate

mkdir -p $_ITSOFLIFE
mkdir -p $_MYDATA

# setup .itsoflife
cd $MYHOME;
if [[ ! -e $_MYDIRNAME ]]; then
  ln -s $_ITSOFLIFE $_MYDIRNAME;
fi
cd $_ITSOFLIFE;
if [[ ! -e knotes-git ]]; then
  git clone git@github.com:adhuliya/knotes \
      && mv knotes knotes-git;
fi
# for most public file sharing etc.
if [[ ! -e public ]]; then
  mkdir public;
fi

# setup mydata
cd $CURRDIR;
mkdir -p $_MYDATA/git
mkdir -p $_MYDATA/local
mkdir -p $_MYDATA/remote

# setup git directory tree
mkdir -p $_MYDATA/git/ws
mkdir -p $_MYDATA/git/research

cd $_MYDATA/git;
if [[ ! -e $_MYDATA/git/bin-git ]]; then
  git clone git@github.com:adhuliya/bin.git \
      && mv bin bin-git;
fi

if [[ ! -e $_MYDATA/git/configs-git ]]; then
  git clone git@github.com:adhuliya/configs.git \
      && mv configs configs-git;
fi
cd $CURRDIR;

# setup local directory tree
cd $CURRDIR;
mkdir -p $_MYDATA/local/logs; # all my log files go here
mkdir -p $_MYDATA/local/ssd;  # one partition on the ssd for special use
mkdir -p $_MYDATA/local/extra-partition;  # extra-partition on hdd
mkdir -p $_MYDATA/local/packages;       # software installation files
mkdir -p $_MYDATA/local/packages-live;  # for all my softwares in use
mkdir -p $_MYDATA/local/downloads;  # for all downloads
mkdir -p $_MYDATA/local/tmp;     # a tmp directory (just like /tmp)
mkdir -p $_MYDATA/local/files;   # for important local files (e.g. mlocate.db)

# to ease things up create a symlink to local/downloads
if [[ ! -L ~/Downloads ]]; then
  if [[ -e ~/Downloads ]]; then
    mv ~/Downloads ~/Downloads-old;
  fi
  ln -s $_MYDATA/local/downloads ~/Downloads
fi

