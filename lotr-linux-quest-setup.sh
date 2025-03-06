#!/bin/bash
# Lord of the Rings Quest - Initial Setup Script
# This script creates just the starting location (Bag End with the Ring)
# and the checkpoint scripts that will generate subsequent locations

# Art
echo "
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⣤⣤⡴⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢠⣄⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⡿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢈⣿⣇⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠘⣿⡏⠀⠀⣤⣶⣿⣿⣿⣿⣿⣿⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⢻⡇⠀⠀⠉⠉⠙⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⢸⣇⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⢸⣿⠀⠀⠀⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⣼⣿⣦⣤⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⣰⣾⣷⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀⠀⣀⠀⠀⠀⢿⣿⣿⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⢸⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⣿⡆⠀⠀⠈⣿⣿⣿⣿⣿⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⢸⣿⠸⠿⠛⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠹⣿⡀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠘⣿⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠸⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⣿⡄⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠈⢿⡟⠛⢻⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⢻⡇⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⢸⣇⠀⠈⣿⣿⣿⣿⣿⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⢸⡇⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡀⠀⠀⠀⣿⡀⠀⣿⣿⣿⣿⣿⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⡇⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠀⠀⠸⣧⠀⢻⣿⣿⣿⣿⣿⡙⠧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⣿⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠀⠀⢻⡆⢸⣿⣿⣿⠿⠿⢿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⣿⠀⠀⢼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⢿⡀⠹⣿⡇⠀⠀⠈⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⣤⣿⣿⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⣋⣤⣀⣼⣷⣤⣿⣿⣤⣤⣄⣼⣿⣧⣤⣤⣤⡀⠀⠀⠀⠀⠀⠀
⠀⢀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⡄⠀⠀⠀⠀
⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣄⠀⠀⠀
⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄
"

# Set the base directory for the quest
BASE_DIR=${1:-"$HOME/middle_earth"}
echo "Creating the starting point of your Middle Earth adventure in: $BASE_DIR"

# Create initial directory structure
mkdir -p $BASE_DIR/shire/bag_end/.secret_drawer

# Create quest master directory (hidden)
mkdir -p $BASE_DIR/.quest_master

# Create Bag End files
echo "Setting up Bag End in the Shire..."


# Visible files
cat > $BASE_DIR/shire/bag_end/pipe_weed << EOF
Finest pipe-weed from the Southfarthing. May it calm your nerves on your journey.
EOF

cat > $BASE_DIR/shire/bag_end/walking_stick << EOF
A sturdy walking stick for the long road ahead.
EOF

cat > $BASE_DIR/shire/bag_end/map_fragment << EOF
[Fragment of an old map showing the path to Rivendell]
Follow the road east from Bag End, cross the Brandywine Bridge,
then north through the Trollshaws. The Last Homely House lies in the valley.
EOF

# Create the One Ring in Bilbo's secret drawer
cat > $BASE_DIR/shire/bag_end/.secret_drawer/the_one_ring << EOF
The One Ring

Ash nazg durbatulûk, ash nazg gimbatul,
ash nazg thrakatulûk agh burzum-ishi krimpatul.

This simple golden band is the One Ring, forged by Sauron himself in the fires of Mount Doom.
Its power is immense, but it can only be destroyed in the same fire that created it.

You must carry this Ring to Mount Doom and cast it into the fires where it was made.
Be careful - the Ring tries to return to its master. You must keep it with you at all times.
EOF

# Bilbo's hidden message
cat > $BASE_DIR/shire/bag_end/.bilbo_message << EOF
My dear Fellowship member,

I have left the Ring behind in a secret drawer. You must find it before
setting out on your journey. The Enemy is searching for it even now.

Your task is to take the Ring to Rivendell where the Council of Elrond
will decide its fate. Be wary of the dangers ahead.

The Council awaits you, but only those who prove their worth may attend.
You must know the secret password to proceed: mushrooms

To continue your journey, you must:
1. Find the Ring in my secret drawer
2. Copy it to your my_journey directory to carry it with you
3. Run the journey_to_rivendell.sh script

