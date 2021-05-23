#!/usr/bin/env bash
# AUTHOR: Anshuman Dhuliya
# REF: https://github.com/xournalpp/xournalpp/blob/master/readme/LinuxBuild.md
# After build executables sit in: `build/src/` folder.

# Install dependencies -- Ubuntu
sudo apt-get install cmake libgtk-3-dev libpoppler-glib-dev portaudio19-dev libsndfile-dev \
libcppunit-dev dvipng texlive libxml2-dev liblua5.3-dev libzip-dev librsvg2-dev gettext lua-lgi

# Download source
git clone http://github.com/xournalpp/xournalpp.git

# Build from the source
cd xournalpp
mkdir build
cd build
cmake ..
cmake --build .
# For a faster build, set the flag -DCMAKE_BUILD_TYPE=RelWithDebInfo

