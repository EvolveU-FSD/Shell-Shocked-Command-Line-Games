# Bonus Challenge 3: Check Disk Space Usage
echo "-----------------------------------------------"
echo "Bonus Challenge 3: Check Disk Space Usage"
echo "-----------------------------------------------"
echo ""
echo "Use a command to display the disk space usage for all mounted file systems."
echo ""

read -p "Enter the command to display disk space usage: " disk_space_command
echo ""

# Verify the correct command
# The correct command is:
# df -h
if [[ "$disk_space_command" == *"df -h"* ]]; then
    eval $disk_space_command
    echo "Great! You've successfully displayed the disk space usage."
    echo ""
    sleep 3
    clear
else
    echo "Incorrect command. Try again."
    exit 1
fi
