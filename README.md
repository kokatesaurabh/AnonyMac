# MAC Address Changer Script

This script allows you to continuously change MAC addresses of all network interfaces based on a user-selected interval.

## Features

- Automatically changes MAC addresses for all available network interfaces.
- Supports customizable time intervals (seconds, minutes, hours, days).
- Logs all MAC address changes to `mac_change.log`.

## Usage

1. Clone the repository.
2. Run the script `bash AnonyMac.sh`.
3. Follow the prompts to set the time interval.
4. Enter your sudo password when prompted.

## Requirements

- `macchanger` tool must be installed (`sudo apt-get install macchanger`).

## Example

```bash
                                                                                                                                                                                              
┌──(saurabh㉿Kali)-[~]
└─$ cd AnonyMac
                                                                                                                                                                                              
┌──(saurabh㉿Kali)-[~/AnonyMac]
└─$ bash AnonyMac.sh
 ▄▄▄·  ▐ ▄        ▐ ▄  ▄· ▄▌• ▌ ▄ ·.  ▄▄▄·  ▄▄· 
▐█ ▀█ •█▌▐█▪     •█▌▐█▐█▪██▌·██ ▐███▪▐█ ▀█ ▐█ ▌▪
▄█▀▀█ ▐█▐▐▌ ▄█▀▄ ▐█▐▐▌▐█▌▐█▪▐█ ▌▐▌▐█·▄█▀▀█ ██ ▄▄
▐█ ▪▐▌██▐█▌▐█▌.▐▌██▐█▌ ▐█▀·.██ ██▌▐█▌▐█ ▪▐▌▐███▌
 ▀  ▀ ▀▀ █▪ ▀█▄▀▪▀▀ █▪  ▀ • ▀▀  █▪▀▀▀ ▀  ▀ ·▀▀▀ 
                                                
               The MacChanger                  
                                                

Enter time interval (e.g., 1 sec, 10 mins, 1 hr, 2 days):
2 sec
MAC addresses will be changed every 2 sec (2 seconds).
Press Ctrl+C to stop.
[sudo] password for saurabh: 
[2024-07-16 21:01:37] Changed MAC address for eth0 to 04:7c:16:6a:3d:c6.
[2024-07-16 21:01:37] Changed MAC address for eth0 to 04:7c:16:52:d3:bb.
[2024-07-16 21:01:37] Changed MAC address for wlan0 to 00:41:0e:25:90:7c.
[2024-07-16 21:01:37] Changed MAC address for wlan0 to 00:41:0e:e2:96:b3.
[2024-07-16 21:01:37] Changed MAC address for eth0 to 04:7c:16:8e:b7:d9.
[2024-07-16 21:01:37] Changed MAC address for wlan0 to 00:41:0e:a7:ba:8e.
[2024-07-16 21:01:38] Changed MAC address for eth0 to 04:7c:16:f5:ac:12.
[2024-07-16 21:01:38] Changed MAC address for wlan0 to 00:41:0e:ed:b7:58.
[2024-07-16 21:01:40] Changed MAC address for eth0 to 04:7c:16:de:ad:bd.
[2024-07-16 21:01:40] Changed MAC address for wlan0 to 00:41:0e:9b:ce:48.
^C
                                                                                                                                                                                              
┌──(saurabh㉿Kali)-[~/AnonyMac]
└─$ 



