#!/bin/bash
#
# Installs the checksec.sh script. See http://www.trapkit.de/tools/checksec.html.
#
# To be run as regular user.

set -e

sudo wget -q -O /usr/bin/checksec http://www.trapkit.de/tools/checksec.sh
sudo chmod 755 /usr/bin/checksec
