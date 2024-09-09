#!/bin/bash

# This script enables "Single Click to Open Files" in KDE

# Path to KDE configuration file
KDE_CONFIG="$HOME/.config/kdeglobals"

# Create a backup of the current configuration
cp "$KDE_CONFIG" "$KDE_CONFIG.bak"

# Use sed to modify or add the setting for "Single Click"
if grep -q "SingleClick=" "$KDE_CONFIG"; then
    # If the setting already exists, modify it
    sed -i 's/SingleClick=.*/SingleClick=true/' "$KDE_CONFIG"
else
    # If the setting doesn't exist, add it under the "[KDE]" section
    echo "[KDE]" >> "$KDE_CONFIG"
    echo "SingleClick=true" >> "$KDE_CONFIG"
fi

# Restarting Plasma shell to apply the changes
kquitapp5 plasmashell && kstart5 plasmashell

echo "Single Click to open files is now enabled in KDE."
