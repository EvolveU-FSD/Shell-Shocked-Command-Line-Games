#!/bin/bash


# Cleanup function to reset the environment
cleanup() {
    rm -rf rabbit_hole
    rm -rf rabbit_hole2
}

# Introduction
echo "Wake up, Neo. The first step is knowing where you are."
echo ""

# Perform cleanup at the beginning of the script to ensure a fresh start
cleanup

echo "-----------------------------------------------"
echo "Challenge 1: Where Am I?"
echo "-----------------------------------------------"
echo ""

read -p "Use a command to print your current directory. Press Enter when ready: " pwd_command
echo ""
eval $pwd_command

echo ""
# Verify the file creation and contents
# The correct command is:
# pwd
if [[ "$pwd_command" == "pwd" ]]; then
    echo "Well done! Unfortunately, no one can be told what the Matrix is. You have to see it for yourself."
    echo ""
    sleep 3
    clear
else
    echo "You have to let it all go, Neo. Fear, doubt, and disbelief. Free your mind. Try again."
    cleanup
    exit 1
fi

echo "-----------------------------------------------"
echo "Challenge 2: What’s Around Me?"
echo "-----------------------------------------------"
echo ""
echo "The rabbit leaves a trail. Look around to find the next step."
echo ""

read -p "Use a command to see the contents of the directory including the hidden details. Press Enter when ready: " ls_command
echo ""
eval $ls_command
echo ""
# Verify the file creation and contents
# The correct command is:
# ls -a
if [[ "$ls_command" == "ls -a" ]]; then
    echo "There is no spoon. Great job! Proceed to the next level."
    echo ""
    sleep 3
    clear
else
    echo "Do not try and bend the spoon. That's impossible. Instead... only try to realize the truth. Try again."
    cleanup
    exit 1
fi

echo "-----------------------------------------------"
echo "Level 3: Enter the Tunnel"
echo "-----------------------------------------------"
echo ""
echo "The White Rabbit enters the tunnel. Follow it!"
echo ""

# Setup the challenge
mkdir -p rabbit_hole
read -p "Use the correct command to move into the 'rabbit_hole' directory. Press Enter when ready: " cd_command
echo ""
eval $cd_command

echo ""
# Verify the move and rename
# The correct command is:
# cd rabbit_hole
if [[ "$cd_command" == "cd rabbit_hole" ]]; then
    echo "Well done! I imagine that right now, you're feeling a bit like Alice. Tumbling down the rabbit hole? Proceed to the next level."
    echo ""
    sleep 3
    clear
else
    echo "I imagine that right now, you're feeling a bit like Alice. Tumbling down the rabbit hole? Try again."
    cleanup
    exit 1
fi

echo "-----------------------------------------------"
echo "Level 4: Escape Route"
echo "-----------------------------------------------"
echo ""
echo "You must go back before you can go forward."
echo ""

read -p "Use 'cd' to go up one level. Press Enter when ready: " cd_up
eval $cd_up
echo ""
# Verify the copy
# The correct command is:
# cd ..
if [[ "$cd_up" == "cd .." ]]; then
    echo "Neo, sooner or later you're going to realize just as I did that there's a difference between knowing the path and walking the path."
    echo "Proceed to the next level."
    echo ""
    sleep 3
    clear
else
    echo "I can only show you the door. You're the one that has to walk through it. Try again."
    cleanup
    exit 1
fi

echo "-----------------------------------------------"
echo "Level 5: The Door to Reality"
echo "-----------------------------------------------"
echo ""
echo "The rabbit whispers: Take the path out and back down the rabbit hole to find the truth."
echo ""

# Setup the challenge
mkdir -p rabbit_hole2
cd rabbit_hole2

echo "you have entered another rabbit hole and must escape"
echo "Use the correct command to move out of your current rabbit hole"
read -p "and into the 'rabbit_hole' directory. Press Enter when ready: " cd_command_2
echo ""
eval $cd_command_2

echo ""
# Verify the move and rename
# The correct command is:
# cd rabbit_hole
if [[ "$cd_command_2" == "cd ../rabbit_hole" ]]; then
    echo "Whoa. Déjà vu. Proceed to the next level."
    echo ""
    sleep 3
    clear
else
    echo "Whoa. Déjà vu. Try again."
    cleanup
    exit 1
fi

# End of script
echo ""
echo "Congratulations! You have followed the White Rabbit and completed the challenge. Welcome to the real world."
cd ..
cleanup

