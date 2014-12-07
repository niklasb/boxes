#!/bin/sh

user=${SUDO_USER}
mirror="ftp://ftp.spline.de/pub/OpenBSD/5.6/packages/$(machine -a)/"

echo "export PKG_PATH=${mirror}" >> /home/${user}/.profile
export PKG_PATH=${mirror}

pkg_add bash git curl zsh tree
pkg_add -z vim-7.4-no_x11-perl-python3-ruby
