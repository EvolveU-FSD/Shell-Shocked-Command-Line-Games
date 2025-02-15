# Bonus Challenge 2: Generate a Random Password
echo "-----------------------------------------------"
echo "Bonus Challenge 2: Generate a Random Password"
echo "-----------------------------------------------"
echo ""
echo "Use the command line to generate a random 12-character password."
echo ""

read -p "Enter the command to generate a 12-character random password: " password_command
echo ""

# Verify the correct command
# The correct command is:
# openssl rand -base64 12
if [[ "$password_command" == *"openssl rand -base64 12"* ]]; then
    eval $password_command
    echo ""
    echo "Great! You've successfully generated a random password."
    echo ""
    sleep 3
    clear
else
    echo "Incorrect command. Try again."
    exit 1
fi
