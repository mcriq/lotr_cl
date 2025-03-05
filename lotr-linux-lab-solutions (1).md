# The Quest for the One Ring - Solutions Guide

This guide provides solutions for all challenges in "The Quest for the One Ring" Linux command line adventure. It includes the commands students should use, explanations of how they work, and the correct answers for each checkpoint script.

## QUEST PART 1: BAG END

### Finding Bilbo's Hidden Message
```bash
# Navigate to Bag End (if not already there)
cd ~/middle_earth/shire/bag_end/

# List all files, including hidden ones
ls -a

# Read Bilbo's hidden message
cat .bilbo_message
```
**Explanation:** The `ls -a` command shows all files, including hidden ones that start with a dot. The hidden message reveals that Bilbo has left the Ring in a secret drawer and provides the password "mushrooms".

### Finding the One Ring
```bash
# Look for hidden directories in Bag End
ls -la

# Navigate to the secret drawer
cd .secret_drawer

# Check if the Ring is there
ls -l

# Read the Ring to confirm it's the right item
cat the_one_ring

# Create journey directory if it doesn't exist yet
mkdir -p ~/my_journey

# Copy the Ring to your journey directory
mv the_one_ring ~/my_journey/
```
**Explanation:** These commands allow students to find the hidden .secret_drawer directory, navigate to it, find the Ring file, and copy it to their my_journey directory which is necessary to carry it throughout the quest.

### Starting the Journey to Rivendell
```bash
# Make the journey script executable
chmod +x journey_to_rivendell.sh

# Run the script
./journey_to_rivendell.sh
```
**Answer to provide:** When prompted for the password, enter: `mushrooms`

**Outcome:** The script will verify that you have the Ring in your journey directory and create the Rivendell location with all its files and directories.

## QUEST PART 2: RIVENDELL

### Attending the Council Meeting
```bash
# Navigate to Rivendell
cd ~/middle_earth/rivendell/

# Navigate to the council chamber
cd council/

# Count council members
ls | wc -l
```
**Explanation:** The `ls | wc -l` command pipes the listing of files to the word count command with the lines option, counting the number of council members (files).

### Researching the Ring's History
```bash
# Return to main Rivendell directory
cd ..

# Find the largest file
ls -lS

# Read the ancient scroll
cat ancient_scroll

# Search for mentions of Moria
grep -i "moria" ancient_scroll
```
**Explanation:** The `ls -lS` command lists files sorted by size (largest first). The `grep` command searches for a specific string in a file, with `-i` making it case-insensitive.

### Continuing to Moria
```bash
# Make the journey script executable
chmod +x journey_to_moria.sh

# Run the script
./journey_to_moria.sh
```
**Answers to provide:**
- Council members count: `10`
- Member who knows about Moria: `gandalf`

**Outcome:** The script will verify that you still have the Ring and create the Moria location with all its files and directories.

## QUEST PART 3: THE MINES OF MORIA

### Entering the Sealed Doors
```bash
# Navigate to Moria
cd ~/middle_earth/moria/

# List files to find the entrance script
ls

# Make the entrance script executable
chmod +x speak_friend.sh

# Run the script
./speak_friend.sh
```
**Answer to provide:** When prompted for the password, enter: `mellon`

**Explanation:** The `chmod +x` command adds executable permission to the file.

### Navigating the Dark Tunnels
```bash
# Create a light script
echo '#!/bin/bash' > light.sh
echo 'echo "Let there be light!"' >> light.sh

# Make it executable
chmod +x light.sh

# Test the script
./light.sh

# Search the tunnels
cd tunnels/
ls
cd north/
ls -a
cat .scribbled_note
```
**Explanation:** These commands create a shell script with the required output, make it executable, and then explore the tunnels to find the hidden note.

### Escaping from Moria
```bash
# Navigate to the darkest chamber
cd ../south/darkest_chamber/

# Run the escape script
chmod +x escape_moria.sh
./escape_moria.sh
```
**Outcome:** If the light script was created correctly and you still have the Ring in your journey directory, this will generate the Lothlórien location.

