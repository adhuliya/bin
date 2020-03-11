#!/usr/bin/env bash

# install packages (the packages that I use)
# Comment out the packages not needed in the specific installation.

sudo apt-get update;

# build tools
sudo apt-get install -y gcc;
sudo apt-get install -y g++;
sudo apt-get install -y ninja-build;
sudo apt-get install -y cmake;
sudo apt-get install -y make;
sudo apt-get install -y autoconf;
sudo apt-get install -y automake;
sudo apt-get install -y libtool;

# useful utilities
sudo apt-get install -y unzip;
sudo apt-get install -y conky;
sudo apt-get install -y htop;
sudo apt-get install -y redshift;
sudo apt-get install -y xsel;
sudo apt-get install -y cloc; # count lines of code
sudo apt-get install -y vim-gtk3;
sudo apt-get install -y git;
sudo apt-get install -y tree;
sudo apt-get install -y zsh;
sudo apt-get install -y apt-file;
sudo apt-get install -y recoll;

# network related
sudo apt-get install -y curl;
sudo apt-get install -y net-tools;
sudo apt-get install -y openssh-server;
sudo apt-get install -y nginx;
sudo apt-get install -y apache2-utils;

# latex/documentation related
sudo apt-get install -y texlive-full;
sudo apt-get install -y texmaker;  # latex ide (good for symbol lookup)
sudo apt-get install -y xdot;
sudo apt-get install -y libreoffice;

# python related
sudo apt-get install -y cython;
sudo apt-get install -y ipython;
sudo apt-get install -y ipython3;
sudo apt-get install -y pypy3;
sudo apt-get install -y python3-pip;

# media related
sudo apt-get install -y recordmydesktop;
sudo apt-get install -y gtk-recordmydesktop;
sudo apt-get install -y vlc;
sudo apt-get install -y openshot;
sudo apt-get install -y vokoscreen;
sudo apt-get install -y espeak;

# haskell compiler
sudo apt-get install -y ghc;

# database
sudo apt-get install -y postgresql-11;
sudo apt-get install -y pgadmin4;

# ncurses dev libraries needed by buildroot `make menuconfig`
sudo apt-get install -y libncurses5;
sudo apt-get install -y libncruses5-dev;

# some fixup of the package dependencies
sudo apt-get install -y -f;

