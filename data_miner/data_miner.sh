#!/bin/bash

# Cleanup function to reset the environment
cleanup() {
    rm -f data.txt
    rm -f data.csv
    rm -rf dataset
}

# Introduction
echo "Welcome to 'Mission: Data Miner'. Your task is to uncover hidden data using basic command line tools."
echo ""

# Perform cleanup at the beginning of the script to ensure a fresh start
cleanup

# Level 1: Searching with `grep`
echo "-----------------------------------------------"
echo "Level 1: Searching with 'grep'"
echo "-----------------------------------------------"
echo ""
echo "Search for the keyword 'SECRET' in the file 'data.txt' to uncover a hidden message."
echo ""

# Setup the challenge
echo -e "This is a line.\nSECRET: The treasure is buried under the oak tree.\nThis is another line." > data.txt

read -p "Use 'grep' to search for the keyword. Enter a command to execute: " user_command
echo ""

eval $user_command
echo ""
command_output=$(eval $user_command)

# Verify the grep search
# The correct command is:
# grep "SECRET" data.txt
if [[ "$command_output" == *"SECRET: The treasure is buried under the oak tree."* ]]; then
    echo "Well done! You've found the hidden message. Proceed to the next level."
    echo ""
    sleep 3
    clear
else
    echo "The keyword wasn't found. Try again."
    cleanup
    exit 1
fi

# Level 2: Counting with `wc`
echo "-----------------------------------------------"
echo "Level 2: Counting with 'wc'"
echo "-----------------------------------------------"
echo ""
echo "Count the number of lines, words, and characters in 'data.txt'."
echo ""

read -p "Use 'wc' to count the lines, words, and characters. Enter a command to execute to find the number of lines in data.txt: " line_count_command
echo ""

eval $line_count_command
echo ""
command_line_count_output=$(eval $line_count_command)

# Verify the wc counts
# The correct command is:
# wc -l data.txt

if [[ "$command_line_count_output" == *"3"* ]]; then
    echo "Good job! You've correctly counted the lines!"
    echo ""
else
    echo "The command to get the line count is incorrect. Try again."
    echo ""
    cleanup
    exit 1
fi

read -p "Enter a command to execute to find the word count in data.txt: " word_count_command
echo ""

eval $word_count_command
echo ""
command_word_count_output=$(eval $word_count_command)

# Verify the wc counts
# The correct command is:
# wc -w data.txt

if [[ "$command_word_count_output" == *"17"* ]]; then
    echo "Good job! You've correctly counted the words!"
    echo ""
else
    echo "The command to get the line count is incorrect. Try again."
    echo ""
    cleanup
    exit 1
fi


read -p "Enter a command to execute to find the number of characters in data.txt: " character_count_command
echo ""

eval $character_count_command
echo ""
command_character_count_output=$(eval $character_count_command)

# Verify the wc counts
# The correct command is:
# wc -c data.txt

if [[ "$command_character_count_output" == *"89"* ]]; then
    echo "Good job! You've correctly counted the lines, words, and characters. Proceed to the next level."
    echo ""
    sleep 3
    clear
else
    echo "The command to get the line count is incorrect. Try again."
    cleanup
    exit 1
fi



# Level 3: Finding Files with `find`
echo "-----------------------------------------------"
echo "Level 3: Finding Files with 'find'"
echo "-----------------------------------------------"
echo ""
echo "Locate the file 'target_file.txt' hidden in the directory structure."
echo ""

# Setup the challenge
mkdir -p dataset/subdir1/subdir2
touch dataset/subdir1/subdir2/target_file.txt

read -p "Use 'find' to locate the file. Enter a command to execute the find command: " find_command
echo ""

eval $find_command
echo ""
command_find_output=$(eval $find_command)


# Verify the find command
# The correct command is:
# find ./dataset -name "target_file.txt"
if [[ "$command_find_output" == *"./dataset/subdir1/subdir2/target_file.txt"* ]]; then
    echo "Excellent! You've found the hidden file. Proceed to the next level."
    echo ""
    sleep 3
    clear
else
    echo "The file wasn't found. Try again."
    cleanup
    exit 1
fi

# Level 4: Extracting Data with `cut`
echo "-----------------------------------------------"
echo "Level 4: Extracting Data with 'cut'"
echo "-----------------------------------------------"
echo ""
echo "Extract the first and third columns from 'data.csv'."
echo ""

# Setup the challenge
echo -e "ID,Name,Value\n1,Alice,100\n2,Bob,200\n3,Charlie,300" > data.csv

read -p "Use 'cut' to extract the first and third columns. Enter a command to execute a cut command: " cut_command
echo ""

eval $cut_command
echo ""
command_cut_output=$(eval $cut_command)


# Verify the cut command
# The correct command is:
# cut -d ',' -f 1,3 data.csv

if [[ "$command_cut_output" == *"ID,Value
1,100
2,200
3,300"* ]]; then    
    echo "Great! You've extracted the correct columns. Proceed to the final level."
    echo ""
    sleep 3
    clear
else
    echo "The extraction wasn't correct. Try again."
    cleanup
    exit 1
fi

# Level 5: Advanced Searching with `grep`
echo "-----------------------------------------------"
echo "Level 5: Advanced Searching with 'grep'"
echo "-----------------------------------------------"
echo ""
echo "Find the lines that contain the word 'data' in the file 'data.txt', but it must be an exact match, and case-sensitive."
echo ""

# Setup the challenge
echo -e "Data is important.\ndata is everywhere.\nDATA can be big or small.\nThe word we seek is exactly 'data'." > data.txt

read -p "Use 'grep' to search for the exact word 'data' in a case-insensitive manner. Enter a command to execute: " grep_command
echo ""

eval $grep_command
echo ""
grep_output=$(eval $grep_command)

# Verify the grep command
# The correct command is:
# grep -w "data" data.txt
if [[ "$grep_output" == *"data is everywhere.
The word we seek is exactly 'data'."* ]]; then
    echo "Fantastic! You've correctly identified the exact match for 'data'. Mission complete!"
    echo ""
    sleep 3
    clear
else
    echo "The word wasn't found correctly. Try again."
    cleanup
    exit 1
fi

# End of script
echo ""
echo "Congratulations! You've successfully completed 'Mission: Data Miner'."
cleanup

