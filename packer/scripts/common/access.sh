#!/bin/sh
#
# Configure access to the box: Add SSH public keys
# and set up password-less sudo for the user.
#

user=${SUDO_USER}

# Fetch and add the SSH pubkeys
mkdir -p /home/${user}/.ssh
curl -s https://gist.githubusercontent.com/saelo/69be57851f2335b082b2/raw/pubkeys > /home/${user}/.ssh/authorized_keys

# Set correct permissions
chown -R ${user}:${user} /home/${user}/.ssh
chmod 700 /home/${user}/.ssh
chmod 600 /home/${user}/.ssh/authorized_keys

# Enable password-less sudo
sudoers='/etc/sudoers'
if [ -e /usr/local/etc/sudoers ]; then
    # We're probably on FreeBSD
    sudoers='/usr/local/etc/sudoers'
fi
echo "${user} ALL=(ALL) NOPASSWD:ALL" >> ${sudoers}
