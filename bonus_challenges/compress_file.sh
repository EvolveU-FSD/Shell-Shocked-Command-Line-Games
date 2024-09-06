#!/bin/bash

# Cleanup function to reset the environment
cleanup() {
    rm -f archive_name.tar.gz
}

# Perform cleanup at the beginning of the script to ensure a fresh start
cleanup

# Bonus Challenge 5: Create a Compressed Archive of a Directory
echo "-----------------------------------------------"
echo "Bonus Challenge 5: Create a Compressed Archive of a Directory"
echo "-----------------------------------------------"
echo ""
echo "Use a command to create a compressed archive of the /var/logs directory."
echo ""

read -p "Enter the command to create the compressed archive: " archive_command
echo ""

eval $archive_command
echo ""
# Verify the correct command
# The correct command is:
# tar -czvf archive_name.tar.gz /var/logs
if [[ "$archive_command" == *"tar -czvf"* && "$archive_command" == *"/var/logs"* ]]; then
    echo "Great! You've successfully created the compressed archive."
    echo ""
    sleep 3
    clear
else
    echo "Incorrect command. Try again."
    cleanup
    exit 1
fi

# End of script
echo ""
echo "Congratulations! You've successfully completed 'Mission: The Historian'."
cleanup
