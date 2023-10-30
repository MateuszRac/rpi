#!/bin/sh

# Domoticz server
SERVER="http://192.168.1.16:8080/"
# DHT IDX
DHTIDX="22"

# DHTPIN
DHTPIN="4"

sleep 5

sudo nice -20 python3 dht22.py > dht20.txt



if [ -e "dht22.txt" ]; then
    # Read the first line of the file
    read -r line < "dht22.txt"
    
    # Set the IFS (Internal Field Separator) to a tab character
    IFS=$'\t'
    
    # Split the line into substrings and store them in variables
    read -a fields <<< "$line"
    
    # Check if there are at least two fields
    if [ ${#fields[@]} -ge 2 ]; then
        TEMP="${fields[0]}"
        RH="${fields[1]}"
        
        echo $TEMP
        echo $RH
        
        curl -s -i -H "Accept: application/json" "http://$SERVER/json.htm?type=command&c=getauth&param=udevice&idx=$DHTIDX&nvalue=0&svalue=$TEMP;$RH;2"
    else
        echo "The line does not contain at least two fields separated by tabs."
    fi
else
    echo "File dht22.txt does not exist."
fi
