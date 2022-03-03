END(){
    umount /mnt/boot/efi
    ummount /mnt
    reboot

}

DISK(){
    ONE="1"
    TWO="2"
    THREE="3"
    DEVSTR="/dev/"
    EFIDISKSIZE="+128M"
    
    lsblk
    echo -en "Please input your disk number (such as : sda)"
    read DISK
    DEVDISK="$DEVSTR$DISK"
    echo $DISK
    echo $DEVDISK
    echo -en "o\nn\n\n\n\n$EFIDISKSIZE\nn\n\n\n\n\nw\n" | sudo fdisk $DEVDISK

    yes | mkfs.fat -F 32 "$DEVDISK$ONE"
    yes | mkfs.ext4 "$DEVDISK$TWO"

    mkdir -p /mnt/boot/efi
    mount "$DEVDISK$TWO" /mnt
    mount "$DEVDISK$ONE" /mnt/boot/efi
}
ChrootFront(){
    DISK

    yes | pacman -S archlinux-keyring
    echo -en "\n\n\n\n\n\n\n\n\n\n\n" | pacstrap -i /mnt base base-devel linux linux-firmware

    genfstab -U -p /mnt > /mnt/etc/fstab
    
    arch-chroot /mnt

    echo "Chroot done...."
    END
}
ChrootBehind(){
	echo "LANG=en_US.UTF-8" > /etc/locale.conf
	echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
	echo "zh_CN.UTF-8 UTF-8" >> /etc/locale.gen
	echo "zh_CN.GBK GBK" >> /etc/locale.gen
    echo "zh_CN GB2312" >> /etc/locale.gen
    locale-gen
    
    
    
    rm -f /etc/localtime
    ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
    hwclock --systohc --localtime
    
    # hostname
    echo Arch > /etc/hostname
    
    
    # rootpass
    echo "archroot" | passwd
   
    # BIOS/RBM
    yes | pacman -Sy os-prober ntfs-3g
    yes | pacman -Sy grub
    grub-install --target=i386-pc $DEVDISK
    grub-mkconfig -o /boot/grub/grub.cfg
    
    # EFI/GPT
    yes | pacman -S grub efibootmgr
    grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub
    grub-mkconfig -o /boot/grub/grub.cfg
    
    exit
    
}
STARTINSTALL(){

    if[ $# -lt 3 ] ; then
        ChrootBehind
    else
        ChrootBehind
    fi

}


NOSTART(){
    echo "Bye"
}


Main(){
    echo -en "I always install arch,but i haven't more time,so write this bash.\nThis bash will think your install system desk is /dev/sdb2,if you shuld modify this,please modify this bash file.If you read all tips ,Please confirm to continue.[Y/N]"
    read ConfirmStart
    case "$ConfirmStart" in
        Y|y|YES|Yes|yes)
            STARTINSTALL ;;
        *)
            NOSTART ;;
    esac
}
Main
