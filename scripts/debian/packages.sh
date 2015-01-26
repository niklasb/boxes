#!/bin/bash

echo "Performing system upgrade..."
apt-get -y update
apt-get -y upgrade
apt-get -y dist-upgrade

echo "Installing miscellaneous packages..."
apt-get -y install htop vim git curl zsh build-essential tree gdb

if [ -f /var/run/reboot-required ]; then
    echo "Reboot required!"
fi
