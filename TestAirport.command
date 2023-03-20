#!/bin/bash

# symbolic link to the airport tool
sudo chmod 755 /Volumes/Macintosh\ HD/Users/apple/Desktop
cd /Volumes/Macintosh\ HD/Users/apple/Desktop
sudo mkdir airport
sudo ln -s /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport/ /Volumes/Macintosh\ HD/Users/apple/Desktop/airport

touch ShutOffTimeLog.txt 

# run every 3 seconds for 24hrs
for ((i=0; i<8640; i++)); do
    RESULT=`airport -I | cut -d ':' -f2 | xargs`
    airport -I
    sleep 3

    if [ "$RESULT" = 'Off' ]; then
        echo "Turned Off:" $(date) >> /Volumes/Macintosh\ HD/Users/apple/Desktop/ShutOffTimeLog.txt
        open ShutOffTimeLog.txt
    else
        echo $RESULT
        echo 'Off'
    fi
    
    done 

     