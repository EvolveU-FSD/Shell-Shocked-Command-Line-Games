#!/bin/bash


# Cleanup function to reset the environment
cleanup() {
    rm -f blueprints.txt
    rm -f hack_console.sh
    rm -f loot.dat
}

# Introduction
echo "************** Mission: The Vault Heist **************"
echo "The vault is locked down with the highest security. Only those who master file permissions can crack the code and steal the prize!"
echo ""
echo "Welcome, Master Thief. Your team of elite hackers and infiltrators is counting on you to break into Vault Omega, the most secure data vault in the world."
echo ""
echo "To bypass security, you must master file permissions, ownership, and access control. If you fail, the alarms will trigger, and the mission will be over."
echo ""
echo "Stay quiet, stay quick, and don’t get caught."

# Perform cleanup at the beginning of the script to ensure a fresh start
cleanup

echo "-----------------------------------------------"
echo "Challenge 1: Checking Security Measures"
echo "-----------------------------------------------"
echo ""
echo "Before making your move, scout the security system!"
echo ""
echo "Use a command to list all files with detailed permissions."
echo "The vault’s security team is meticulous, so you must check access before attempting a breach."
echo ""

read -p "Use a command to list all files with permissions. Press Enter when ready: " list_permissions
eval $list_permissions

echo ""
# The correct command is:
# ls -la
if [[ "$list_permissions" == "ls -la" ]]; then
    echo "The blueprints reveal security layers… but can you disable them? Well done!"
    echo ""
    sleep 3
    clear
else
    echo "More details needed. Try again."
    cleanup
    exit 1
fi

echo "-----------------------------------------------"
echo "Challenge 2: Identifying the Mastermind"
echo "-----------------------------------------------"
echo ""
echo "Before you hack in, make sure you know who you're pretending to be!"
echo ""
echo "Check which user identity you are operating under."
echo "The guards might be tracking specific usernames, so you need to verify your disguise."

read -p "Use a command to see your username. Press Enter when ready: " check_user
eval $check_user
# The correct command is:
# whoami
if [[ "$check_user" == "whoami" ]]; then
    echo "Your alias is confirmed. The security system still thinks you’re a harmless janitor."
    echo ""
    sleep 3
    clear
else
    echo "Alias unverified. Try again."
    cleanup
    exit 1
fi

echo "-----------------------------------------------"
echo "Level 3: Unlocking the Vault Console"
echo "-----------------------------------------------"
echo ""
echo "The vault interface is locked. Enable execution permissions to override security!"
echo ""
echo "Give execute (+x) permission to an existing script named hack_console.sh so you can use it to run your next attack."
echo ""


# Setup the challenge
touch hack_console.sh
read -p "Use 'chmod' to add execute permission. Press Enter when ready: " chmod_exec
eval $chmod_exec

echo ""
# The correct command is:
# chmod +x hack_console.sh

if [[ "$chmod_exec" == "chmod +x hack_console.sh" ]]; then
    echo "The console is now accessible. You’re one step closer to disabling security…"
    echo ""
    sleep 5
    clear
else
    echo "The console remains unaccessible. Try again."
    cleanup
    exit 1
fi

echo "-----------------------------------------------"
echo "Level 4: Locking Out the Competition"
echo "-----------------------------------------------"
echo ""
echo "Other thieves might be watching. Lock down the stolen blueprints so only you can access them!"
echo ""
echo "Set an existing file called blueprints.txt so that only the owner (you) can read and write to it, ensuring no rival hackers can steal your hard work."

touch blueprints.txt
read -p "Use 'chmod' to restrict access. Press Enter when ready: " chmod_restrict
eval $chmod_restrict
echo ""
# The correct command is:
# chmod 600 blueprints.txt
if [[ "$chmod_restrict" == "chmod 600 blueprints.txt" ]]; then
    echo "The files are locked. No one but you can retrieve them now… unless they’re very, very good."
    echo ""
    sleep 3
    clear
else
    echo "blueprints.txt remain unsecure. Try again."
    cleanup
    exit 1
fi

echo "-----------------------------------------------"
echo "Level 5: Passing the Prize to the Getaway Driver"
echo "-----------------------------------------------"
echo ""
echo "The goods are stolen, but you need to hand them off to your inside contact!"
echo ""
echo "Change the owner of loot.dat to a contact named alice—she’ll handle laundering the stolen data."
echo ""

touch loot.dat
read -p "Use 'chown' to change ownership. Press Enter when ready: " chown_command
eval $chown_command

echo ""
# The correct command is:
# chown alice loot.dat
if [[ "$chown_command" == "chown alice loot.dat" ]]; then
    echo "A true master! well done!"
    echo ""
    sleep 3
    clear
else
    echo "Only a master thief can pull this off. Try again."
    cleanup
    exit 1
fi

# End of script
echo ""
echo "You did it! The vault is cracked, the loot is secure, and your identity remains hidden."
echo "The getaway driver is on standby, and the authorities are none the wiser."
echo ""
echo "Until the next heist…"
cleanup
cd ..

