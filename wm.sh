#!/bin/sh

echo -e "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ installing i3 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
sleep 0.8
pacman_install xorg sddm i3-gaps i3status picom virtualbox-guest-utils 
sudo systemctl enable sddm

echo -e "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ installing yay ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
sleep 0.8
aur_clone yay ./temp

cd ./temp
makepkg -sir --noconfirm

cd ..
rm -rf ./temp

echo -e "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ installing fonts ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
sleep 0.8
pacman_install gnu-free-fonts ttf-ubuntu-font-family ttf-font-awesome
yay_install powerline-fonts

echo -e "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ installing dmenu ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
sleep 0.8
yay_install dmenu-height
