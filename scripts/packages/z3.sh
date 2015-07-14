#!/bin/bash
#
# Installs the z3 theorem prover.
#
# To be run as regular user
#

URL="https://github.com/Z3Prover/z3/archive/"

set -e

FILENAME="z3-4.4.0.tar.gz"
URL="https://github.com/Z3Prover/z3/archive/${FILENAME}"

cd ~
mkdir z3

wget -q $URL
tar -xz -C z3 --strip-components=1 -f ${FILENAME}
rm ${FILENAME}

cd z3

python scripts/mk_make.py
cd build
make -j2
sudo make install
