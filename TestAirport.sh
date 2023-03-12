#!/bin/bash

#symbolic link to the airport tool
sudo ln -s /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport /usr/local/bin/airport

cd Destop/; touch timeLog.txt; open timeLog.txt

# ask user how long they want the test to run
echo 'How long should the test run?' 
HOURS=NumberOfHours
read -k 2 $NumbersOfHours
echo $NumbersOfHours


# detail info about current connection
airport -I


# run this script indefinetly for a user define time - for now we will set as 24hrs

if airport = 0 
    