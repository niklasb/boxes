#!/bin/bash

echo "Upgrading packages..."

apt-get update
apt-get -y upgrade
apt-get -y dist-upgrade

if [ -f /var/run/reboot-required ]; then
    echo "Reboot required!"
fi
