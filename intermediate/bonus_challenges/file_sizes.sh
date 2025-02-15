# Bonus Challenge 1: Find the Biggest File in a Directory
echo "-----------------------------------------------"
echo "Bonus Challenge 1: Find the Biggest File in a Directory"
echo "-----------------------------------------------"
echo ""
echo "Use a command to find the file sizes in the /var/logs directory. Sort them from largest to smallest."
echo ""

read -p "Enter the command to find the largest file in /var/logs: " largest_file_command
echo ""

eval $largest_file_command
echo ""
# Verify the correct command
# The correct command is:
# du -ah /var/logs | sort -rh
if [[ "$largest_file_command" == *"du -ah /var/logs"* && "$largest_file_command" == *"sort -rh"* ]]; then
    echo "Great! You've successfully found the largest file in the directory."
    echo ""
    sleep 3
    clear
else
    echo "Incorrect command. Try again."
    exit 1
fi
