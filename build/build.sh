#!/bin/bash
set -e
cd libsoundio
rm -rf build/
mkdir build/
cd build
cmake ..
make
sudo make install