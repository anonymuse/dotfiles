#!/bin/bash

# Summary:
# This script is designed to download the NordVPN repository
# and install it

DEB_URL="https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb" &&
DEB_TEMP_FILE="$(mktemp)"
wget -O "$DEB_TEMP_FILE" "$DEB_URL" &&
ls $DEB_TEMP_FILE
sudo dpkg --skip-same-version -i "$DEB_TEMP_FILE" &&
rm -f "$DEB_TEMP_FILE" &&
sudo apt-get update
