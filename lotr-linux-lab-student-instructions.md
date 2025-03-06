# The Quest of the One Ring
## A Linux Command Line Adventure

*The fate of Middle Earth rests in your hands. Armed with only your terminal and command line skills, you must find the One Ring, carry it across Middle Earth, and destroy it in the fires of Mount Doom before the forces of darkness prevail.*

### Getting Started

1. Open a terminal window and navigate to the directory where you downloaded the quest setup script.
2. Run the shell script in your terminal `./lotr-linux-quest-setup.sh` 
   * If you get a `permisson denied` message, run the following command: `chmod +x lotr-linux-quest-setup.sh` and try executing it again.
   * If you're on a mac and get an `operation not permitted` message, run the following command: `xattr -d com.apple.quarantine lotr-linux-quest-setup.sh`
3. Navigate to Middle Earth: `cd ~/middle_earth`
4. Create a "my_journey" directory and a "journey_log.txt" using the following command: `mkdir -p ~/my_journey && touch ~/my_journey/journey_log.txt`

### How This Quest Works

This is a **progressive adventure** where each location must be unlocked by completing challenges:

1. You must find the Ring and carry it with you throughout your journey
2. Each location contains checkpoint scripts that will generate the next location
3. You must solve challenges and provide correct answers to proceed
4. If you try to skip ahead, you'll find the locations don't exist yet!
5. Document your commands and discoveries in your journey_log.txt (this is optional)
6. If you get stuck, try using the man page for the commands you're attempting to use, make a quick google search or ask a partner!

---

## QUEST PART 1: BAG END

Bilbo Baggins has disappeared, leaving behind only a mysterious message and the One Ring.

### Your Tasks:

1. **Find Bilbo's hidden message**
   * Hidden files in Linux start with a dot (.)
   * Use a command to show ALL files, including hidden ones
   * Read the hidden message

2. **Find the One Ring**
   * Look for hidden directories that might contain the Ring
   * When you find it, move it to your `my_journey` directory (`~/my_journey/`)

3. **Begin your journey to Rivendell**
   * Run the `journey_to_rivendell.sh` script (you might need to change permissions on the script!)
   * Enter the password when prompted
   * If successful, the script will generate the Rivendell location in the top level of the middle_earth directory and you can navigate to it!

---

## QUEST PART 2: RIVENDELL

You've arrived at the Last Homely House East of the Sea, with the Ring in your possession. The Council of Elrond will decide the fate of the Ring.

### Your Tasks:

1. **Attend the council meeting**
   * Count how many members are present in the council directory (try to use a command instead of manually counting!)

2. **Research the Ring's history**
   * Explore the files in Rivendell
   * Find the largest text file and read it
   * Determine which council member knows the next "path" to take on the journey to Mordor (since the text file is large it might be worth trying a command that searches the file for the word "path")

3. **Continue to Moria**
   * Run the `journey_to_moria.sh` script
   * Answer the questions based on what you've discovered
   * If successful, the script will grant you access to the Mines of Moria directory! (it will be adjacent to the other location directories)

---

## QUEST PART 3: THE MINES OF MORIA

You must brave the ancient dwarven mines of Moria, with the Ring growing heavier around your neck.

### Your Tasks:

1. **Enter the sealed doors**
   * Find a script at the entrance to Moria
   * Make it executable
   * Run the script and enter the password (hint: it's the elvish word for friend. If you don't know the elvish word for friend, ask a nerd or google it!)

2. **Navigate the dark tunnels**
   * Create a script called `light.sh` in the Moria directory
   * Make it output the exact text: "Ore kal!" (This means "mighty light" in Valarin. The language of Gandalf's wizard kind, the Ainur 🧙‍♂️)
   * Make your script executable
   * Search the tunnels for hidden notes that might give a clue as to where to find the darkest chamber (hint: look for a hidden file) or maybe find a shortcut with a powerful command?

3. **Escape from Moria**
   * Find the darkest chamber mentioned in the hidden note
   * Run the escape script in this chamber
   * If your light script works correctly, you'll be able to escape to Lothlórien!

---

## QUEST PART 4: THE GOLDEN WOOD

The elves of Lothlórien offer refuge and guidance for your quest. The Ring's burden grows heavier with each step.

### Your Tasks:

1. **Meet with Lady Galadriel**
   * Find Galadriel's mirror (a text file)
   * The mirror's permissions prevent you from reading it
   * Change the permissions so you can read it (hint: `chmod`)
   * Read Galadriel's vision

2. **Rest in the forest**
   * Count how many mallorn trees grow in the forest (hint: not all the trees in the forest are mallorns! You'll need to be crafty! All mallorn tree files end in ".mallorn")

3. **Continue to Mordor**
   * Run the `journey_to_mordor.sh` script
   * Answer the question about the mallorn trees
   * If successful, the script will generate Mordor!

---

## QUEST PART 5: MORDOR

You've reached Mordor, the domain of the enemy. The Ring grows unbearably heavy, yet you must proceed.

### Your Tasks:

1. **Infiltrate the Dark Land**
   * Find Sauron's plans file and read it for clues as to where specifically to destroy the ring
   * Lady Galadriel's vision mentioned a distraction. Perhaps there is a script that can help us?
   * Make it executable and run it

2. **Journey to Mount Doom**
   * Run the `journey_to_mount_doom.sh` script
   * Answer the question about where to destroy the Ring
   * If successful, you can continue to Mount Doom!

---

## QUEST PART 6: MOUNT DOOM

This is it! The final challenge to destroy the One Ring once and for all. The Ring resists, trying to prevent its destruction.

### Your Tasks:

1. **Climb the mountain**
   * Navigate to Mount Doom
   * Find the forge chamber and navigate to it

2. **Destroy the Ring**
   * Create a script called `destroy_ring.sh` that will delete the Ring file from your journey directory
   * Make it executable
   * Run the `complete_the_quest.sh` script to test your solution
   * If successful, Middle Earth will be saved!

---
