#!/bin/bash

VERSION=$1
FOLDER=$2

for file in ${FOLDER}/debs/*.deb; do
    
  filename=$(basename "$file")
  echo "$FOLDER/opencv/opencv-${VERSION}/build/$filename"
  if [ -e "$FOLDER/opencv/opencv-${VERSION}/build/$filename" ]; then
    echo "Removing: $file"
    rm "$file"
  fi
done


# rm -rf $FOLDER/opencv/opencv-${VERSION}/build