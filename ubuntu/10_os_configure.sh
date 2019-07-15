#!/bin/sh
#
# Ubuntu customization script
# OS Configuration

# Set 9 workspaces
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ vsize 3
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ hsize 3


# Set the touchpad tracking speed. No way to accomplish through the GUI
# Will need to make sure you get the correct ID, it's 12 for Ubuntu 16.04
# You can check the ID with 'xinput --list --short'
# Get the current speed and property ID with 'xinput --list-props 12|grep Accel'
# TODO: extract the touchpad ID into a variable
# Set the acceleration of ID 12, property 218, to .75
xinput --set-prop 12 281 .75
