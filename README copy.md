# Shell Shocked: Command Line Games
This repository contains a series of command-line challenges designed to help users master essential command-line tools and techniques. The challenges are grouped into 7 Missions, each containing multiple levels, and a set of Bonus Challenges that are more advanced.

Each mission focuses on different aspects of the command line, ranging from process management to environment variables, network monitoring, and more.

***note: this repo is designed to only work on MacOS currently***

## Table of Contents
1. [Setup Instructions](#setup)
2. [Missions Overview](#missions)
3. [Bonus Challenges](#bonus)
4. [How to Run Challenges](#howto)
5. [Navigating and Using the Codebase](#navigate)

## Setup Instructions <a name="setup"></a>
#### 1. Cloning the Repository
First, clone the repository to your local machine:

`git clone https://github.com/your-repo-url.git`
`cd your-repo-directory`

#### 2. Setting Executable Permissions
Before running any of the challenges, you'll need to set executable permissions for the scripts.

From the root of the repository, run the following command to make all mission and bonus challenge scripts executable:

`chmod -R +x ./**`

This command ensures that all .sh files inside the missions and bonus_challenges folders are executable.

## Missions Overview <a name="missions"></a>
Each mission is located in its own folder under the missions directory. Each folder contains a series of challenge levels that you can run sequentially. The missions are designed to teach key command-line concepts through hands-on tasks.

**Mission List:**

#### Mission: The Vault

Learn about file permissions and ownership.
Folder: the_vault

#### Mission: File Investigator

Focuses on file management techniques like moving, copying, and removing files.
Folder: file_investigator

#### Mission: Process Terminator

Teaches how to monitor and manage system processes.
Folder: process_terminator

#### Mission: The Historian

Explore command history and log file analysis.
Folder: the_historian

#### Mission: Data Miner

Focuses on data extraction and processing using commands like grep, cut, and sort.
Folder: data_miner


#### Mission: The Environmental Hazard

Learn to manage environment variables and work with them in scripts.
Folder: environmental_hazard


## Bonus Challenges <a name="bonus"></a>
The Bonus Challenges are located in the bonus_challenges directory. These tasks are more advanced and focus on practical command-line usage like file archiving, password generation, and network monitoring.

**Bonus Challenges List:**
Find the Biggest File in a Directory
Generate a Random Password
Check Disk Space Usage
Create a Compressed Archive of a Directory
Find and Display Files Modified in the Last 24 Hours

*You can find these in bonus_challenges/.*

## How to Run Challenges <a name="howto"></a>
##### 1. Running a Mission Challenge
To run a mission, navigate to the mission’s folder and execute the main script:

`cd the_vault`
`./the_vault.sh`

Each mission script will guide you through a series of levels. Complete each level by entering the correct commands as instructed by the script.

##### 2. Running a Bonus Challenge 
To run a bonus challenge, navigate to the bonus_challenges folder and execute the script for the desired challenge:

`cd bonus_challenges`
`./disk_space.sh`

Each bonus challenge is self-contained, and instructions will appear as the challenge starts.

## Navigating and Using the Codebase <a name="navigate"></a>
Each folder contains its respective mission or bonus challenge, named clearly for ease of navigation.

You can directly run any script by following the instructions in the How to Run Challenges section.

Be sure to follow the terminal’s output carefully. Each challenge provides instructions for the commands you need to use to complete it.

*Notes:
Feel free to modify and extend the challenges if you'd like to create your own levels or additional bonus rounds.
If you encounter any issues with permissions or running scripts, double-check that the executable bit is set with chmod +x.*

**Enjoy the learning process and good luck with the challenges!**