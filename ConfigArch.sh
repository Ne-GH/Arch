#!/usr/bin/bash

YES(){
    yes ""
}
YES | sudo pacman -Syy

YES | sudo pacman -S neovim

# YES | sudo pacman -S nvidia

YES | pacman -S xorg xorg-xinit xorg-server
