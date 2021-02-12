#!/bin/bash
echo "\
                    _         \
     /\            | |        \
    /  \   _ __ ___| |__      \
   / /\ \ | '__/ __| '_ \     \
  / ____ \| | | (__| | | |    \
 /_/____\_\_| _\___|_| |_|    \
                              \
  / ____|    | |              \
 | (___   ___| |_ _   _ _ __  \
  \___ \ / _ \ __| | | | '_ \ \
  ____) |  __/ |_| |_| | |_) |\
 |_____/ \___|\__|\__,_| .__/ \
                       | |    \
                       |_|    \
"

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

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ installing i3 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
pacman_install xorg sddm i3-gaps i3status dmenu picom virtualbox-guest-utils
sudo systemctl enable sddm

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ installing konsole ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
pacman_install konsole

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ installing zsh ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
pacman_install zsh

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ installing oh-my-zsh ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
bash -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ installing yay ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
pacman_install git
git clone https://aur.archlinux.org/yay ./temp

cd ./temp

makepkg -sir --noconfirm

cd ..
rm -rf ./temp

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ installing neovim ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
pacman_uninstall vim

pacman_install neovim
yay_install neovim-symlinks

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ installing neofetch ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
pacman_install neofetch

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ installing picom ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
pacman_install picom

#endregion

echo "~~~~~~~~~~~~~~~~~~~~ setting 1920x1080 resolution on xorg ~~~~~~~~~~~~~~~~~~~~~~"
sudo cp ./xorg/10-monitor.conf /etc/X11/xorg.conf.d

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ applying dotfiles ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
rm ~/.zshrc
rm ~/.zsh_history

cp -a ./dotfiles/. ~

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~ creating xdg user dirs ~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
pacman_install xdg-user-dirs
xdg-user-dirs-update

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ copying wallpaper ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
cp ./resources ~/Pictures
