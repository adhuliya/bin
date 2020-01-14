#!/usr/bin/env bash

# This script helps setup a new system from scratch for me.
# NOTE: This script should never delete old data.

# IMPORTANT:
#   1. save the system git ssh key on required servers

CURRDIR=`pwd`
NAME=itsoflife
MYHOME=/home/codeman
ITSOFLIFE=/home/codeman/.$NAME
MYDATA=$ITSOFLIFE/mydata

# some redundancies are deliberate

mkdir -p $ITSOFLIFE
mkdir -p $MYDATA

# setup .itsoflife
cd $MYHOME;
if [[ ! -e $NAME ]]; then
  ln -s $ITSOFLIFE $NAME;
fi
cd $ITSOFLIFE;
if [[ ! -e knotes-git ]]; then
  git clone git@github.com:adhuliya/knotes \
      && mv knotes knotes-git;
fi
if [[ ! -e public ]]; then
  mkdir public;
fi

# setup mydata
cd $CURRDIR;
mkdir -p $MYDATA/git
mkdir -p $MYDATA/local
mkdir -p $MYDATA/remote

# setup git directory tree
mkdir -p $MYDATA/git/ws
mkdir -p $MYDATA/git/research

cd $MYDATA/git;
if [[ ! -e $MYDATA/git/bin-git ]]; then
  git clone git@github.com:adhuliya/bin.git \
      && mv bin bin-git;
fi

if [[ ! -e $MYDATA/git/configs-git ]]; then
  git clone git@github.com:adhuliya/configs.git \
      && mv configs configs-git;
fi
cd $CURRDIR;

# setup local directory tree
cd $CURRDIR;
mkdir -p $MYDATA/local/logs;
mkdir -p $MYDATA/local/ssd;
mkdir -p $MYDATA/local/extra-partition;
mkdir -p $MYDATA/local/packages;
mkdir -p $MYDATA/local/packages-live;
mkdir -p $MYDATA/local/downloads;
mkdir -p $MYDATA/local/tmp;
if [[ ! -L ~/Downloads ]]; then
  if [[ -e ~/Downloads ]]; then
    mv ~/Downloads ~/Downloads-old;
  fi
  ln -s $MYDATA/local/downloads ~/Downloads
fi

