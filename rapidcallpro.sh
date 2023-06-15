#!/bin/bash

ascii_art="
______            _     _ _____       _ _______          
| ___ \          (_)   | /  __ \     | | | ___ \         
| |_/ /__ _ _ __  _  __| | /  \/ ____| | | |_/ /___ ___  
|    // _  |  _ \| |/ _  | |    / _  | | |  __/  __/ _ \ 
| |\ \ (_| | |_) | | (_| | \__/\ (_| | | | |  | | | (_) |
\_| \_\____|  __/|_|\____|\____/\__ _|_|_\_|  |_|  \___/ 
           | |                                           
           |_|                                           "

text_color='\033[1;34m'
reset_color='\033[0m'

echo -e "${text_color}${ascii_art}${reset_color}"


echo "Running RapidCallPro..."


validate_phone_number() {
    local regex='^[0-9]{10}$'

    if [[ $1 =~ $regex ]]; then
        return 0
    else
        return 1
    fi
}

# Function to validate the time interval
validate_time_interval() {
    # Regex pattern for a positive integer
    local regex='^[1-9][0-9]*$'

    if [[ $1 =~ $regex ]]; then
        return 0
    else
        return 1
    fi
}

adb_output=$(adb devices)

device_id=$(echo "$adb_output" | grep -oE '[a-f0-9]{12}')

if [[ -n "$device_id" ]]; then
    echo "Device Found! ID: $device_id"
else
    echo "No ADB devices found! Connect your device and Restart the app."
fi

read -p "Enter the phone number (10 digits): " phone_number

if ! validate_phone_number "$phone_number"; then
    echo "Invalid phone number format. Please enter a 10-digit number."
    exit 1
fi

read -p "Enter the time interval (in seconds): " time_interval

if ! validate_time_interval "$time_interval"; then
    echo "Invalid time interval. Please enter a positive integer."
    exit 1
fi

while true; do
    adb -s "$device_id" shell am start -a android.intent.action.CALL -d tel:"$phone_number"
    sleep "$time_interval"
    adb shell input keyevent 6
done
