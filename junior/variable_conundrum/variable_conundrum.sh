#!/bin/bash


# Cleanup function to reset the environment
cleanup() {
    rm -rf rabbit_hole
    rm -rf rabbit_hole2
}

# Introduction
echo ""
echo "************** Mission: The Variable Conundrum **************"
echo "The system is unstable, and only by mastering variables can you restore balance!"
echo ""
echo "Welcome to the Galactic Command Interface. The Central AI is malfunctioning, and our data archives are scattered across the Void of Space."
echo ""
echo "Your mission is to retrieve, manipulate, and secure crucial system variables to regain control." 
echo "If you fail, the ship may be lost forever in a black hole of entropy!"
echo ""
echo "Each challenge will test your ability to set, use, and manipulate Bash variables to restore stability. Good luck, Cadet!"

# Perform cleanup at the beginning of the script to ensure a fresh start
cleanup

echo "-----------------------------------------------"
echo "Challenge 1: Identifying Yourself in the System"
echo "-----------------------------------------------"
echo ""
echo "Permission required. Who are you in the Galactic Command Interface?"
echo ""
echo "Assign a variable called callsign with your designation and display it."
echo ""

read -p "assign your call sign 'CaptainNova' to a variable 'callsign' to set a variable. Press Enter when ready: " set_var
eval $set_var

echo ""
# The correct command is:
# callsign="CaptainNova"
if [[ "$set_var" == "callsign=\"CaptainNova\"" ]]; then
    echo "Callsign confirmed. Welcome Captain Nova! You may now access inventory information and send/receive transmissions."
    echo ""
    sleep 3
    clear
else
    echo "Callsign not recognized. Try again."
    cleanup
    exit 1
fi

echo "-----------------------------------------------"
echo "Challenge 2: Send a Transmission"
echo "-----------------------------------------------"
echo ""
echo "Establish contact with frieght ship in deep space."
echo ""
echo "Create a variable 'transmission' with the value 'Requesting manifest. Establishing handshake.'"

read -p "Set a variable. Press Enter when ready: " msg_var
eval $msg_var
# The correct command is:
# transmission="Requesting manifest. Establishing handshake."
if [[ "$msg_var" == "transmission=\"Requesting manifest. Establishing handshake.\"" ]]; then
    echo "Frieght class ship MB21-X3 reporting in. Handshake establish. Sending inventory information..."
    echo ""
    sleep 3
    clear
else
    echo "Unable to contact ship. Try again."
    cleanup
    exit 1
fi

echo "-----------------------------------------------"
echo "Level 3: Formatting the Galactic Output"
echo "-----------------------------------------------"
echo ""
echo "The system responds, but it's an unreadable stream of data. Structure the message properly!"
echo ""
echo "Use curly braces {} to correctly display the variable in a mission report."
echo ""


# Setup the challenge
incoming_transmission="

- 1000 crates of mouthwash (Bulk order, but likely a typo)
- An entire shipment of left socks 🧦 (where do the right ones go? Black hole?)
- A single, unwrapped mint 🍬 (cargo manifest says 'priceless artifact')
- 2,000 gallons of quantum coffee ☕ (always simultaneously hot and cold)
- Schrödinger’s Crate 📦 (contents are both missing and present at the same time)
- A jar labeled 'DO NOT OPEN' 🫙 (no one remembers what’s inside, but it keeps vibrating)
- Galactic Emperor’s Emotional Support Goldfish 🐠 (last seen floating around the bridge)
- An entire zoo of invisible creatures 🦠 (manifest says they’re in there somewhere)
- A black hole in a shoebox 🌌 (marked 'Return to Sender')
- A shipment of 'totally safe' experimental clones 🧬 (they're not safe)

"
read -p "Read the variable 'incoming_transmission' inside the sentince 'Incoming Transmission: '. Press Enter when ready: " format_var
eval $format_var

echo ""
# The correct command is:
# echo "Incoming Transmission: ${incoming_transmission}"

if [[ "$format_var" == 'echo "Incoming Transmission: ${incoming_transmission}"' ]]; then
    echo "Transmission recieved. Reconciling inventory..."
    echo ""
    sleep 5
    clear
else
    echo "Transmission lost. Try again."
    cleanup
    exit 1
fi

echo "-----------------------------------------------"
echo "Level 4: The Universal Access Key"
echo "-----------------------------------------------"
echo ""
echo "Some variables need to persist across all systems. Secure the command network!"
echo ""
echo "Set and export a variable called ACCESS_CODE with value '42-Alpha' so it is available system-wide."

read -p "Use 'export' to make a variable available globally. Press Enter when ready: " export_var
eval $export_var
echo ""
# The correct command is:
# export ACCESS_CODE="42-Alpha"
if [[ "$export_var" == 'export ACCESS_CODE="42-Alpha"' ]]; then
    echo "Command network secured. Access granted to entire fleet. I hope you know what you are doing..."
    echo ""
    sleep 3
    clear
else
    echo "Command not configured correctly. Try again."
    cleanup
    exit 1
fi

echo "-----------------------------------------------"
echo "Level 5: Cloaking Your Passphrase"
echo "-----------------------------------------------"
echo ""
echo "The AI requests an authorization passphrase. Enter it without exposing it to prying eyes!"
echo ""
echo "Use read to get user input into a variable called passcode without displaying it on screen."
echo ""

read -p "Use 'read' with an option to hide input. Press Enter when ready: " hidden_read
eval $hidden_read

echo ""
# The correct command is:
# read -s passcode
if [[ "$hidden_read" == "read -s passcode" ]]; then
    echo "System Stabilized!"
    echo ""
    sleep 3
    clear
else
    echo "System insecure. Try again."
    cleanup
    exit 1
fi

# End of script
echo ""
echo "Congratulations, Cadet! You've successfully retrieved lost system data, secured mission-critical variables, and stabilized the Galactic Command Interface."
cd ..
cleanup

