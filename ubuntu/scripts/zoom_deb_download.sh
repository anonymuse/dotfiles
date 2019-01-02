#!/bin/bash

# Summary:
# This script is designed to download the NordVPN repository
# and install it

DEB_URL="https://zoom.us/client/latest/zoom_amd64.deb"
DEB_TEMP_FILE="$(mktemp)"
wget -O "$DEB_TEMP_FILE" "$DEB_URL" &&
ls $DEB_TEMP_FILE
sudo dpkg --skip-same-version -i "$DEB_TEMP_FILE" &&
rm -f "$DEB_TEMP_FILE" &&
