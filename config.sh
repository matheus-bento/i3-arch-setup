#!/bin/sh

echo -e "\n~~~~~~~~~~~~~~~~~~~~ setting 1920x1080 resolution on xorg ~~~~~~~~~~~~~~~~~~~~~~\n"
sleep 0.8
sudo cp ./xorg/10-monitor.conf /etc/X11/xorg.conf.d

echo -e "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ applying dotfiles ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
sleep 0.8
cp -a ./dotfiles/. ~

mv ~/.oh-my-zsh ~/.config

echo -e "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~ creating xdg user dirs ~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
sleep 0.8
pacman_install xdg-user-dirs
xdg-user-dirs-update

echo -e "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ copying wallpaper ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
sleep 0.8
cp -a ./resources/. ~/Pictures/

echo -e "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ copying scripts ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
sleep 0.8
cp -r ./scripts/ ~
