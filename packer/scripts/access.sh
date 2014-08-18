#!/bin/bash
#
# Configure access to the box: Add SSH public keys
# and set up password-less sudo for the vagrant user.
#

user=${SUDO_USER}

# Fetch and add the SSH pubkeys
mkdir -p /home/${user}/.ssh
curl -s https://gist.githubusercontent.com/saelo/69be57851f2335b082b2/raw/pubkeys > /home/${user}/.ssh/authorized_keys

# Set correct permissions
chown -R ${user}:${user} /home/${user}/.ssh
chmod 700 /home/${user}/.ssh
chmod 600 /home/${user}/.ssh/authorized_keys

# Set up password-less sudo
echo "${user} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/90_vagrant
chmod 440 /etc/sudoers.d/90_vagrant

# vagrant prefers no tty
echo "Defaults !requiretty" >> /etc/sudoers
