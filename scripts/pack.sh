#!/bin/sh


echo "*********************************************"
echo " run with sudo from build folder this script not work"
echo "*********************************************"
exit

VERSION=$1
FOLDER=$2

cd $FOLDER/opencv/opencv-${VERSION}/build

sudo make install
sudo make package ..

ls *.deb