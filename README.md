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
bash AnonyMac.sh
