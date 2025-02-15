#!/bin/bash

# Cleanup function to reset the environment
cleanup() {
    rm -f old_version.txt
    rm -f new_version.txt
    rm -f system.log
}

# Introduction
echo "Welcome to 'Mission: The Historian'. Your task is to uncover historical data using command line tools."
echo ""

# Perform cleanup at the beginning of the script to ensure a fresh start
cleanup

# Level 1: Retrieving Command History with `history`
echo "-----------------------------------------------"
echo "Level 1: Retrieving Command History with 'history'"
echo "-----------------------------------------------"
echo ""
echo "Search for the keyword 'backup' in the command history to uncover a critical action."
echo ""

# Simulate command history for the challenge
history -c  # Clear history
history -s "mkdir backup_directory"
history -s "cp important_file.txt backup_directory/"
history -s "tar -czvf backup.tar.gz backup_directory/"

read -p "Use 'history' and 'grep' to search for the keyword. Enter a command to execute: " user_command
echo ""

eval $user_command
echo ""
command_output=$(eval $user_command)

# Verify the history search
# The correct command is:
# history | grep "backup"
if [[ "$command_output" == *"backup"* ]] && [[ "$user_command" == *"backup"* ]]; then
    echo "Well done! You've found the relevant command in the history. Proceed to the next level."
    echo ""
    sleep 3
    clear
else
    echo "Incorrect Command. Try again."
    cleanup
    exit 1
fi

# Level 2: Comparing Files with `diff`
echo "-----------------------------------------------"
echo "Level 2: Comparing Files with 'diff'"
echo "-----------------------------------------------"
echo ""
echo "Compare 'old_version.txt' with 'new_version.txt' to identify what changes were made."
echo ""

# Setup the challenge
echo -e "Line 1: Unchanged\nLine 2: Original content\nLine 3: Unchanged" > old_version.txt
echo -e "Line 1: Unchanged\nLine 2: Updated content\nLine 3: Unchanged" > new_version.txt

read -p "Use 'diff' to compare the two files. Enter a command to execute: " diff_command
echo ""

eval $diff_command
echo ""
command_diff_output=$(eval $diff_command)

# Verify the diff command
# The correct command is:
# diff old_version.txt new_version.txt
if [[ "$command_diff_output" == *"Updated content"* ]]; then
    echo "Great! You've identified the changes. Proceed to the next level."
    echo ""
    sleep 3
    clear
else
    echo "The differences weren't identified correctly. Try again."
    cleanup
    exit 1
fi

# Level 3: Tail the Logs with `tail`
echo "-----------------------------------------------"
echo "Level 3: Tail the Logs with 'tail'"
echo "-----------------------------------------------"
echo ""
echo "Monitor the last few entries in 'system.log' to catch a recent event."
echo ""

# Setup the challenge
echo -e "Event 1: System boot\nEvent 2: User login\nEvent 3: File created" > system.log
echo -e "Event 4: System update\nEvent 5: User logout\nEvent 6: System shutdown" >> system.log

read -p "Use 'tail' to view the last 3 entries. Enter a command to execute: " tail_command
echo ""

eval $tail_command
echo ""
command_tail_output=$(eval $tail_command)

# Verify the tail command
# The correct command is:
# tail -n 3 system.log
if [[ "$command_tail_output" == *"System update"* ]] && [[ "$command_tail_output" == *"System shutdown"* ]]; then
    echo "Excellent! You've caught the recent events. Proceed to the next level."
    echo ""
    sleep 3
    clear
else
    echo "The tail command didn't capture the correct entries. Try again."
    cleanup
    exit 1
fi

# Level 4: Filtering Logs with `grep`
echo "-----------------------------------------------"
echo "Level 4: Filtering Logs with 'grep'"
echo "-----------------------------------------------"
echo ""
echo "Filter the 'system.log' file to find entries related to 'User login'."
echo ""

read -p "Use 'grep' to search for the keyword 'User login'. Enter a command to execute: " grep_command
echo ""

eval $grep_command
echo ""

command_grep_output=$(eval $grep_command)

# Verify the grep command
# The correct command is:
# grep "User login" system.log
if [[ "$command_grep_output" == *"User login"* ]]; then
    echo "Well done! You've filtered the log correctly. Proceed to the final level."
    echo ""
    sleep 3
    clear
else
    echo "The grep command didn't filter the correct entries. Try again."
    cleanup
    exit 1
fi

# Level 5: Monitoring File Changes with `tail -f`
echo "-----------------------------------------------"
echo "Level 5: Monitoring File Changes with 'tail -f'"
echo "-----------------------------------------------"
echo ""
echo "Monitor the 'system.log' file and identify new entries that will be added every 5 seconds."
echo ""

# Setup the challenge
echo "Initial log entry" > system.log

# Start a background process to add a new log entry every 5 seconds for 5 minutes (60 entries)
(
  for i in {1..60}
  do
    sleep 5
    echo "New event $i detected at $(date)" >> system.log
  done
) &

read -p "Use 'tail -f' to monitor 'system.log'. Press Enter to continue once you've observed several new entries (wait about 15 seconds): " tail_command
echo ""

# Execute the user's tail command in the background
# The correct command is:
# tail -f system.log
eval "$tail_command" &
TAIL_PID=$!

# Allow time for observation
sleep 15

# Kill the tail process
kill $TAIL_PID
echo ""

# Capture the last few lines of the log to verify
command_tail_output=$(tail -n 5 system.log)

# Verify the tail command
if [[ "$tail_command" == *"tail"* && "$tail_command" == *"-f"* ]] && [[ "$command_tail_output" == *"New event"* ]]; then
    echo "Fantastic! You've successfully monitored the file and observed the new entries. Mission complete!"
    echo ""
    sleep 3
    clear
else
    echo "The command didn't monitor the file correctly. Try again."
    cleanup
    exit 1
fi



# End of script
echo ""
echo "Congratulations! You've successfully completed 'Mission: The Historian'."
cleanup
