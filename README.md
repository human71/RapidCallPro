# RapidCallPro
<p align = "center"> <img src="https://raw.githubusercontent.com/human71/RapidCallPro/main/preview.png"></p>

An app that calls your terget repeatedly. It takes input from users for the phone number and the time interval, and executes the provided command using adb in a loop::

```shell
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


echo "Running RapidCallPro app..."


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
```

Save the above code in a file (e.g., `rapidcallpro.sh`), and make it executable using the following command:

```shell
chmod +x rapidcallpro.sh
```

To run the script, open a terminal and navigate to the directory where the script is located. Then execute the following command:

```shell
./rapidcallpro.sh
```

The script will prompt you to enter the phone number, time in seconds. After providing the inputs, it will continuously calling the target and hanging up after the interval.

Please make sure that you have `adb` installed and properly set up on your Linux system before running the script.