Good luck on your quest!
- Bilbo Baggins
EOF

# Create the first checkpoint script
cat > $BASE_DIR/shire/bag_end/journey_to_rivendell.sh << 'EOF'
#!/bin/bash

BASE_DIR=$(dirname $(dirname $(dirname $(realpath $0))))
JOURNEY_DIR="$HOME/my_journey"
RING_FILE="$JOURNEY_DIR/the_one_ring"

echo "The road to Rivendell stretches before you..."

# Check if they have the Ring
echo "You check to make sure the ring is secure..."
if [ ! -f "$RING_FILE" ]; then
    echo "You cannot leave without the Ring! You must find it and copy it to your journey directory."
    echo "Hint: Look for Bilbo's secret drawer and copy the Ring to $JOURNEY_DIR/"
    exit 1
fi

echo -n "What is the secret password Bilbo provided? "
read password

if [ "$password" != "mushrooms" ]; then
    echo "That is not the correct password. The Council of Elrond remains closed to you."
    exit 1
fi

echo "Password accepted!"
echo "You carry the Ring safely to Rivendell...(navigate to the rivendell directory)"

# Create Rivendell
mkdir -p $BASE_DIR/rivendell/council

# Council members
for member in "aragorn" "boromir" "legolas" "gimli" "frodo" "sam" "merry" "pippin" "gandalf" "elrond"; do
    echo "Council member: $member present at the council" > $BASE_DIR/rivendell/council/$member
done

# Create the ancient scroll
cat > $BASE_DIR/rivendell/ancient_scroll << 'EOFINNER'
The History of the One Ring
===========================

Three Rings for the Elven-kings under the sky,
Seven for the Dwarf-lords in their halls of stone,
Nine for Mortal Men doomed to die,
One for the Dark Lord on his dark throne
In the Land of Mordor where the Shadows lie.
One Ring to rule them all, One Ring to find them,
One Ring to bring them all and in the darkness bind them
In the Land of Mordor where the Shadows lie.

The One Ring was forged by the Dark Lord Sauron during the Second Age 
to gain dominion over the free peoples of Middle-earth. It was taken 
from him by Isildur who cut it from Sauron's hand, but was later lost 
in the Gladden Fields when Isildur was ambushed and killed.

For many years the Ring passed out of all knowledge until it was found 
by the creature Gollum in the Misty Mountains. Then it was discovered 
by the Hobbit Bilbo Baggins, who passed it to his nephew Frodo.

The Ring must be destroyed in the fires of Mount Doom where it was made.
The path to Mount Doom lies through the Black Gate of Mordor, though
Gandalf speaks of another path - through the Mines of Moria.
EOFINNER

# Create additional scrolls with information
cat > $BASE_DIR/rivendell/elven_lore << 'EOFINNER'
The elves of Rivendell maintain that the Ring cannot be wielded by any
but Sauron himself. Its power is too great and will corrupt any who 
attempt to use it, even with the best intentions.

Elrond has studied the ancient texts and believes the Ring must be
taken to Mordor and cast into the fires of Mount Doom. Only there can
it be unmade.
EOFINNER

cat > $BASE_DIR/rivendell/map_of_middle_earth << 'EOFINNER'
[A detailed map of Middle Earth showing the paths from Rivendell]

The path to Mordor is long and dangerous. You must first pass through
the Mines of Moria, then through the forest of Lothlórien, across the
Anduin, and finally into Mordor itself.

Beware the spies of Sauron who watch all roads leading east.
EOFINNER

# Create the second checkpoint script
cat > $BASE_DIR/rivendell/journey_to_moria.sh << 'EOFINNER'
#!/bin/bash

BASE_DIR=$(dirname $(dirname $(realpath $0)))
JOURNEY_DIR="$HOME/my_journey"
RING_FILE="$JOURNEY_DIR/the_one_ring"

echo "The Fellowship gathers at the Council of Elrond..."

