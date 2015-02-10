#!/bin/bash
#
# Configure access to the box: Add SSH pubkey, remove password
# and set up password-less sudo.
#

user=${SUDO_USER:-$1}
pubkey=${USER_PUBKEY:-$2}
if [[ "$user" == "" || "$pubkey" == "" ]]; then
    echo "user or pubkey not set"
    exit 1
fi

if getent passwd $user &>/dev/null; then
    echo "user already exists."
    exit 1
fi

groupadd $user
useradd $user -m -g $user

cd /home/$user
mkdir -p .ssh
echo "$pubkey" > .ssh/authorized_keys

chmod 700 .ssh
chmod 600 .ssh/*
chown -R $user:$user .ssh

passwd -d $user

sudoers='/etc/sudoers'
if [ -e /usr/local/etc/sudoers ]; then
    # We're probably on FreeBSD
    sudoers='/usr/local/etc/sudoers'
fi
echo "$user ALL=(ALL) NOPASSWD:ALL" >> $sudoers
