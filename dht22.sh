#!/bin/sh

# Domoticz server
SERVER="http://192.168.1.16:8080/"
# DHT IDX
DHTIDX="22"

# DHTPIN
DHTPIN="4"

sleep 5

sudo nice -20 python3 dht22.py > dht20.txt

file="dht22.txt"

# Check if the file exists
if [ -e "$file" ]; then
    # Read the first line and store it in the TEMP variable
    TEMP=$(head -n 1 "$file")

    # Read the second line and store it in the RH variable
    RH=$(sed -n '2p' "$file")

    # Display the values
    echo "Temperature: $TEMP"
    echo "Relative Humidity: $RH"
else
    echo "File not found: $file"
fi
