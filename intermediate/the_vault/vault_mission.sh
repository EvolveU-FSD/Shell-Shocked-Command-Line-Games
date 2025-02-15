#!/bin/bash

# Cleanup function to reset the environment
cleanup() {
    sudo rm -rf vault
}

# Introduction
echo "Welcome to 'The Vault' mission. Your goal is to unlock the vault and retrieve the artifact inside."
echo "You will need to change file permissions and ownerships correctly to proceed through each level."
echo ""

# Perform cleanup at the beginning of the script to ensure a fresh start
cleanup

# Level 1: Gaining Access to the Vault
echo "-----------------------------------------------"
echo "Level 1: Gaining Access to the Vault"
echo "-----------------------------------------------"
echo ""
echo "The vault directory is locked. You need to change its permissions to access it."
echo "The only clue we have is a hastily scralled note saying 'rwxr-x---' I wonder what it means?"
echo ""

# Setup the vault directory with restricted permissions
mkdir -p vault
chmod 000 vault

# Prompt the player to change permissions
read -p "Change the permissions of the vault directory and press Enter to continue: " chmod_command
echo ""

eval $chmod_command
echo ""
# Check if the permissions are set correctly (Using -f %A for macOS)
# The correct answer is: chmod 750 vault
if [ "$(stat -f %A vault)" = "750" ]; then
    echo "Vault access granted. Proceed to the next level."
    echo ""
    sleep 3
    clear
else
    echo "The vault remains locked. Try changing the permissions."
    cleanup
    exit 1
fi

# Level 2: Unlocking the Inner Files
echo "-----------------------------------------------"
echo "Level 2: Unlocking the Inner Files"
echo "-----------------------------------------------"
echo ""
echo "There are files inside the vault that are locked. You need to change their permissions to access them."
echo ""
echo "There are two files -> vault/devil.txt and vault/angel.txt I wonder if their names might be a hint?"
echo ""

# Create files inside the vault with incorrect permissions
touch vault/devil.txt vault/angel.txt
chmod 000 vault/devil.txt
chmod 600 vault/angel.txt

# Prompt the player to change permissions
read -p "Change the permissions of the files inside the vault and press Enter to continue: " devil_angel_command
echo ""

eval $devil_angel_command
echo ""
# Check if the permissions are set correctly (Using -f for macOS)
# The correct answer is: chmod 666 vault/devil.txt && chmod 777 vault/angel.txt
if [ "$(stat -f %A vault/devil.txt)" = "666" ] && [ "$(stat -f %A vault/angel.txt)" = "777" ]; then
    echo "Files unlocked. Proceed to the next level."
    echo ""
    sleep 3
    clear
else
    echo "Files are still locked. Adjust the permissions."
    cleanup
    exit 1
fi

# Level 3: Ownership Confusion
echo "-----------------------------------------------"
echo "Level 3: Ownership Confusion"
echo "-----------------------------------------------"
echo ""
echo "The files inside the vault are owned by root. You need to change ownership to your user."
echo "(vault/devil.txt vault/angel.txt)"

# Change ownership of files to root (simulating the issue)
sudo chown root vault/devil.txt vault/angel.txt

# Prompt the player to change ownership
read -p "Change the ownership of the files to your user and press Enter to continue: " chown_command
echo ""

eval $chown_command
echo ""
# Check if the ownership is set correctly (Using -f for macOS)
# The correct answer is: sudo chown $(whoami) vault/devil.txt && sudo chown $(whoami) vault/angel.txt
if [ "$(stat -f %u vault/devil.txt)" = "$(id -u)" ] && [ "$(stat -f %u vault/angel.txt)" = "$(id -u)" ]; then
    echo "Ownership transferred. Proceed to the final level."
    echo ""
    sleep 3
    clear
else
    echo "Ownership has not been changed correctly. Try again."
    cleanup
    exit 1
fi

# Level 4: The Final Puzzle
echo "-----------------------------------------------"
echo "Level 4: The Final Puzzle"
echo "-----------------------------------------------"
echo ""
echo "The final file, artifact.txt, is heavily secured. Set the correct ownership and permissions to unlock it."
echo "The walls have something scratched on them... 'only the owner can read and write'"
echo ""

# Create the artifact file with incorrect ownership and permissions
touch vault/artifact.txt
chmod 000 vault/artifact.txt
sudo chown root vault/artifact.txt

# Prompt the player to set ownership and permissions
read -p "Set the correct ownership and permissions on artifact.txt and press Enter to complete the mission. " artifact_command
echo ""

eval $artifact_command
echo ""
# Check if the ownership and permissions are set correctly (Using -f for macOS)
# The correct answer is: sudo chown $(whoami) vault/artifact.txt && chmod 600 vault/artifact.txt
if [ "$(stat -f %A vault/artifact.txt)" = "600" ] && [ "$(stat -f %u vault/artifact.txt)" = "$(id -u)" ]; then
    echo "Artifact unlocked. Mission complete!"
    cat vault/artifact.txt  # Display the contents of the artifact file
    echo ""
    sleep 3
    clear
else
    echo "Artifact remains locked. Set the correct ownership and permissions."
    cleanup
    exit 1
fi

# End of script
echo ""
echo "Congratulations! You've successfully completed 'Mission: Data Miner'."
cleanup
