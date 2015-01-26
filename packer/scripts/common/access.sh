#!/bin/sh
#
# Configure access to the box: Add SSH pubkey, remove password
# and set up password-less sudo.
#

user=$SUDO_USER
pubkey=$USER_PUBKEY

cd /home/$user
mkdir -p .ssh
echo "$pubkey" > .ssh/authorized_keys

chmod 700 .ssh
chmod 600 .ssh/*

passwd -d $user

sudoers='/etc/sudoers'
if [ -e /usr/local/etc/sudoers ]; then
    # We're probably on FreeBSD
    sudoers='/usr/local/etc/sudoers'
fi
echo "$user ALL=(ALL) NOPASSWD:ALL" >> $sudoers
