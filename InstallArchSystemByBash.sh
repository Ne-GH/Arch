ONE="1"
TWO="2"
THREE="3"
DISK="sda"
DEVSTR="/dev/"
DEVDISK="/dev/sda"
EFIDISKSIZE="+128M"
USERNAME="yongheng"
USERPASS="lan"
ROOTPASS="arch"
YES(){
	yes ""
}


ChrootFront(){

    # Update Time
    # timedatectl set-ntp true
    
    lsblk
    echo -en "Please input your disk number (such as : sda)"
    read DISK
    DEVDISK="$DEVSTR$DISK"

    echo -en "o\nn\n\n\n\n$EFIDISKSIZE\nn\n\n\n\n\nw\n" | fdisk $DEVDISK

    YES | mkfs.fat -F 32 "$DEVDISK$ONE"
    YES | mkfs.ext4 "$DEVDISK$TWO"

   
    mount "$DEVDISK$TWO" /mnt
    mkdir -p /mnt/boot/efi
    mount "$DEVDISK$ONE" /mnt/boot/efi

    YES | pacman -Sy archlinux-keyring
    echo -en "\n\n\n\n\n\n\n\n\n\n\n" | pacstrap -i /mnt base base-devel linux linux-firmware dhcpcd netctl dialog wpa_supplicant networkmanager
    genfstab -U -p /mnt > /mnt/etc/fstab
    
    cp install.sh /mnt
    arch-chroot /mnt bash install.sh ChrootBehind


    umount /mnt/boot/efi
    umount /mnt
    # reboot
}
ChrootBehind(){

    echo "LANG=en_US.UTF-8" > /etc/locale.conf
    echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
    echo "zh_CN.UTF-8 UTF-8" >> /etc/locale.gen
    echo "zh_CN.GBK GBK" >> /etc/locale.gen
    echo "zh_CN GB2312" >> /etc/locale.gen
    locale-gen
    

    
    # locale time
    rm -f /etc/localtime
    ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
    hwclock --systohc --localtime
    
    # hostname
    echo Arch > /etc/hostname
    
    
    # rootpass
    echo "root:$ROOTPASS" | chpasswd

    # enable dhcpcd
    # systemctl enbale dhcpcd
   
    # BIOS/RBM
    # YES | pacman -Sy grub
    # grub-install --target=i386-pc $DEVDISK
    # grub-mkconfig -o /boot/grub/grub.cfg
    
    # EFI/GPT
    YES | pacman -S grub efibootmgr
    grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=grub
    grub-mkconfig -o /boot/grub/grub.cfg

    useradd -m $USERNAME
    echo "$USERNAME:$USERPASS" | chpasswd
    echo "$USERNAME ALL=(ALL) ALL" >> /etc/sudoers
    exit
    
}
if [ $# -le 0 ] ; then
    ChrootFront
else
    ChrootBehind
fi

# Main(){
#
#
#
    # read ConfirmStart
    # case "$ConfirmStart" in
        # Y|y|YES|Yes|YES)
            # STARTINSTALL ;;
        # *)
            # NOSTART ;;
    # esac
# }
# Main
