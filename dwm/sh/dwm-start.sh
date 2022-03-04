#!bin/bash

while true
do
    bash ./dwm-upstart.sh
    ./Up.out `date +"%d %H %M %S"`
    sleep 0.01s
done
