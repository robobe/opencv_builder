#!/bin/sh

VERSION=$1
FOLDER="opencv"

if [ ! -d "$FOLDER" ]; then
    mkdir "$FOLDER"
fi
# mkdir $folder
cd ${folder}
curl -L https://github.com/opencv/opencv/archive/${VERSION}.zip -o opencv-${version}.zip
curl -L https://github.com/opencv/opencv_contrib/archive/${VERSION}.zip -o opencv_contrib-${version}.zip
unzip opencv-${VERSION}.zip
unzip opencv_contrib-${VERSION}.zip
# rm opencv-${version}.zip opencv_contrib-${version}.zip
mkdir opencv-${VERSION}/build