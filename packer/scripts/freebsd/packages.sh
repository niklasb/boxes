#!/bin/sh

# Upgrade packages
pkg update
pkg upgrade -y 

# Install some commonly needed packages
pkg install -y vim git curl zsh tree

# Install VirtualBox guest additions
pkg install -y virtualbox-ose-additions

cat << EOF >> /etc/rc.conf

# Virtualbox
vboxguest_enable=YES
vboxservice_enable=YES
EOF
