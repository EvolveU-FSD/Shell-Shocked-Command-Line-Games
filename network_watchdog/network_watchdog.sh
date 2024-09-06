#!/bin/bash

# Cleanup function to reset any environment setup
cleanup() {
    rm -f sample.txt
}

# Introduction
echo "Welcome to 'Mission: Network Watchdog'. Your task is to monitor and troubleshoot network activity using command-line tools."
echo ""

# Perform cleanup at the beginning of the script to ensure a fresh start
cleanup

# Level 1: Checking Network Connectivity with `ping`
echo "-----------------------------------------------"
echo "Level 1: Checking Network Connectivity with 'ping'"
echo "-----------------------------------------------"
echo ""
echo "Use the 'ping' command to verify connectivity to google.com by sending 4 packets."
echo ""

read -p "Enter the command to check network connectivity: " ping_command
echo ""

eval $ping_command
echo ""
# Verify the ping command
# The correct command is:
# ping -c 4 google.com
if [[ "$ping_command" == *"ping"* ]] && [[ "$ping_command" == *"-c 4"* ]] && [[ "$ping_command" == *"google.com"* ]]; then
    echo "Well done! You've verified connectivity. Proceed to the next level."
    echo ""
    sleep 3
    clear
else
    echo "Incorrect Command. Try again."
    cleanup
    exit 1
fi

# Level 2: Inspecting Active Connections with `netstat`
echo "-----------------------------------------------"
echo "Level 2: Inspecting Active Connections with 'netstat'"
echo "-----------------------------------------------"
echo ""
echo "Use the 'netstat' command to list all active TCP and UDP connections."
echo ""

read -p "Enter the command to list active connections: " netstat_command
echo ""

eval $netstat_command
echo ""

# Verify the netstat command
# The correct command is:
# netstat -tuln
if [[ "$netstat_command" == *"netstat"* ]] && [[ "$netstat_command" == *"-"* ]]; then
    echo "Excellent! You've listed all active network connections. Proceed to the next level."
    echo ""
    sleep 3
    clear
else
    echo "Incorrect Command. Try again."
    cleanup
    exit 1
fi

# Level 3: Connecting to the Bandit Wargame Server with SSH
echo "-----------------------------------------------"
echo "Level 3: Connecting to the Bandit Wargame Server with 'ssh'"
echo "-----------------------------------------------"
echo ""
echo "Use the 'ssh' command to securely connect to the OverTheWire Bandit wargame server as the user 'bandit0'."
echo ""
echo "The server is located at 'bandit.labs.overthewire.org' and uses port 2220."
echo ""

read -p "Enter the SSH command to connect to the Bandit server and exit the server to successfully complete this challenge: " ssh_command
echo ""

eval $ssh_command
echo ""
# Verify the SSH command
# The correct command is:
# ssh bandit0@bandit.labs.overthewire.org -p 2220
if [[ "$ssh_command" == *"ssh"* ]] && [[ "$ssh_command" == *"bandit0@bandit.labs.overthewire.org"* ]] && [[ "$ssh_command" == *"-p 2220"* ]]; then
    echo "Great! You've successfully connected to the Bandit wargame server. Proceed to the next level."
    echo ""
    sleep 3
    clear
else
    echo "The command didn't work correctly. Try again."
    cleanup
    exit 1
fi


# Level 4: Testing HTTP Requests with `curl`
echo "-----------------------------------------------"
echo "Level 4: Testing HTTP Requests with 'curl'"
echo "-----------------------------------------------"
echo ""
echo "Use the 'curl' command to retrieve HTTP headers from example.com."
echo ""

read -p "Enter the command to retrieve HTTP headers: " curl_command
echo ""

eval $curl_command
echo ""
# Verify the curl command
# The correct command is:
# curl -I https://www.example.com
if [[ "$curl_command" == *"curl"* ]] && [[ "$curl_command" == *"I"* ]] && [[ "$curl_command" == *"https://www.example.com"* ]]; then
    echo "Excellent! You've successfully tested the HTTP request. Proceed to the final level."
    echo ""
    sleep 3
    clear
else
    echo "The command didn't work correctly. Try again."
    cleanup
    exit 1
fi

# Level 5: Advanced `curl` Challenge – Sending POST Requests
echo "-----------------------------------------------"
echo "Level 5: Advanced 'curl' Challenge – Sending POST Requests"
echo "-----------------------------------------------"
echo ""
echo "Use 'curl' to send a POST request with data to https://example.com/api."
echo ""

read -p "Enter the command to send a POST request: " curl_post_command
echo ""

# Verify the curl POST request command
# A correct command is:
# curl -X POST -d "name=Sage&task=CompleteMission" https://example.com/api
if [[ "$curl_post_command" == *"curl"* ]] && [[ "$curl_post_command" == *"-X POST"* ]] && [[ "$curl_post_command" == *"-d"* ]] && [[ "$curl_post_command" == *"https://example.com/api"* ]]; then
    echo "Amazing! You've successfully sent the POST request. Mission complete!"
    echo ""
    sleep 3
    clear
else
    echo "The command didn't work correctly. Try again."
    cleanup
    exit 1
fi

# End of script
echo ""
echo "Congratulations! You've successfully completed 'Mission: Network Watchdog'."
cleanup
