#!/bin/bash

echo "Upgrading packages..."

apt-get update
apt-get upgrade
apt-get dist-upgrade

if [ -f /var/run/reboot-required ]; then
    echo "Reboot required!"
fi
