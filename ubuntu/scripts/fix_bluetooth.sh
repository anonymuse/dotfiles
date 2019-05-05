#!/bin/bash

# Based on experiences with Bluetooth mice, it appears that a small fix is
# required in order to pair devices reliably.
# Reference: https://ericasberry.com/blog/2016/09/30/pairing-a-logitech-mx-master-mouse-with-ubuntu-16-04-using-bluetooth/
# https://stackoverflow.com/questions/22062037/hcitool-lescan-shows-i-o-error/23059924
# This may be deprecated in later version of Ubuntu

sudo hciconfig hci0 sspmode 1
sudo hciconfig hci0 down
sudo hciconfig hci0 up

# Can use additional CLI commands to check for the MAC address of the mouse with
# '$ hcitool lescan' after which you can add it with 'gatttool'. You may need
# to run the hciconfig up and down to get 'hcitool' to work in some cases.
# Can additionally restart bluetooth services with 'service bluetooth restart'
# and 'service dbus restart'.
# Another utility that can be used is 'bluetoothctl' in an interactive session.
