PARTITIONS=ada0
DISTRIBUTIONS="base.txz kernel.txz lib32.txz ports.txz"

#!/bin/sh

user="vagrant"

echo 'nameserver 8.8.8.8' >> /etc/resolv.conf

cat >> /etc/rc.conf <<EOF
ifconfig_em0=DHCP
sshd_enable=YES
EOF

# Bootstrap pkg
env ASSUME_ALWAYS_YES=1 pkg bootstrap
pkg update
pkg install -y sudo bash curl

# Set up users
echo -n 'vagrant' | pw usermod root -h 0
echo -n 'vagrant' | pw useradd -n ${user} -s $(which bash) -m -h 0
echo "${user} ALL=(ALL) NOPASSWD:ALL" >> /usr/local/etc/sudoers

reboot
