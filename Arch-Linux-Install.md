------ BASE INSTALL

$ sudo su
$ mount /dev/sda3 /mnt
$ mount /dev/sda2 /mnt/boot
$ pacstrap -i /mnt base

or

$ pacstrap -i /mnt base base-devel

Generate an fstab

$ genfstab -U /mnt > /mnt/etc/fstab

Change root into the new system

$ arch-chroot /mnt /bin/bash

Computer Name
for example: archiso

$ echo archiso > /etc/hostname

Settings Language
Choose your language
for example: Traditional Chinese

$ sed -i '$a zh_TW.UTF-8 UTF-8' /etc/locale.gen
$ sed -i '$a zh_TW.BIG5' /etc/locale.gen
$ locale-gen
$ echo LANG=zh_TW.UTF-8 > /etc/locale.conf
$ export LANG=zh_TW.UTF-8

Select a time zone

$ tzselect

or

$ ln -sf /usr/share/zoneinfo/Asia/Taipei /etc/localtime
$ hwclock --systohc --localtime

or

$ ln -sf /usr/share/zoneinfo/UTC /etc/localtime
$ hwclock --systohc --utc

Install Boot loader
BIOS

$ pacman -S grub os-prober
$ grub-install --recheck /dev/sda      // BIOS/MBR

or

$ grub-install --force /dev/sda        // BIOS/GPT
$ grub-mkconfig -o /boot/grub/grub.cfg

 
UEFI

$ pacman -S grub efibootmgr os-prober
$ grub-install --target=x86_64-efi --efi-directory=/boot/EFI --bootloader-id=arch --recheck
$ grub-mkconfig -o /boot/grub/grub.cfg

Install Linux-firmware

$ cd /tmp
$ wget https://github.com/Mint-Fans/linux-package/raw/arch/aic94xx-firmware-30-9-any.pkg.tar.xz
$ wget https://github.com/Mint-Fans/linux-package/raw/arch/wd719x-firmware-1-1-any.pkg.tar.xz
$ pacman -U aic94xx-firmware-30-9-any.pkg.tar.xz
$ pacman -U wd719x-firmware-1-1-any.pkg.tar.xz

Network configuration
Wired

$ pacman -S networkmanager
$ systemctl enable NetworkManager.service
$ systemctl enable dhcpcd@interface.service  //Wired Automatic connection

Set the root password

$ passwd

 
Update Initramfs

$ mkinitcpio -p linux

------ Create User accounts

$ pacman -S sudo
$ sed -i '/NOPASSWD/a %wheel ALL=(ALL) NOPASSWD: ALL' /etc/sudoers
$ sed -i '/%sudo/a %sudo ALL=(ALL) NOPASSWD: ALL' /etc/sudoers
$ groupadd sudo

for example: User Name is arch

$ useradd -m -g users -s /bin/bash arch
$ passwd arch
$ gpasswd -a arch sudo
$ gpasswd -a arch wheel

 
------ Xorg Base Install

$ pacman -S xorg xorg-server-utils xorg-xinit

------ Driver Install

$ pacman -S alsa-utils               // Audio
$ pacman -S ntfs-3g                  // NTFS File System Support
$ pacman -S gvfs                     // Partition Mount Tools
$ pacman -S blueman                  // bluetooth
$ systemctl enable bluetooth.service // Enable bluetooth
$ pacman -Sy hwinfo

------ Desktop Environment

$ pacman -S xfdesktop xfce4-panel xfwm4 xfconf xfce4-settings xfce4-session xfce4-appfinder xfce4-screenshooter xfce4-power-manager xfce4-dict xfce4-notifyd xfce4-taskmanager xfce4-terminal

$ pacman -S xfce4-datetime-plugin xfce4-weather-plugin xfce4-xkb-plugin xfce4-cpufreq-plugin xfce4-eyes-plugin xfce4-mailwatch-plugin xfce4-systemload-plugin xfce4-timer-plugin xfce4-time-out-plugin xfce4-verve-plugin xfce4-whiskermenu-plugin xfce4-xkb-plugin

$ pacman -S thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman tumbler ffmpegthumbnailer

$ pacman -S xdg-user-dirs xdg-user-dirs-gtk

$ pacman -S network-manager-applet

 
Audio

$ pacman -S pulseaudio-alsa pulseaudio pavucontrol

 
Audio tray

