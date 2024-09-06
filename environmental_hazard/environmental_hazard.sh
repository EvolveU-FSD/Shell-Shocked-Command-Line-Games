#!/bin/bash

# Cleanup function to reset the environment
cleanup() {
    unset MY_VAR 2>/dev/null
    rm -f hazard_script.sh
}

# Introduction
echo "Welcome to 'Mission: The Environmental Hazard'. Your task is to manage and manipulate environment variables using command-line tools."
echo ""

# Perform cleanup at the beginning of the script to ensure a fresh start
cleanup

# Level 1: Viewing Environment Variables
echo "-----------------------------------------------"
echo "Level 1: Viewing Environment Variables"
echo "-----------------------------------------------"
echo ""
echo "Use the 'printenv' command to view all the environment variables currently set on your system."
echo ""

read -p "Enter the command to list all environment variables: " env_command
echo ""

# Verify the command to view environment variables
# The correct command is:
# printenv or env
if [[ "$env_command" == *"printenv"* || "$env_command" == *"env"* ]]; then
    eval $env_command
    echo "Well done! You've listed the environment variables. Proceed to the next level."
    echo ""
    sleep 3
    clear
else
    echo "Incorrect Command. Try again."
    cleanup
    exit 1
fi

# Level 2: Creating and Exporting an Environment Variable
echo "-----------------------------------------------"
echo "Level 2: Creating and Exporting an Environment Variable"
echo "-----------------------------------------------"
echo ""
echo "Create a new environment variable 'MY_VAR' and export it with the value 'Hazardous'."
echo ""

read -p "Enter the command to create and export 'MY_VAR': " export_command
echo ""

# Verify the command to export the environment variable
# The correct command is:
# export MY_VAR="Hazardous"
if [[ "$export_command" == *"export MY_VAR=\"Hazardous\""* ]]; then
    eval $export_command
    echo "Great! You've successfully exported the variable. Proceed to the next level."
    echo ""
    sleep 3
    clear
else
    echo "Incorrect Command. Try again."
    cleanup
    exit 1
fi

# Level 3: Using Environment Variables in a Command
echo "-----------------------------------------------"
echo "Level 3: Using Environment Variables in a Command"
echo "-----------------------------------------------"
echo ""
echo "Use 'echo' to display the value of 'MY_VAR' that you just created."
echo ""

read -p "Enter the command to display the value of 'MY_VAR': " echo_command
echo ""

# Verify the echo command to display the environment variable
# The correct command is:
# echo $MY_VAR
if [[ "$echo_command" == *"echo \$MY_VAR"* ]]; then
    eval $echo_command
    echo "Excellent! You've successfully displayed the value of the environment variable. Proceed to the next level."
    echo ""
    sleep 3
    clear
else
    echo "Incorrect Command. Try again."
    cleanup
    exit 1
fi

# Level 4: Unsetting an Environment Variable
echo "-----------------------------------------------"
echo "Level 4: Unsetting an Environment Variable"
echo "-----------------------------------------------"
echo ""
echo "Use 'unset' to remove the 'MY_VAR' environment variable from the environment."
echo ""

read -p "Enter the command to unset 'MY_VAR': " unset_command
echo ""

# Verify the unset command to remove the environment variable
# The correct command is:
# unset MY_VAR
if [[ "$unset_command" == *"unset MY_VAR"* ]]; then
    eval $unset_command
    echo "Great! You've successfully removed the environment variable. Proceed to the final level."
    echo ""
    sleep 3
    clear
else
    echo "The command didn't work correctly. Try again."
    cleanup
    exit 1
fi

# Level 5: Persisting Environment Variables in a Shell Script
echo "-----------------------------------------------"
echo "Level 5: Persisting Environment Variables in a Shell Script"
echo "-----------------------------------------------"
echo ""
echo "Create a shell script named 'hazard_script.sh' that sets and uses an environment variable."
echo "The script should export a variable 'MY_SCRIPT_VAR' with the value 'Persistent' and display it using 'echo'."
echo ""

read -p "Enter the commands to create and run the script: " script_command
echo ""

# Verify the shell script creation and execution
# A correct set of commands are (there are a few ways to do this):
# vim hazard_script.sh && chmod +x hazard_script.sh
# this will pull up the vim editor which should contain the following:
#   #!/bin/bash
#   export MY_SCRIPT_VAR="Persistent"
#   echo $MY_SCRIPT_VAR
# save and exit the editor, the script, if named correctly, will run automatically
if [[ "$script_command" == *"hazard_script.sh"* ]]; then
    eval $script_command
    ./hazard_script.sh
    script_output=$(./hazard_script.sh)
    if [[ "$script_output" == *"Persistent"* ]]; then
        echo "Amazing! You've successfully created and run the shell script with an environment variable. Mission complete!"
        echo ""
        sleep 3
        clear
    else
        echo "The script didn't execute correctly. Try again."
        cleanup
        exit 1
    fi
else
    echo "The command didn't work correctly. Try again."
    cleanup
    exit 1
fi

# End of script
echo ""
echo "Congratulations! You've successfully completed 'Mission: The Environmental Hazard'."
cleanup
