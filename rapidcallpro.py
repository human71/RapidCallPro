import re
import subprocess
import time

ascii_art = r'''
______            _     _ _____       _ _______
| ___ \          (_)   | /  __ \     | | | ___ \
| |_/ /__ _ _ __  _  __| | /  \/ ____| | | |_/ /___ ___
|    // _  |  _ \| |/ _  | |    / _  | | |  __/  __/ _ \
| |\ \ (_| | |_) | | (_| | \__/\ (_| | | | |  | | | (_) |
\_| \_\____|  __/|_|\____|\____/\__ _|_|_\_|  |_|  \___/
           | |
           |_|
'''

text_color = '\033[1;34m'
reset_color = '\033[0m'

print(f'{text_color}{ascii_art}{reset_color}')

print("Running RapidCallPro app...")

def validate_phone_number(number):
    regex = r'^[0-9]{10}$'
    return bool(re.match(regex, number))

def validate_time_interval(interval):
    regex = r'^[1-9][0-9]*$'
    return bool(re.match(regex, interval))

adb_output = subprocess.check_output(['adb', 'devices']).decode()

device_id = re.search(r'[a-f0-9]{12}', adb_output)

if device_id:
    print(f"Device Found! ID: {device_id.group()}")
else:
    print("No ADB devices found! Connect your device and Restart the app.")
    exit(1)

phone_number = input("Enter the phone number (10 digits): ")

if not validate_phone_number(phone_number):
    print("Invalid phone number format. Please enter a 10-digit number.")
    exit(1)

time_interval = input("Enter the time interval (in seconds): ")

if not validate_time_interval(time_interval):
    print("Invalid time interval. Please enter a positive integer.")
    exit(1)

while True:
    subprocess.run(['adb', '-s', device_id.group(), 'shell', 'am', 'start', '-a', 'android.intent.action.CALL', '-d', f'tel:{phone_number}'])
    time.sleep(int(time_interval))
    subprocess.run(['adb', 'shell', 'input', 'keyevent', '6'])

