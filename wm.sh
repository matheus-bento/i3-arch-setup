#!/bin/sh

echo -e "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ installing i3 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
sleep 0.8
pacman_install xorg xorg-xinit i3-gaps i3status picom virtualbox-guest-utils 

echo -e "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ installing fonts ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
sleep 0.8
pacman_install gnu-free-fonts ttf-ubuntu-font-family ttf-font-awesome
yay_install powerline-fonts

echo -e "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ installing dmenu ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
sleep 0.8
yay_install dmenu-height
