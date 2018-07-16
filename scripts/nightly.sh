#!/usr/bin/env bash

# nightly.sh - pull a copy of athena-master 
# and put it inside a timestamped folder.
# rock made this

sourcefolder=~/Source/turtle-dev-build-$(date +%F)

mkdir ~/Source
mkdir ~/Binaries
echo -e "\n MOVING TO ~/Source"
cd ~/Source/
ls -al

echo -e "\n CLONING Athena in $sourcefolder"
git clone https://github.com/athena-network/athena $sourcefolder
cd $sourcefolder
mkdir -p $sourcefolder/build && cd $sourcefolder/build
ls -al

echo -e "\n BUILDING Athena"
cmake .. && make -j8 # remove -j8 for single core
cd src
ls -al

echo -e "\n\n COMPRESSING BINARIES"
zip athena-dev-bin-$(date +%F)-linux.zip solominer legacy-services simplewallet Athena services
mv *.zip ~/Binaries/
cd ~/Binaries
ls -al

echo -e "\n COMPLETE!"
