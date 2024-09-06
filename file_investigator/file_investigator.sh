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
echo "Level 1: Creating and Viewing Files"
echo "-----------------------------------------------"
echo ""
echo "Create a file named 'clue1.txt' and write this message into it: 'The first clue is hidden deeper.' Then, view the contents of the file."
echo ""

# Setup the challenge (Instructions for the player)
read -p "Use 'touch' to create the file, 'echo' to write to it, and 'cat' to view its contents. Press Enter when ready: " create_command
echo ""

eval $create_command
echo ""
# Verify the file creation and contents
# The correct command is:
# touch clue1.txt && echo "The first clue is hidden deeper." > clue1.txt && cat clue1.txt
if [ -f "clue1.txt" ] && grep -q "The first clue is hidden deeper." clue1.txt; then
    echo "Great! You've created and viewed the file. Proceed to the next level."
    echo ""
    sleep 3
    clear
else
    echo "It seems the file wasn't created correctly or the content is missing. Try again."
    cleanup
    exit 1
fi

# Level 2: Moving and Renaming Files
echo "-----------------------------------------------"
echo "Level 2: Moving and Renaming Files"
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

# Level 3: Copying Files
echo "-----------------------------------------------"
echo "Level 3: Copying Files"
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

# Level 4: Deleting Files
echo "-----------------------------------------------"
echo "Level 4: Deleting Files"
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
    echo "Excellent! You've deleted the decoy file. Proceed to the next level."
    echo ""
    sleep 3
    clear
else
    echo "The file wasn't deleted. Try again."
    cleanup
    exit 1
fi

# Level 5: Removing a Directory with a File Inside
echo "-----------------------------------------------"
echo "Level 5: Removing a Directory with a File Inside"
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
    echo "Good work! You've removed the directory and its contents. Proceed to the final level."
    echo ""
    sleep 3
    clear
else
    echo "The directory wasn't removed. Try again."
    cleanup
    exit 1
fi

# Level 6: Using `cat` with a Slight Twist
echo "-----------------------------------------------"
echo "Level 6: Using 'cat' with a Slight Twist"
echo "-----------------------------------------------"
echo ""
echo "Combine the contents of 'clue_renamed.txt' and 'backup/clue_renamed.txt' into a new file named 'final_clue.txt'."
echo ""

# Setup the challenge
# The correct command to combine the files is:
# cat investigation/clue_renamed.txt backup/clue_renamed.txt > final_clue.txt
read -p "Use 'cat' to combine the files and redirect the output. Press Enter when ready: " cat_command
echo ""

eval $cat_command
echo ""
# Verify the combined file
if [ -f "final_clue.txt" ] && grep -q "The first clue is hidden deeper." final_clue.txt; then
    echo "Fantastic! You've combined the files and completed 'Mission: File Investigator'."
    echo ""
    sleep 3
    clear
else
    echo "It seems the files weren't combined correctly. Try again."
    cleanup
    exit 1
fi

# End of script
echo ""
echo "Congratulations! You've uncovered all the clues and completed your mission."
cleanup

