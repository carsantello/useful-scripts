#!/bin/bash


IMAGE_F=/data/data/com.termux/files/home/storage/dcim/d_images/frontal_pic.jpg
DESTINATION_F=/data/data/com.termux/files/home/storage/dcim/d_images


if [ -f "$IMAGE_F" ]; then
    rm $IMAGE_F
else
    `termux toast ...`
fi

cd $DESTINATION_F
`termux-camera-photo -c 1 $IMAGE_F`
chmod +x $IMAGE_F
`termux-media-scan -v -r frontal_pic.jpg > /dev/null 2>&1`
`termux-toast done`

