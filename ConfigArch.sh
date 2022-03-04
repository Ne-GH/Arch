#!/usr/bin/bash


yes | sudo pacman -Syu
# setfont
# use command setfont to set font
# My arch default fonts in /usr/share/kbd/consolefonts
# setfont font_name

# install Graphics driver
# we can use commat inquire graphics information
# lspci -k | grep -A 2 -E "(VGA|3D)"
# my graphics is GTX 1660TI,so we will install "nvidia"
yes | sudo pacman -S nvidia

# install X.Org
yes | pacman -S xorg xorg-xinit xorg-server
# pacman -S xorg-xinit
# pacman -S server

# install pkgfile command
yes | pacman -S pkgfile

# install firefox and Chinese package
yes | sudo pacman -S firefox firefox-i18n-zh-cn


# install dwm
# should copy dwm source code
sudo make clean install
# install acpi to inquire power information
yes | pacman -S acpi

# install st
# should copy st source st
sudo make clean install

# let terminal use Chinese
# in .xinitrc add set

echo "# 分辨率"
echo -en "xrandr --newmode \"1920x1080_60\" 173.00 1920 2048 2248 2576 1080 1083 1088 1120 -hsync +vsync"
echo -en "xrandr --addmode Virtual-1 \"1920x1080_60\""
echo -en "xrandr --output Virtual-1 --mode \"1920x1080_60\""

# echo -en "export LANG=zh_CN.utf-8" >> .xinitrc
# echo -en "export LANGUAGE=zh_CN:en_US" >> .xinitrc

# install Chinese font
yes | sudo pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji
# download path is /usr/share/fonts
# maybe no need this command and I think this command is invalid  `sudo setfonts wqy_microhei.ttc`

# install unzip
yes | sudo pacman -S unzip

# install git
yes | sudo pacman -S git

# install v2ray
yes | sudo pacman -S v2ray
# install v2raya
# in AUR Wiki inquire v2raya URL
git clone https://aur.archlinux.org/v2raya-bin/git
# in this folder
makepkg -si
# run v2raya
systemctl enable --now v2raya.service


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
yes | sudo pacman -S fcitx5-im fcitx5-chinese-addons
# write this word in .xinitrc

echo -en "\n\n\n\n"
echo "# fcitx5"
echo "export GTK_IM_MODULE=fictx5"
echo "export QT_IM_MODULE=fcitx5"
echo "export XMODIFIERS=@im=fcitx5"
echo "fcitx5 &"
# modify fcitx5 fonts size
# .config/fcitx5/conf/classicui.conf 
# modify -> font="fontname fontsize"

# install fcitx5 theme
# pacman -S fcitx5-nord
# download file in /usr/share/fcitx5/themes/
# fcitx5-configtool

# install compton
yes | sudo pacman -S compton

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


echo -en "\n\n"

echo "# compton"
echo "compton -b &"

# install mplayer
yes |sudo pacman -S mplayer

# install wallpaper player xwinwrap
git clone https://aur.archlinux.org/xwinwrap-git.git
# need cp wxinwrap source code
# sudo make clean install
# use AUR install
# git clone AUR
# makepkg -si
# Modify .xinitrc add this word
	# xwinwrap -fs -nf -ov -- mpv -wid WID --fps=59 --no-audio --loop --no-osc --no-osd-bar --input-vo-keyboard=no --really-quiet ~/wallpaper/bg.mp4 &
echo -en "\n\n\n\n"
echo "# xwinwrap"
echo "xwinwrap -fs -nf -ov -- mplayer -af volume=-200 -fps 24 -shuffle -loop 0 -wid WID -nolirc ~/wallpaper/bg.mp4 &"

# modify nvim theme
# Editor ~/.config/nvim/init.vim
# get file by copy
# install vim-plug
# download plug.vim copy to ~/.config/nvim/autoload
# copy init.vim


# install coc depend
yes | sudo pacman -S nodejs npm 
# use nvim command
# install Coc-plug manager

# CocInstall coc-marketolace
# CocInstall coc-clangd
# CocInstall coc-sh

# install coc-python depend
yes | pacman S python-pylint jedi-language-server
CocInstall coc-python
# if write python file have errer,please try update coc coc-plug vim-plug


# install stranstion
yes | sudo pacman -S translate-shell
