#!/usr/bin/bash

YES(){
    yes "
    y"
}
YES | sudo pacman -Syy

YES | sudo pacman -S neovim

# setfont
# use command setfont to set font
# My arch default fonts in /usr/share/kbd/consolefonts
# setfont font_name

# install Graphics driver
# we can use commat inquire graphics information
# lspci -k | grep -A 2 -E "(VGA|3D)"
# my graphics is GTX 1660TI,so we will install "nvidia"
YES | sudo pacman -S nvidia

# install X.Org
YES | pacman -S xorg xorg-xinit xorg-server
# pacman -S xorg-xinit
# pacman -S server

# install pkgfile command
# YES | pacman -S pkgfile

# install firefox and Chinese package
# YES | sudo pacman -S firefox firefox-i18n-zh-cn


# install dwm
cd dwm
sudo make clean install
cd ..

# install acpi to inquire power information
YES | pacman -S acpi

# install st
cd st
sudo make clean install
cd ..


# let terminal use Chinese
# in .xinitrc add set

echo -e "export LANG=zh_CN.utf-8" >> ~/.xinitrc
echo -e "export LANGUAGE=zh_CN:en_US" >> ~/.xinitrc

echo "# 分辨率" >> ~/.xinitrc
echo -e "xrandr --newmode \"1920x1080_60\" 173.00 1920 2048 2248 2576 1080 1083 1088 1120 -hsync +vsync" >> ~/.xinitrc
echo -e "xrandr --addmode Virtual-1 \"1920x1080_60\"" >> ~/.xinitrc
echo -e "xrandr --output Virtual-1 --mode \"1920x1080_60\"" >> ~/.xinitrc


# install Chinese font
# YES | sudo pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji
# download path is /usr/share/fonts
# maybe no need this command and I think this command is invalid  `sudo setfonts wqy_microhei.ttc`

# install unzip
# YES | sudo pacman -S unzip

# install git
# YES | sudo pacman -S git

# install v2ray
YES | sudo pacman -S v2ray
git clone https://aur.archlinux.org/v2raya-bin.git
cd v2raya-bin
makepkg -si
systemctl enable --now v2raya.service
cd ..

# install Shell
# fish
# yes | pacman -S fish
# modify default shell
# chsh -s /usr/bin/fish
# cancel welcome
# set -U fish_greeting ""
# install oh-my-fish
# curl -L https://git.oh-my.fish

# install fcitx5
# pacman -S fcitx5-im
# pacman -S fcitx5-chinese-addons
YES | sudo pacman -S fcitx5-im fcitx5-chinese-addons
# write this word in .xinitrc

echo -en "\n\n\n\n" >> ~/.xinitrc
echo "# fcitx5" >> ~/.xinitrc
echo "export GTK_IM_MODULE=fictx5" >> ~/.xinitrc
echo "export QT_IM_MODULE=fcitx5" >> ~/.xinitrc
echo "export XMODIFIERS=@im=fcitx5" >> ~/.xinitrc
echo "fcitx5 &" >> ~/.xinitrc


# install compton
YES | sudo pacman -S compton

# Editor ~/.config/compton/compton.conf
# 其他窗口不透明度,较高时壁纸更清晰,
echo -en "
inactive-opacity = 0.95;
# 当前聚焦窗口
active-opacity = 0.85;

opacity-rule = [
#xprop
\"79:name *?= 'nvim'&&focused\",
#nvim被使用
\"49:name *?= 'nvim'&&!focused\",
#nvim未被使用
\"99:class_g = 'firefox'&&focused\",
\"99:class_g = 'firefox'&&!focused\",
]

fading = true;
fade-delta = 15;
fade-in-step = 0.05;
fade-out-step = 0.05;
fade-exclude = [ ];" > ~/.config/compton/compton.conf


echo -en "\n\n" >> ~/.xinitrc
echo "# compton" >> ~/.xinitrc
echo "compton -b &" >> ~/.xinitrc

# install mplayer
YES |sudo pacman -S mplayer

# install wallpaper player xwinwrap
git clone https://aur.archlinux.org/xwinwrap-git.git
cd xwinwrap-git
# need cp wxinwrap source code
# sudo make clean install
# use AUR install
# git clone AUR
# makepkg -si
# Modify .xinitrc add this word
	# xwinwrap -fs -nf -ov -- mpv -wid WID --fps=59 --no-audio --loop --no-osc --no-osd-bar --input-vo-keyboard=no --really-quiet ~/wallpaper/bg.mp4 &
echo -en "\n\n\n\n"
echo "# xwinwrap" >> ~/.xinitrc
echo "xwinwrap -fs -nf -ov -- mplayer -af volume=-200 -fps 24 -shuffle -loop 0 -wid WID -nolirc ~/wallpaper/bg.mp4 &" >> ~/.xinitrc
echo "exec dwm " >> ~/.xinitrc
cd ..

# modify nvim theme
# Editor ~/.config/nvim/init.vim
# get file by copy
# install vim-plug
# download plug.vim copy to ~/.config/nvim/autoload
# copy init.vim


# install coc depend
YES | sudo pacman -S nodejs npm 
# use nvim command
# install Coc-plug manager

# CocInstall coc-marketolace
# CocInstall coc-clangd
# CocInstall coc-sh

# install coc-python depend
YES | pacman S python-pylint jedi-language-server
# CocInstall coc-python
# if write python file have errer,please try update coc coc-plug vim-plug


# install stranstion
YES | sudo pacman -S translate-shell
