#!/bin/bash

echo "are you using a .deb (ubuntu flavors), .rpm (fedora flavors), or arch (pacman)"
echo "(1)|deb"
echo "(2)|fedora"
echo "(3)|arch"
read os
if [[ $os == "1" ]]; then
echo "debian"
else
    if [[ $os == "2" ]]; then
    echo "fedora"
    else
    echo "arch"
    fi
fi
