# RapidCallPro
<p align="justify">An app that calls your terget repeatedly using your phone's adb shell. It takes input from users for the phone number and the time interval, and executes the provided command using adb(install adb, if not available). Also, note that, in your mobile device <b>Developer Mode</b> should be on and <b>Usb Debbuging</b> should be enabled. For any help related to <b>adb</b>, please visit <a href="https://www.xda-developers.com/install-adb-windows-macos-linux/">here</a>.</p>

<br>
<p align = "center"> <img src="https://raw.githubusercontent.com/human71/RapidCallPro/main/preview.png"></p>
<br>


<details><summary><h2>Shell Version</h2></summary>
<br>
Download the shell code from <a href="https://raw.githubusercontent.com/human71/RapidCallPro/main/rapidcallpro.sh">here</a>. 

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
</details>

<details><summary><h2>Python Version(Universal)</h2></summary>
           
Download the shell code from <a href="https://raw.githubusercontent.com/human71/RapidCallPro/main/rapidcallpro.py">here</a>. 

To run the python code, open a terminal and navigate to the directory where the script is located. Then execute the following command:

```
python3 rapidcallpro.py
```          

The python code will prompt you to enter the phone number, time in seconds. After providing the inputs, it will continuously calling the target and hanging up after the interval.

Please make sure that you have `adb` installed and properly set up on your system before running the code.

           
