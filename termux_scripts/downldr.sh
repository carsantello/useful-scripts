#!/bin/bash

echo ""
echo "----image downloader----"

F_PATH=/data/data/com.termux/files/home/storage/dcim/d_images

if [ -d "$F_PATH"  ]; then
    echo "location of the images: $F_PATH"
    echo "exists: yes"
    echo ""
    echo "good to go..."
else
    echo "location of the images:  $F_PATH"
    echo "exists: no"
    echo "creating path..."
    sleep 1s
    mkdir $F_PATH
    echo "good to go..."
fi

echo ""
read -p "c and p the url: " i_url
read -p "type a name for your image: " i_name

echo "downloading..."
echo ""
sleep 1s

cd $F_PATH
wget -O $i_name $i_url
`chmod +x $i_name`
`termux-media-scan -v -r $i_name`

echo "status: successfully downloaded"
echo ""



