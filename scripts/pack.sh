#!/bin/sh

VERSION=$1
FOLDER=$2

cd $FOLDER/opencv/opencv-${VERSION}/build

make package ..

ls *.deb