#!/bin/bash

# Based on experiences with Bluetooth mice, it appears that a small fix is
# required in order to pair devices reliably.
# Reference: https://ericasberry.com/blog/2016/09/30/pairing-a-logitech-mx-master-mouse-with-ubuntu-16-04-using-bluetooth/
# This may be deprecated in later version of Ubuntu

sudo hciconfig hci0 sspmode 1
sudo ciconfig hci0 down
sudo hciconfig hci0 up
