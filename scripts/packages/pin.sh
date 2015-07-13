#!/bin/bash
#
# Installs pintool.
#
# To be run as regular user.

set -e

FILENAME="pin-2.14-71313-gcc.4.4.7-linux.tar.gz"
URL="http://software.intel.com/sites/landingpage/pintool/downloads/${FILENAME}"

cd ~
mkdir pintool

wget -q $URL
tar -xz -C pintool --strip-components=1 -f ${FILENAME}
rm ${FILENAME}
