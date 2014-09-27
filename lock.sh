#!/bin/bash
DEVICE=Your Bluetooth device's MAC Address
DEV_NAME=Your device's name
INTERVAL=3 # in seconds
# Start xscreensaver if it's not already running
pgrep xscreensaver
if [ $? -eq 1 ]; then
echo "Starting xscreensaver..." 
screensaver &
fi
FLAG=0
# Assumes you've already paired and trusted the device
while [ $FLAG=1 ]; do
opt=`hcitool name $DEVICE`
echo $opt
if [ "$opt" = "$DEV_NAME" ]; then
echo "Device Paired. Not locking"
else
echo "$DEVICE ($DEV_NAME); locking!"
FLAG=1
gnome-screensaver-command -l
fi
sleep $INTERVAL
done