# Check if they still have the Ring
if [ ! -f "$RING_FILE" ]; then
    echo "The Ring is missing! You cannot proceed without it."
    echo "Did you accidentally delete it from your journey directory?"
    exit 1
fi

echo -n "How many members are in the council? "
read council_count

if [ "$council_count" != "10" ]; then
    echo "That is not the correct count. You have not properly surveyed the council."
    exit 1
fi

echo -n "Which council member knows about the path through Moria? "
read member_name

if [[ "$member_name" != "gandalf" && "$member_name" != "Gandalf" ]]; then
    echo "That is not correct. Study the ancient scroll more carefully."
    exit 1
fi

echo "The Fellowship decides to journey through the Mines of Moria!"
echo "You carefully guard the Ring as you travel..."
echo "You arrive at the entrance to Moria, but it is sealed...(navigate to the moria directory)"

# Create Moria
mkdir -p $BASE_DIR/moria/tunnels/{east,west,north,south}
mkdir -p $BASE_DIR/moria/tunnels/east/{chamber1,chamber2,chamber3}
mkdir -p $BASE_DIR/moria/tunnels/south/darkest_chamber

# Create entrance script
cat > $BASE_DIR/moria/speak_friend.sh << 'EOFDEEPER'
#!/bin/bash
echo "The gates of Moria are sealed with an ancient enchantment."
echo -n "Speak the password: "
read password

if [ "$password" = "mellon" ]; then
  echo "The doors slowly open... You enter the Mines of Moria."
  echo "You find a note that says: 'The orcs are coming. Look to the darkest chamber in the tunnels.'"
else
  echo "Nothing happens. The doors remain sealed."
fi
EOFDEEPER

chmod 644 $BASE_DIR/moria/speak_friend.sh

# Empty chambers (one will contain a clue)
touch $BASE_DIR/moria/tunnels/east/chamber1/.dust
touch $BASE_DIR/moria/tunnels/east/chamber3/.dust
touch $BASE_DIR/moria/tunnels/west/.cobwebs
echo "The shadows are deepest in the south tunnels. Something precious lies there." > $BASE_DIR/moria/tunnels/north/.scribbled_note

# Create the next checkpoint script
cat > $BASE_DIR/moria/tunnels/south/darkest_chamber/escape_moria.sh << 'EOFDEEPER'
#!/bin/bash

BASE_DIR=$(dirname $(dirname $(dirname $(dirname $(dirname $(realpath $0))))))
JOURNEY_DIR="$HOME/my_journey"
RING_FILE="$JOURNEY_DIR/the_one_ring"

echo "You've reached the darkest chamber of Moria..."
echo "But you hear the drums in the deep... the orcs are coming!"

# Check if they still have the Ring
if [ ! -f "$RING_FILE" ]; then
    echo "The Ring is missing! The quest has failed."
    echo "Did you lose it somewhere in the darkness of Moria?"
    exit 1
fi

light_script="$BASE_DIR/moria/light.sh"

if [ ! -f "$light_script" ]; then
    echo "You need to create a light script to see your way out!"
    exit 1
fi

if [ ! -x "$light_script" ]; then
    echo "Your light script isn't executable! Make it executable with chmod!"
    exit 1
fi

output=$($light_script)
if [[ "$output" != *"Ore kal"* ]]; then
    echo "Your light script doesn't produce enough light! It should output 'Ore kal!'"
    exit 1
fi

echo "Your light illuminates the path ahead!"
echo "You escape Moria with the Ring still in your possession..."
echo "Navigate to Lothlórien!"

# Create Lothlórien
mkdir -p $BASE_DIR/lothlorien/forest

# Create mirror of Galadriel with restrictive permissions
cat > $BASE_DIR/lothlorien/mirror_of_galadriel.txt << 'EOFLOTH'
As you gaze into the mirror, visions come to you...

You see a mountain of fire... Mount Doom in Mordor.
Within its chambers lies your destiny.

The path ahead is dark and guarded. Sauron's eye is ever watchful.
To enter Mordor, you must find a distraction to draw his gaze away.

