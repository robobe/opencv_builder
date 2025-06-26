#!/bin/sh

VERSION=$1
FOLDER="$2/opencv"
REMOVE_ZIP_ENABLE="false"

if [ ! -d "$FOLDER" ]; then
    mkdir "$FOLDER"
fi
# mkdir $folder
cd ${FOLDER}

curl -L https://github.com/opencv/opencv/archive/${VERSION}.zip -o $FOLDER/opencv-${VERSION}.zip
curl -L https://github.com/opencv/opencv_contrib/archive/${VERSION}.zip -o $FOLDER/opencv_contrib-${VERSION}.zip
unzip $FOLDER/opencv-${VERSION}.zip
unzip $FOLDER/opencv_contrib-${VERSION}.zip
if [ "$REMOVE_ZIP_ENABLE" = "true" ]; then
    rm $FOLDER/opencv-${VERSION}.zip $FOLDER/opencv_contrib-${VERSION}.zip
fi
mkdir $FOLDER/opencv-${VERSION}/build