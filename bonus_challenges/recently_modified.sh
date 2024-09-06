# Bonus Challenge 7: Find Files Modified in the Last 24 Hours
echo "-----------------------------------------------"
echo "Bonus Challenge 7: Find Files Modified in the Last 24 Hours"
echo "-----------------------------------------------"
echo ""
echo "Use a command to find and display all files modified in the last 24 hours in the /var/logs directory."
echo ""

read -p "Enter the command to find files modified in the last 24 hours: " find_command
echo ""

eval $find_command
echo ""
# Verify the correct command
# The correct command is:
# find /var/logs -type f -mtime -1
if [[ "$find_command" == *"find /var/logs -type f -mtime -1"* ]]; then
    echo "Great! You've successfully found the files modified in the last 24 hours."
    echo ""
    sleep 3
    clear
else
    echo "Incorrect command. Try again."
    exit 1
fi