$ cd /tmp
$ wget https://github.com/Mint-Fans/linux-package/raw/arch/xfce4-volumed-pulse-0.2.0-5-x86_64.pkg.tar.xz
$ wget https://github.com/Mint-Fans/linux-package/raw/arch/pa-applet-git-17.33b413b-1-x86_64.pkg.tar.xz
$ pacman -U pa-applet-git-17.33b413b-1-x86_64.pkg.tar.xz
$ pacman -U xfce4-volumed-pulse-0.2.0-5-x86_64.pkg.tar.xz

 
------ Other installation

$ pacman -S cpio

NetTools

$ pacman -S git subversion wget

Live CD Tools

$ pacman -S arch-install-scripts
$ pacman -S archiso
$ pacman -S cdrtools
$ ln -s /usr/bin/genisoimage /usr/bin/mkisofs

Aircrack-ng (Optional)

$ pacman -S aircrack-ng
$ pacman -S reaver

Themes & Icons

$ cd /tmp
$ wget https://github.com/Mint-Fans/linux-package/raw/arch/mint-x-theme-1.4.6-2-any.pkg.tar.xz
$ wget https://github.com/Mint-Fans/linux-package/raw/arch/mint-x-icons-1.3.3-1-any.pkg.tar.xz
$ pacman -U mint-x-theme-1.4.6-2-any.pkg.tar.xz
$ pacman -U mint-x-icons-1.3.3-1-any.pkg.tar.xz

------ Font installation
base font

$ pacman -S wqy-microhei ttf-dejavu ttf-droid cantarell-fonts

------ Application installation
Firefox

$ pacman -S firefox

language pack for Firefox
https://www.archlinu...ainer=&flagged=

$ pacman -S firefox-i18n-zh-tw
$ pacman -S flashplugin  $ FlashPlayer

$ pacman -S leafpad
$ pacman -S gparted
$ pacman -S file-roller
$ pacman -S simple-scan
$ pacman -S system-config-printer
$ pacman -S gucharmap
$ pacman -S gnome-calculator
$ pacman -S pidgin
$ pacman -S thunderbird
$ pacman -S transmission-gtk
$ pacman -S evince
$ pacman -S gnome-font-viewer
$ pacman -S catfish
$ pacman -S banshee
$ pacman -S ristretto
$ pacman -S gthumb

Video Player

$ pacman -S vlc    $ VLC
$ pacman -S parole $ XFCE Parole

codes
gstreamer 1.0

$ pacman -S gst-plugins-bad
$ pacman -S gst-plugins-good
$ pacman -S gst-plugins-ugly
$ pacman -S gst-libav

gstreamer 0.1

$ pacman -S gstreamer0.10-bad-plugins
$ pacman -S gstreamer0.10-good-plugins
$ pacman -S gstreamer0.10-ugly-plugins
$ pacman -S gstreamer0.10-ffmpeg

DVDTools

$ pacman -S libdvdread
$ pacman -S libdvdnav
$ pacman -S libdvdcss

Arch Linux Update Manager

$ cd /tmp
$ wget https://github.com/Mint-Fans/linux-package/raw/arch/pamac-aur-3.0.1-1-any.pkg.tar.xz
$ pacman -U pamac-aur-3.0.1-1-any.pkg.tar.xz

------ Input Method (Optional)
for example: fcitx

$ pacman -S fcitx-im fcitx-chewing fcitx-configtool

$ echo export GTK_IM_MODULE=fcitx > /etc/profile.d/fcitx.sh
$ sed -i '$a export QT_IM_MODULE=fcitx' /etc/profile.d/fcitx.sh
$ sed -i '$a export XMODIFIERS="@im=fcitx"' /etc/profile.d/fcitx.sh

------ Display Manager (Optional)
for example: lightdm User Name is arch
base

$ pacman -S lightdm-gtk-greeter

Settings editor (Optional)

$ pacman -S lightdm-gtk-greeter-settings

Automatic startup

$ systemctl enable lightdm.service

 
Setting the screen backlight brightness and gamma

$ echo xbacklight -set 80 > /etc/lightdm/display_setup.sh
$ sed -i '$a xgamma -gamma 0.7' /etc/lightdm/display_setup.sh
$ sudo chmod +x /etc/lightdm/display_setup.sh

 
 Autologin

$ sudo leafpad /mnt/etc/lightdm/lightdm.conf

[SeatDefaults]
pam-service=lightdm-autologin
autologin-user=arch
autologin-user-timeout=0
session-wrapper=/etc/lightdm/Xsession
display-setup-script=/etc/lightdm/display_setup.sh

$ groupadd autologin
$ gpasswd -a arch autologin

