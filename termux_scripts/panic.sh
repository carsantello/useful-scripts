#!/bin/bash

S_LOCATION=/data/data/com.termux/files/home/IPGeoLocation
F_LOCATION=/data/data/com.termux/files/home/bash_c/fls
SOS_F=/data/data/com.termux/files/home/bash_c/fls/SOS.txt
AUDIO_F=SOS_F=/data/data/com.termux/files/home/bash_c/fls/SOS_audio.mp3
IMAGE_F=/data/data/com.termux/files/home/bash_c/fls/frontal_pic.jpg

if [ -f "SOS_audio.mp3" ]; then
    rm SOS_audio.mp3
    `termux-toast audio file removed...`
else
    `termux-toast good to go...`
fi

if [ -f "$IMAGE_F" ]; then
    rm $IMAGE_F
    `termux_toast image removed...`
else
    `termux_toast image does not exist...`
fi

#txt file for location
cd $S_LOCATION
`python ipgeolocation.py -m > my_l.txt`
`cp my_l.txt $F_LOCATION`

cd $F_LOCATION
`termux-battery-status > my_battery_status.txt`
`termux-contact-list > my_contacts_list.txt`
`mv my_l.txt my_location.txt`


`head -n 8 my_battery_status.txt > $SOS_F`
`cat my_location.txt >> $SOS_F`
`cat my_contacts_list.txt >> $SOS_F`


`sed -i "1i if you are reading this is because I need help now!" $SOS_F`
`sed -i "2i -----&&&-----" $SOS_F`
`sed -i "3i Battery status:" $SOS_F`
`sed -i "11i -----&&&-----" $SOS_F`
`sed -i "12i Location:" $SOS_F`
`sed -i "38i -----&&&-----" $SOS_F`
`sed -i "39i My contacts list: (please try ti contact them to see if they know something about where am I)" $SOS_F`

`termux-toast R...`

`termux-microphone-record -l 10 -f SOS_audio.mp3 > /dev/null 2>&1`
sleep 10s

`termux-toast sos audio and txt ready`
`termux-share -a send $SOS_F`
sleep 2s
`termux-toast afterwards come back to termux`
sleep 13s

`termux-share -a send SOS_audio.mp3`
sleep 5s
`termux-toast -c white information saved`
`termux-vibrate -d 100 -f`