## QUEST PART 4: LOTHLÓRIEN

### Meeting with Lady Galadriel
```bash
# Navigate to Lothlórien
cd ~/middle_earth/lothlorien/

# Check permissions on the mirror
ls -l mirror_of_galadriel.txt

# Change permissions to make it readable
chmod 644 mirror_of_galadriel.txt

# Read the mirror
cat mirror_of_galadriel.txt
```
**Explanation:** The `chmod 644` command sets read and write permissions for the owner and read-only for others. Any permission that makes the file readable (e.g., `chmod +r`) would work.

### Counting Mallorn Trees
```bash
# Navigate to the forest
cd forest/

# Count mallorn trees
ls *.mallorn | wc -l
```
**Explanation:** This command counts all files ending with `.mallorn` by listing them and piping to the word count command.

### Continuing to Mordor
```bash
# Return to Lothlórien main directory
cd ..

# Run the journey script
chmod +x journey_to_mordor.sh
./journey_to_mordor.sh
```
**Answer to provide:**
- Number of mallorn trees: `10`

**Outcome:** The script will verify you still have the Ring and create the Mordor location with all its files and directories.

## QUEST PART 5: MORDOR

### Infiltrating the Black Land
```bash
# Navigate to Mordor
cd ~/middle_earth/mordor/

# Read Sauron's plans
cat sauron_plans

# Make the distraction script executable
chmod +x distraction.sh

# Run the distraction script
./distraction.sh
```
**Explanation:** These commands let students read Sauron's battle plans and create a distraction.

### Finding the Path to Mount Doom
```bash
# Search for mentions of where to destroy the Ring
grep -i "chamber of fire" sauron_plans
```
**Explanation:** The `grep` command searches for the phrase "chamber of fire" which reveals where the Ring must be destroyed.

### Journeying to Mount Doom
```bash
# Run the journey script
chmod +x journey_to_mount_doom.sh
./journey_to_mount_doom.sh
```
**Answer to provide:**
- Where to destroy the Ring: `chamber of fire`

**Outcome:** The script will verify you still have the Ring and create the Mount Doom location with all its files.

## QUEST PART 6: MOUNT DOOM

### Entering Mount Doom
```bash
# Navigate to Mount Doom
cd ~/middle_earth/mordor/mount_doom/

# Find the chamber of fire
ls
cd chamber_of_fire/
```
**Explanation:** These commands navigate to the chamber of fire where the Ring must be destroyed.

### Destroying the Ring
```bash
# Create the destroy script
echo '#!/bin/bash' > destroy_ring.sh
echo 'rm ~/my_journey/the_one_ring' >> destroy_ring.sh

# Make it executable
chmod +x destroy_ring.sh

# Complete the quest
chmod +x complete_the_quest.sh
./complete_the_quest.sh
```
**Explanation:** These commands create a script that removes the Ring file from the journey directory, make it executable, and run the completion script to verify the solution.

**Outcome:** If successful, the script will generate a victory certificate in the Shire and display a victory message.

## IMPORTANT NOTES FOR INSTRUCTORS

1. **Verifying Ring Possession**
   - All checkpoint scripts verify that students have the Ring in their journey directory
   - If they delete or lose the Ring, they'll be unable to progress

2. **Potential Student Errors**
   - Students might forget to copy the Ring to their journey directory
   - They might accidentally delete the Ring file during their journey
   - Some might try to recreate the Ring if they lose it (creative problem-solving!)

3. **Alternative Solutions**
   - The destroy_ring.sh script could also use `find ~/my_journey -name "the_one_ring" -delete`
   - Students might use absolute or relative paths in their scripts
   - All are valid solutions as long as they remove the Ring from the journey directory

4. **Troubleshooting Common Issues**
   - If a student can't proceed, check if they still have the Ring in their journey directory
   - Make sure they're typing the exact answers expected by the checkpoint scripts
   - Verify that all scripts have the correct permissions