$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
Mint Applications for Arch Linux
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
Mint XFCE System Adjustments

$ cd /tmp
$ wget https://github.com/Mint-Fans/linux-package/raw/arch/arch-system-adjustments-1.0-0-any.pkg.tar.xz
$ wget https://github.com/Mint-Fans/linux-package/raw/arch/mint-artwork-xfce-1.0-0-any.pkg.tar.xz
$ wget https://github.com/Mint-Fans/linux-package/raw/arch/mint-firefox-adjustments-1.0-0-any.pkg.tar.xz
$ pacman -U arch-system-adjustments-1.0-0-any.pkg.tar.xz
$ pacman -U mint-artwork-xfce-1.0-0-any.pkg.tar.xz
$ pacman -U mint-firefox-adjustments-1.0-0-any.pkg.tar.xz

mintstick (Optional)

$ wget https://github.com/Mint-Fans/linux-package/raw/arch/python2-pyparted-3.10.7-1-x86_64.pkg.tar.xz
$ wget https://github.com/Mint-Fans/linux-package/raw/arch/mintstick-git-r153.198e14a-1-x86_64.pkg.tar.xz
$ pacman -U python2-pyparted-3.10.7-1-x86_64.pkg.tar.xz
$ pacman -U mintstick-git-r153.198e14a-1-x86_64.pkg.tar.xz

 
Plymouth Themes (Optional)

$ wget https://github.com/Mint-Fans/linux-package/raw/arch/plymouth-0.9.2-8-x86_64.pkg.tar.xz
$ pacman -U plymouth-0.9.2-8-x86_64.pkg.tar.xz

 
mint-logo-aqua (Optional)
BxGhBSM.png

$ wget https://github.com/Mint-Fans/linux-package/raw/arch/mint-logo-aqua-1.0-0-any.pkg.tar.xz
$ pacman -U mint-logo-aqua-1.0-0-any.pkg.tar.xz

mint-logo-maya (Optional)
VVOnHdT.png

$ wget https://github.com/Mint-Fans/linux-package/raw/arch/mint-logo-maya-1.0-0-any.pkg.tar.xz
$ pacman -U mint-logo-maya-1.0-0-any.pkg.tar.xz

xplayer (Optional)

$ wget https://github.com/Mint-Fans/linux-package/raw/arch/xplayer-1.0.2-0-x86_64.pkg.tar.xz
$ pacman -U xplayer-1.0.2-0-x86_64.pkg.tar.xz

xplayer-plugins (Optional)

$ wget https://github.com/Mint-Fans/linux-package/raw/arch/xplayer-plugins-1.0.2-0-x86_64.pkg.tar.xz
$ pacman -U xplayer-plugins-1.0.2-0-x86_64.pkg.tar.xz

xplayer-plugins-extra (Optional)

$ wget https://github.com/Mint-Fans/linux-package/raw/arch/xplayer-plugins-extra-1.0.2-0-x86_64.pkg.tar.xz
$ pacman -U xplayer-plugins-extra-1.0.2-0-x86_64.pkg.tar.xz

xplayer-mozilla (Optional)

$ wget https://github.com/Mint-Fans/linux-package/raw/arch/xplayer-mozilla-1.0.2-0-x86_64.pkg.tar.xz
$ pacman -U xplayer-mozilla-1.0.2-0-x86_64.pkg.tar.xz

$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

Exit from the chroot

$ exit


-------- applications settings

$ sed -i '$a NoDisplay=true' /usr/share/applications/bssh.desktop
$ sed -i '$a NoDisplay=true' /usr/share/applications/bvnc.desktop
$ sed -i '$a NoDisplay=true' /usr/share/applications/avahi-discover.desktop
$ sed -i '$a NoDisplay=true' /usr/share/applications/fcitx.desktop

$ sed -i -e '/allow_active/s/auth_admin/yes/' /usr/share/polkit-1/actions/org.xfce.thunar.policy
$ sed -i -e '/allow_active/s/auth_admin_keep/yes/' /usr/share/polkit-1/actions/org.freedesktop.udisks2.policy
$ sed -i -e '/allow_active/s/auth_admin/yes/' /usr/share/polkit-1/actions/org.archlinux.pkexec.gparted.policy

-------- clear temp file

$ rm -r /mnt/var/cache/pacman/pkg
$ rm -rf /mnt/var/cache/fontconfig/*
$ rm -rf /mnt/var/log/*

unmount mnt

$ umount /mnt/boot
$ umount /mnt

Exit from the root

$ exit

 
B5nuert.png
