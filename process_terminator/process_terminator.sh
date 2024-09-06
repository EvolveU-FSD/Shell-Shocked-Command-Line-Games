#!/bin/bash

# Cleanup function to reset the environment
cleanup() {
    pkill sleep 2>/dev/null
}

# Introduction
echo "Welcome to 'Mission: Process Terminator'. Your task is to manage system processes by identifying and terminating them."
echo ""

# Perform cleanup at the beginning of the script to ensure a fresh start
cleanup

# Level 1: Listing Active Processes with `ps`
echo "-----------------------------------------------"
echo "Level 1: Listing Active Processes with 'ps'"
echo "-----------------------------------------------"
echo ""
echo "Use the 'ps' command to list ALL active processes running on the system in a user friendly format."
echo ""

read -p "Enter the command to list ALL active processes in a user friendly format: " ps_command
echo ""

eval $ps_command
# Verify the `ps` command
# The correct command is:
# ps aux
if [[ "$ps_command" == *"ps"* ]] && [[ "$ps_command" == *"a"* ]] && [[ "$ps_command" == *"u"* ]] && [[ "$ps_command" == *"x"* ]]; then
    eval $ps_command
    echo "Well done! You've successfully listed the active processes. Proceed to the next level."
    echo ""
    sleep 3
    clear
else
    echo "Incorrect Command. Try again."
    cleanup
    exit 1
fi

# Level 2: Monitoring Processes with `top`
echo "-----------------------------------------------"
echo "Level 2: Monitoring Processes with 'top'"
echo "-----------------------------------------------"
echo ""
echo "Use the 'top' command to monitor active processes, sorted by CPU usage."
echo "The 'top' command should display 5 iterations and then exit automatically."
echo ""

read -p "Enter the command to monitor active processes sorted by CPU usage (hint: add options to 'top'). press 'q' to quit top: " top_command
echo ""

# Verify the `top` command
# The correct command is:
# top -n 5
if [[ "$top_command" == *"top"* ]] && [[ "$top_command" == *"-n 5"* ]]; then
    echo "Great! You've successfully monitored the processes. The process list will automatically exit after 5 iterations."
    eval $top_command
    echo ""
    sleep 3
    clear
else
    echo "Incorrect Command. Try again."
    cleanup
    exit 1
fi

# Level 3: Finding Specific Processes with `pgrep`
echo "-----------------------------------------------"
echo "Level 3: Finding Specific Processes with 'pgrep'"
echo "-----------------------------------------------"
echo ""
echo "Use 'pgrep' to search for the 'sleep' process and retrieve its Process ID."
echo ""

# Simulate a sleep process
sleep 500 &

read -p "Enter the command to find the Process ID of 'sleep': " pgrep_command
echo ""

# Verify the `pgrep` command
# The correct command is:
# pgrep sleep
if [[ "$pgrep_command" == *"pgrep sleep"* ]]; then
    eval $pgrep_command
    echo "Excellent! You've found the Process ID. Proceed to the next level."
    echo ""
    sleep 3
    clear
else
    echo "Incorrect Command. Try again."
    cleanup
    exit 1
fi

# Level 4: Terminating a Process with `kill`
echo "-----------------------------------------------"
echo "Level 4: Terminating a Process with 'kill'"
echo "-----------------------------------------------"
echo ""
echo "Use the 'kill' command to terminate the 'sleep' process by its Process ID."
echo ""

pgrep_pid=$(pgrep sleep)
read -p "Enter the command to kill the process with PID $pgrep_pid: " kill_command
echo ""

# Verify the `kill` command
# The correct command is:
# kill PID
if [[ "$kill_command" == *"kill $pgrep_pid"* ]]; then
    eval $kill_command
    echo "Great! You've successfully terminated the process. Proceed to the final level."
    echo ""
    sleep 3
    clear
else
    echo "The command didn't work correctly. Try again."
    cleanup
    exit 1
fi

# Level 5: Killing Processes by Name with `pkill`
echo "-----------------------------------------------"
echo "Level 5: Killing Processes by Name with 'pkill'"
echo "-----------------------------------------------"
echo ""
echo "Use 'pkill' to terminate all processes named 'sleep'."
echo ""

# Simulate multiple sleep processes
sleep 500 &
sleep 500 &

read -p "Enter the command to kill all 'sleep' processes: " pkill_command
echo ""

# Verify the `pkill` command
# The correct command is:
# pkill sleep
if [[ "$pkill_command" == *"pkill sleep"* ]]; then
    eval $pkill_command
    echo "Amazing! You've successfully terminated all 'sleep' processes. Mission complete!"
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
echo "Congratulations! You've successfully completed 'Mission: Process Terminator'."
cleanup
