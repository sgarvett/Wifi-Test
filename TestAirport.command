#!/bin/bash

# symbolic link to the airport tool
sudo chmod 755 /Volumes/Macintosh\ HD/Users/test/Desktop
cd /Volumes/Macintosh\ HD/Users/test/Desktop
sudo mkdir airport
sudo ln -s /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport/ /Volumes/Macintosh\ HD/Users/test/Desktop/airport

touch ShutOffTimeLog.txt 

# run check every second for 24hrs
for ((i=0; i<86400; i++)); do
    RESULT=`airport -I | cut -d ':' -f2 | xargs`
    airport -I
    sleep 1

    if [ "$RESULT" = 'Off' ]; then
        echo "Turned Off:" $(date) >> /Volumes/Macintosh\ HD/Users/test/Desktop/ShutOffTimeLog.txt
        open ShutOffTimeLog.txt
    else
        echo $RESULT
        echo 'Off'
    fi
    
    done 

     
