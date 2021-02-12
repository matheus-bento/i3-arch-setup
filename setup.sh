#!/bin/bash
echo "strting arch setup script"
sleep 0.8

#region methods

pacman_install() {
    PROGRAMS=$@
    sudo pacman -S --noconfirm $PROGRAMS
}

pacman_uninstall() {
    PROGRAMS=$@
    sudo pacman -R --noconfirm $PROGRAMS
}

yay_install() {
    PROGRAMS=$@
    yay -S --noconfirm $PROGRAMS
}

#endregion

#region installations

echo "\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ installing i3 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n"
sleep 0.8
pacman_install xorg sddm i3-gaps i3status dmenu picom virtualbox-guest-utils
sudo systemctl enable sddm

echo "\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ installing konsole ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n"
sleep 0.8
pacman_install konsole

echo "\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ installing zsh ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n"
sleep 0.8
pacman_install zsh

echo "\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ installing oh-my-zsh ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n"
sleep 0.8
bash -c "RUNZSH='no';$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ installing yay ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n"
sleep 0.8
git clone https://aur.archlinux.org/yay ./temp

cd ./temp
makepkg -sir --noconfirm

cd ..
rm -rf ./temp

echo "\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ installing neovim ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n"
sleep 0.8
pacman_uninstall vim

pacman_install neovim
yay_install neovim-symlinks

echo "\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ installing neofetch ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n"
sleep 0.8
pacman_install neofetch

echo "\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ installing picom ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n"
sleep 0.8
pacman_install picom

echo "\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ installing feh ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n"
sleep 0.8
pacman_install feh

#endregion

sudo localectl set-keymap br-abnt2
sudo timedatectl set-timezone America/Sao_Paulo

echo "\n\n~~~~~~~~~~~~~~~~~~~~ setting 1920x1080 resolution on xorg ~~~~~~~~~~~~~~~~~~~~~~\n\n"
sleep 0.8
sudo cp ./xorg/10-monitor.conf /etc/X11/xorg.conf.d

echo "\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ applying dotfiles ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n"
sleep 0.8
cp -a ./dotfiles/. ~

echo "\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~ creating xdg user dirs ~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n"
sleep 0.8
pacman_install xdg-user-dirs
xdg-user-dirs-update

echo "\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ copying wallpaper ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n"
sleep 0.8
cp -r ./resources ~/Pictures

echo "done!!!"