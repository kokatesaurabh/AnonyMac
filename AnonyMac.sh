#!/bin/bash
#
# Script: change_mac_addresses.sh
# Description: Continuously change MAC addresses of all network interfaces based on user-selected interval,
#              ensuring network connectivity is maintained.
#

# Function to change MAC address for a specific interface
change_mac_address() {
    local interface="$1"
    local new_mac

    # Check if the interface exists before attempting to change MAC
    if ! ip link show "$interface" &>/dev/null; then
        echo "[$(date +"%Y-%m-%d %H:%M:%S")] Interface $interface not found. Skipping." >> mac_change.log
        return
    fi
    
    # Bring down the interface temporarily to change MAC
    sudo ip link set "$interface" down

    # Change MAC address using macchanger
    new_mac=$(sudo macchanger -e "$interface" | grep "New MAC" | awk '{print $3}')
    
    # Bring the interface back up
    sudo ip link set "$interface" up
    
    # Print timestamp and details
    timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    echo "[$timestamp] Changed MAC address for $interface to $new_mac."
    echo "[$timestamp] Changed MAC address for $interface to $new_mac." >> mac_change.log
}

# Function to convert time interval to seconds
convert_to_seconds() {
    local interval="$1"
    local unit="$2"
    local seconds=0

    case $unit in
        sec* | Sec* | SEC* | s* | S*)
            seconds="$interval"
            ;;
        min* | Min* | MIN* | m* | M*)
            seconds=$((interval * 60))
            ;;
        hr* | Hr* | HR* | h* | H*)
            seconds=$((interval * 3600))
            ;;
        day* | Day* | DAY* | d* | D*)
            seconds=$((interval * 86400))
            ;;
        *)
            echo "Invalid time unit '$unit'. Please specify seconds (sec), minutes (min), hours (hr), or days (day)." >&2
            return 1
            ;;
    esac

    echo "$seconds"
}

# Function to get a random color code for AnonyMac
get_random_color() {
    colors=("\e[31m" "\e[32m" "\e[34m" "\e[33m")
    echo "${colors[$RANDOM % ${#colors[@]}]}"
}

# Get a random color for AnonyMac
anonymac_color=$(get_random_color)

# Print banner
echo -e "${anonymac_color} ▄▄▄·  ▐ ▄        ▐ ▄  ▄· ▄▌• ▌ ▄ ·.  ▄▄▄·  ▄▄· "
echo -e "▐█ ▀█ •█▌▐█▪     •█▌▐█▐█▪██▌·██ ▐███▪▐█ ▀█ ▐█ ▌▪"
echo -e "▄█▀▀█ ▐█▐▐▌ ▄█▀▄ ▐█▐▐▌▐█▌▐█▪▐█ ▌▐▌▐█·▄█▀▀█ ██ ▄▄"
echo -e "▐█ ▪▐▌██▐█▌▐█▌.▐▌██▐█▌ ▐█▀·.██ ██▌▐█▌▐█ ▪▐▌▐███▌"
echo -e " ▀  ▀ ▀▀ █▪ ▀█▄▀▪▀▀ █▪  ▀ • ▀▀  █▪▀▀▀ ▀  ▀ ·▀▀▀ "
echo -e "                                                "
echo -e "               \e[0mThe MacChanger                  "
echo -e "                                                "
echo

# Initialize log file
echo "Log started at $(date +"%Y-%m-%d %H:%M:%S")" > mac_change.log

# Main loop
while true; do
    # List all network interfaces except for loopback (lo)
    interfaces=$(ip -o link show | awk -F': ' '{print $2}' | grep -v 'lo')

    # Prompt user for time interval
    echo "Enter time interval (e.g., 1 sec, 10 mins, 1 hr, 2 days):"
    read -r input

    # Remove leading and trailing spaces
    input=$(echo "$input" | xargs)

    # Extract interval and unit
    interval=$(echo "$input" | cut -d ' ' -f1)
    unit=$(echo "$input" | cut -d ' ' -f2)

    # Convert interval to seconds
    interval_seconds=$(convert_to_seconds "$interval" "$unit")

    if [[ $? -ne 0 ]]; then
        echo "Please enter a valid time interval." >&2
        continue
    fi

    echo "MAC addresses will be changed every $interval $unit ($interval_seconds seconds)."
    echo "Press Ctrl+C to stop."

    # Loop to continuously change MAC addresses
    while true; do
        # Change MAC address for each interface sequentially
        for iface in $interfaces; do
            # Run change_mac_address function in background to avoid network interruption
            (change_mac_address "$iface" &)
            sleep 0.1  # Small delay between starting processes
        done

        # Wait for all background processes to finish before sleeping
        wait

        sleep "$interval_seconds"
    done
done
