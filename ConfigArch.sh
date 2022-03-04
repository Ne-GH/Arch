#!/usr/bin/bash

YES(){
    yes ""
}
YES | sudo pacman -Syy

YES | sudo pacman -S neovim

# YES | sudo pacman -S nvidia

YES | pacman -S xorg xorg-xinit xorg-server



# install dwm
cd dwm
sudo make clean install
cd ..

# install st
cd st
sudo make clean install
cd ..

# install compton
YES | sudo pacman -S compton

echo  "export LANG=zh_CN.utf-8" >> ~/.xinitrc
echo  "export LANGUAGE=zh_CN:en_US" >> ~/.xinitrc
echo "# 分辨率" >> ~/.xinitrc
echo -e "xrandr --newmode \"1920x1080_60\" 173.00 1920 2048 2248 2576 1080 1083 1088 1120 -hsync +vsync" >> ~/.xinitrc
echo -e "xrandr --addmode Virtual-1 \"1920x1080_60\"" >> ~/.xinitrc
echo -e "xrandr --output Virtual-1 --mode \"1920x1080_60\"" >> ~/.xinitrc

echo "exec dwm" >> ~/.xinitrc
