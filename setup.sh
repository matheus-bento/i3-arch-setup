#!/bin/sh

echo "starting arch setup script"
sleep 0.8

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

aur_clone() {
    REPOSITORY=$1
    DESTINATION=$2

    if [ -z $DESTINATION ]; then
        git clone https://aur.archlinux.org/$REPOSITORY 
    else
        git clone https://aur.archlinux.org/$REPOSITORY $DESTINATION
    fi
}

github_clone() {
    REPOSITORY=$1
    DESTINATION=$2

    if [ -z $DESTINATION ]; then
        git clone https://github.com/$REPOSITORY 
    else
        git clone https://github.com/$REPOSITORY $DESTINATION
    fi
}

source ./wm.sh
source ./applications.sh
source ./config.sh

echo "done!!!"
