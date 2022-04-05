#!bin/bash

# 关闭笔记本自带键盘
xinput disable "AT Translated Set 2 keyboard"   
while true
do
    bash ./dwm-upstart.sh
    ./Up.out
    sleep 0.05s
done
