#!/bin/bash


# Cleanup function to reset the environment
cleanup() {
    rm -f clue1.txt
    rm -f final_clue.txt
    rm -rf investigation
    rm -rf backup
    rm -rf old_data
    rm -f decoy.txt
}

# Introduction
echo "Welcome to 'Mission: File Investigator'. Your task is to uncover hidden clues by managing files within the system."
echo ""

# Perform cleanup at the beginning of the script to ensure a fresh start
cleanup

# Level 1: Creating and Viewing Files
echo "-----------------------------------------------"
echo "Challenge 1: Creating and Viewing a Simple File"
echo "-----------------------------------------------"
echo ""
echo "Create a file called 'clue1.txt'"
echo ""

read -p "Use 'touch' to create the file. Press Enter when ready: " create_command
echo ""

eval $create_command
echo ""
# Verify the file creation and contents
# The correct command is:
# touch clue1.txt
if [ -f "clue1.txt" ]; then
    echo "Great! You've created the file. Proceed to the next level."
    echo ""
    sleep 3
    clear
else
    echo "It seems the file wasn't created correctly. Try again."
    cleanup
    exit 1
fi

# Level 1: Creating and Viewing Files
echo "-----------------------------------------------"
echo "Challenge 2: Writing content to the file"
echo "-----------------------------------------------"
echo ""
echo "Write to the 'clue1.txt' file the following clue1:"
echo " 'The first clue is hidden deeper.'"
echo ""

read -p "Use 'echo' to add content to the file. Press Enter when ready: " create_command
echo ""

eval $create_command
echo ""
# Verify the file creation and contents
# The correct command is:
# echo "The first clue is hidden deeper." > clue1.txt
if [ -f "clue1.txt" ] && grep -q "The first clue is hidden deeper." clue1.txt; then
    echo "Great! You've added to the file. Proceed to the next level."
    echo ""
    sleep 3
    clear
else
    echo "It seems the content wasn't added correctly. Try again."
    cleanup
    exit 1
fi

# Level 3: Moving and Renaming Files
echo "-----------------------------------------------"
echo "Level 3: Moving and Renaming Files"
echo "-----------------------------------------------"
echo ""
echo "Move 'clue1.txt' into a directory named 'investigation' and rename it to 'clue_renamed.txt'."
echo ""

# Setup the challenge
mkdir -p investigation

read -p "Use 'mv' to move and rename the file. Press Enter when ready: " move_command
echo ""

eval $move_command
echo ""
# Verify the move and rename
# The correct command is:
# mv clue1.txt investigation/clue_renamed.txt
if [ -f "investigation/clue_renamed.txt" ]; then
    echo "Well done! You've moved and renamed the file. Proceed to the next level."
    echo ""
    sleep 3
    clear
else
    echo "The file wasn't moved or renamed correctly. Try again."
    cleanup
    exit 1
fi

# Level 4: Copying Files
echo "-----------------------------------------------"
echo "Level 4: Copying Files"
echo "-----------------------------------------------"
echo ""
echo "Create a backup of 'clue_renamed.txt' by copying it into a directory named 'backup'."
echo ""

# Setup the challenge
mkdir -p backup

read -p "Use 'cp' to copy the file. Press Enter when ready: " copy_command
echo ""

eval $copy_command
echo ""
# Verify the copy
# The correct command is:
# cp investigation/clue_renamed.txt backup/
if [ -f "backup/clue_renamed.txt" ]; then
    echo "Good job! You've copied the file. Proceed to the next level."
    echo ""
    sleep 3
    clear
else
    echo "The file wasn't copied correctly. Try again."
    cleanup
    exit 1
fi

# Level 5: Deleting Files
echo "-----------------------------------------------"
echo "Level 5: Deleting Files"
echo "-----------------------------------------------"
echo ""
echo "A decoy file has been found. Delete 'decoy.txt' to clean up your workspace."
echo ""

# Setup the challenge
touch decoy.txt

read -p "Use 'rm' to delete the file. Press Enter when ready: " delete_command
echo ""

eval $delete_command
echo ""
# Verify the deletion
# The correct command is:
# rm decoy.txt
if [ ! -f "decoy.txt" ]; then
    echo "Excellent! You've deleted the decoy file. Proceed to the final level."
    echo ""
    sleep 3
    clear
else
    echo "The file wasn't deleted. Try again."
    cleanup
    exit 1
fi

# Level 6: Removing a Directory with a File Inside
echo "-----------------------------------------------"
echo "Level 6: Removing a Directory with a File Inside"
echo "-----------------------------------------------"
echo ""
echo "A directory named 'old_data' has some files you no longer need. Delete the entire directory and its contents."
echo ""

# Setup the challenge
mkdir old_data
touch old_data/unused.txt

read -p "Use 'rm' with the appropriate options to remove the directory and its contents. Press Enter when ready: " directory_delete_command
echo ""

eval $directory_delete_command
echo ""
# Verify the directory removal
# The correct command is:
# rm -r old_data
if [ ! -d "old_data" ]; then
    echo "Good work! You've removed the directory and its contents and completed 'Mission: File Investigator'."
    echo ""
    sleep 3
    clear
else
    echo "The directory wasn't removed. Try again."
    cleanup
    exit 1
fi


# End of script
echo ""
echo "Congratulations! You've uncovered all the clues and completed your mission."
cleanup

