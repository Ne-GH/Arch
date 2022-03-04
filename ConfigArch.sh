#!/usr/bin/bash

YES(){
    yes ""
}
YES | sudo pacman -Syy

YES | sudo pacman -S neovim

# YES | sudo pacman -S nvidia

YES | pacman -S xorg xorg-xinit xorg-server

echo  "export LANG=zh_CN.utf-8" >> ~/.xinitrc
echo  "export LANGUAGE=zh_CN:en_US" >> ~/.xinitrc

# install dwm
cd dwm
sudo make clean install
cd ..

# install st
cd st
sudo make clean install
cd ..