The Ring grows heavier with each step toward Mordor. You must be strong.
EOFLOTH

chmod 0 $BASE_DIR/lothlorien/mirror_of_galadriel.txt

# Create lembas bread files
for i in {1..5}; do
  echo "Elvish waybread. A single bite can sustain a grown man for a day." > $BASE_DIR/lothlorien/lembas_bread_$i.lembas
done

# Create mallorn trees
for i in {1..576}; do
  echo "A majestic mallorn tree of Lothlórien." > $BASE_DIR/lothlorien/forest/mallorn_tree_$i.mallorn
done

# Create oak trees
for i in {1..10}; do
  echo "A mighty oak tree of Lothlórien." > $BASE_DIR/lothlorien/forest/oak_tree_$i.oak
done

# Create next checkpoint script
cat > $BASE_DIR/lothlorien/journey_to_mordor.sh << 'EOFLOTH'
#!/bin/bash

BASE_DIR=$(dirname $(dirname $(realpath $0)))
JOURNEY_DIR="$HOME/my_journey"
RING_FILE="$JOURNEY_DIR/the_one_ring"

echo "The Lady Galadriel offers you guidance..."

# Check if they still have the Ring
if [ ! -f "$RING_FILE" ]; then
    echo "The Ring is missing! Galadriel senses its absence."
    echo "The quest has failed. The Enemy will soon find it."
    exit 1
fi

# Check if they've read the mirror
if [ ! -r "$BASE_DIR/lothlorien/mirror_of_galadriel.txt" ]; then
    echo "You haven't yet read Galadriel's mirror. Change its permissions to continue."
    exit 1
fi

echo -n "How many mallorn trees grow in the forest of Lothlórien? "
read tree_count

if [ "$tree_count" != "576" ]; then
    echo "That is not the correct count. You must observe the forest more carefully."
    exit 1
fi

echo "The Fellowship continues their journey toward Mordor..."
echo "The Ring's burden grows heavier with each step..."
echo "Navigate to Mordor..."

# Create Mordor
mkdir -p $BASE_DIR/mordor/{black_gate,shelob_lair,tower}

# Create distraction script
cat > $BASE_DIR/mordor/distraction.sh << 'EOFMORDOR'
#!/bin/bash
echo "Creating a distraction for the Eye of Sauron..."
echo "The Eye turns toward the Black Gate, drawn by commotion."
echo "Now is your chance to hurry to Mount Doom while Sauron is distracted!"
echo ""
echo "The Ring grows even heavier as you near your destination."
EOFMORDOR

chmod 644 $BASE_DIR/mordor/distraction.sh

