#!/bin/bash
set -e
echo "Building tag " $0 
rm -rf libsoundio
echo "Cloning repo"
git clone -b $1 --single-branch --depth 1 https://github.com/andrewrk/libsoundio.git

echo "Building windows"
echo "Building 32-bit (x86)"
./dockcross-windows-shared-x86 bash -c 'sh ./build.sh'
mkdir -p ./win/x86/
cp libsoundio/build/libsoundio.dll win/x86/libsoundio.dll
cp libsoundio/build/libsoundio.dll.a win/x86/libsoundio.lib
rm -r libsoundio/build 

echo "Building 64-bit (x64)"
./dockcross-windows-shared-x64 bash -c 'sh ./build.sh'
mkdir -p ./win/x64/
cp libsoundio/build/libsoundio.dll win/x64/libsoundio.dll
cp libsoundio/build/libsoundio.dll.a win/x64/libsoundio.lib

echo "Moving builds to root..."
rm -rf ../win
mv win ../
echo "Cleaning up"
rm -rf libsoundio/
