#!/bin/sh
codename=$(lsb_release --codename --short)
echo "deb http://packages.santoku-linux.com/ubuntu $codename main" |sudo tee /etc/apt/sources.list.d/santoku.list
wget http://packages.santoku-linux.com/santoku.key -q -O - |sudo apt-key add -
sudo apt-get update
sudo apt-get install -y santoku