# Create Sauron's plans file
cat > $BASE_DIR/mordor/sauron_plans << 'EOFMORDOR'
[The Dark Lord's battle plans]

Armies of Mordor are to be deployed as follows:
- Reserve forces at the Black Gate to defend my tower
- Deploy main force to take Osgiliath and then Minas Tirith
- Nazgûl to search for the Ring throughout Middle Earth
- Spies and informants to watch all roads leading to Mordor
- Maybe make a backup ring?..... NAH!

The Ring-bearer must not reach Mount Doom.

Guard all paths to Mount Doom, especially toward the west where the
Ring could be destroyed in the "forge chamber".
EOFMORDOR

# Create other Mordor files
echo "The black speech of Mordor." > $BASE_DIR/mordor/black_speech
echo "Blueprints for the Dark Tower." > $BASE_DIR/mordor/tower_plans
echo "Schedule for orc patrols along the borders of Mordor." > $BASE_DIR/mordor/patrol_schedule

# Create the final checkpoint script
cat > $BASE_DIR/mordor/journey_to_mount_doom.sh << 'EOFMORDOR'
#!/bin/bash

BASE_DIR=$(dirname $(dirname $(realpath $0)))
JOURNEY_DIR="$HOME/my_journey"
RING_FILE="$JOURNEY_DIR/the_one_ring"

echo "You prepare to infiltrate Mount Doom..."

# Check if they still have the Ring
if [ ! -f "$RING_FILE" ]; then
    echo "The Ring is missing! The quest has failed at the final stage."
    echo "Sauron will soon reclaim his prize and all of Middle Earth will fall."
    exit 1
fi

distraction_script="$BASE_DIR/mordor/distraction.sh"

if [ ! -x "$distraction_script" ]; then
    echo "You haven't made the distraction script executable yet!"
    exit 1
fi

echo -n "According to Sauron's plans, where must you go to destroy the Ring? "
read ring_location

if [[ "$ring_location" != *"forge chamber"* && "$ring_location" != *"Forge Chamber"* ]]; then
    echo "That's not the correct location. You need to study Sauron's plans more carefully."
    exit 1
fi

echo "With the Eye of Sauron distracted, you make your way to Mount Doom..."
echo "The Ring grows unbearably heavy as you approach its birthplace..."
echo "Navigate to Mount Doom..."

# Create Mount Doom

# Create different paths with timestamps
mkdir -p $(date -v-3H +"%Y%m%d%H%M") $BASE_DIR/mordor/mount_doom/southern_path
mkdir -p $(date -v-2H +"%Y%m%d%H%M") $BASE_DIR/mordor/mount_doom/eastern_path
mkdir -p $(date -v-1H +"%Y%m%d%H%M") $BASE_DIR/mordor/mount_doom/western_path
mkdir -p $BASE_DIR/mordor/mount_doom/western_path/forge_chamber

# Create completion script
cat > $BASE_DIR/mordor/mount_doom/western_path/forge_chamber/complete_the_quest.sh << 'EOFDOOM'
#!/bin/bash

BASE_DIR=$(dirname $(dirname $(dirname $(dirname $(dirname $(realpath $0))))))
JOURNEY_DIR="$HOME/my_journey"
RING_FILE="$JOURNEY_DIR/the_one_ring"

echo "You stand at the Crack of Doom, where the Ring was forged..."

# Check if they still have the Ring
if [ ! -f "$RING_FILE" ]; then
    echo "The Ring is missing! After all this journey, you've lost it at the final moment!"
    echo "The quest has failed. Middle Earth is doomed."
    exit 1
fi

destroy_script="$BASE_DIR/mordor/mount_doom/western_path/forge_chamber/destroy_ring.sh"

if [ ! -f "$destroy_script" ]; then
    echo "You need to create a script called destroy_ring.sh to destroy the Ring!"
    exit 1
fi

if [ ! -x "$destroy_script" ]; then
    echo "Your destroy_ring.sh script isn't executable! Make it executable with chmod!"
    exit 1
fi

echo "The Ring resists... its power tries to overcome your will..."
echo "You must be strong to destroy it now!"

# Run the destroy script
$destroy_script

# Check if the ring still exists
if [ -f "$RING_FILE" ]; then
    echo "The Ring still exists! Your script didn't destroy it properly."
    echo "You must find a way to remove the file $RING_FILE"
    exit 1
fi

# Create victory certificate
mkdir -p $BASE_DIR/shire/bag_end/celebration
cat > $BASE_DIR/shire/bag_end/celebration/victory_certificate.txt << 'EOFCERT'
CERTIFICATE OF ACHIEVEMENT

This certifies that YOU have successfully completed
THE QUEST OF THE ONE RING

Through your mastery of Linux command line skills,
you navigated the perilous lands of Middle Earth,
carried the One Ring through many dangers,
and destroyed it in the fires of Mount Doom.

Middle Earth is forever in your debt.

"Even the smallest person can change the course of the future."
                                        - Lady Galadriel
EOFCERT

echo "=============================================================="
echo "                        VICTORY!                              "
echo "=============================================================="
echo ""
echo "The Ring has been destroyed in the fires of Mount Doom!"
echo "The Dark Lord is defeated and Middle Earth is saved!"
echo ""
echo "A victory celebration awaits you back in the Shire."
echo "Your certificate of achievement is waiting at:"
echo "$BASE_DIR/shire/bag_end/celebration/victory_certificate.txt"
echo ""
echo "Congratulations on completing your quest!"
echo "=============================================================="
echo "
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠇⢹⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡄⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢠⣤⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⣤⡄
⠘⢿⣍⠉⣙⠻⢶⣤⡀⠀⠀⠀⣠⡾⠃⠙⢦⡀⠀⠀⠀⣀⣤⠶⠛⡉⠉⣹⡿⠁
⠀⠈⢻⣆⢿⡷⢤⡈⠙⠳⣤⡼⠋⠀⣴⡆⠀⠻⣦⣴⠞⠋⣠⡴⢻⡇⣼⠋⠀⠀
⠀⠀⠀⢹⡎⣧⠀⠙⢶⣴⡟⠻⣦⣠⡿⣿⣠⡾⠛⢷⣤⠞⠁⢀⡿⣸⠃⠀⠀⠀
⠀⠀⠀⠀⢷⠘⣧⠀⠀⠙⢧⡀⠈⣻⠃⢹⡟⠁⢠⡞⠁⠀⠀⡼⢡⠏⠀⠀⠀⠀
⠀⠀⠀⠀⠘⡆⢘⣆⠀⠀⠀⠻⣄⣿⠀⠀⣷⣴⠋⠀⠀⠀⣼⠁⡼⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣷⣾⠛⢧⡀⠀⠀⢹⡇⠀⠀⣿⠃⠀⠀⢀⡼⠹⣧⡇⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣿⡏⠀⠈⢳⡄⠀⠘⡇⠀⠀⣽⠀⠀⣠⡟⠀⠀⢿⣇⠀⠀⠀⠀⠀
⠀⠀⠐⣶⣾⢿⡇⠀⠀⠀⠹⣆⣠⣿⡄⢠⣿⣄⣰⠏⠀⠀⠀⢸⠿⢶⣶⠀⠀⠀
⠀⠀⠀⠀⠀⠈⣇⠀⠀⠀⠀⣿⠋⠘⣿⡾⠁⠹⣇⠀⠀⠀⠀⣼⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢸⡄⠀⠀⣸⠃⠀⣠⠏⢳⣄⠀⢹⡆⠀⠀⣰⠇⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢻⡄⠀⣿⣴⣿⢿⠀⠀⡿⣿⣶⣷⠀⢠⠏⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢻⣄⠉⣸⠇⢸⠀⢠⡇⢻⡆⠉⣰⠏⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣶⡏⠀⢸⣧⣸⠃⠀⢿⡾⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⢷⣄⠀⣿⡟⠀⣠⡿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡇⠀⠻⣷⡈⣡⡾⠋⠀⢻⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⢈⣿⣿⡀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡇⠀⢀⡿⠁⠈⣷⠀⠀⣼⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⡀⢸⠃⠀⠀⢸⡆⢠⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢷⣸⡀⠀⠀⢸⣇⡞⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣧⡀⠀⣾⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣷⡾⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡟⢷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡇⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
"

exit 0
EOFDOOM

chmod +x $BASE_DIR/mordor/mount_doom/western_path/forge_chamber/complete_the_quest.sh
EOFMORDOR

chmod +x $BASE_DIR/mordor/journey_to_mount_doom.sh
EOFLOTH

chmod +x $BASE_DIR/lothlorien/journey_to_mordor.sh
EOFDEEPER

chmod +x $BASE_DIR/moria/tunnels/south/darkest_chamber/escape_moria.sh
EOFINNER

chmod +x $BASE_DIR/rivendell/journey_to_moria.sh
EOF

chmod +x $BASE_DIR/shire/bag_end/journey_to_rivendell.sh

echo "Initial setup complete! Your quest begins in Bag End."
echo "Navigate to $BASE_DIR/shire/bag_end/ to start your adventure."
echo ""
echo "Type the following command to begin:"
echo "cd $BASE_DIR/shire/bag_end/"
echo ""
echo "Find Bilbo's hidden message to start the quest."
