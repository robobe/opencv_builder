#!/bin/sh

VERSION=$1
FOLDER=$2

cd $FOLDER/opencv/opencv-${VERSION}/build

suod make install
sudo make package ..

ls *.deb