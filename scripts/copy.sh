#!/bin/sh

VERSION=$1
FOLDER="$2/opencv"
REMOVE_ZIP_ENABLE="false"
DEBS="$2/debs"

if [ ! -d "$DEBS" ]; then
    mkdir "$DEBS"
fi

cp $FOLDER/opencv-$VERSION/build/*.deb $DEBS