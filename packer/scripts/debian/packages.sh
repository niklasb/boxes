#!/bin/bash

echo "Performing system upgrade..."
apt-get update
apt-get -y upgrade
apt-get -y dist-upgrade

echo "Installing VirtualBox guest additions..."
apt-get -y install virtualbox-guest-dkms

echo "Installing miscellaneous packages..."
apt-get -y install htop vim git curl zsh build-essential tree cmake python-dev silversearcher-ag
