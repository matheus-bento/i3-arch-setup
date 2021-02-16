#!/bin/sh

echo -e "\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ installing konsole ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n"
sleep 0.8
pacman_install konsole

echo -e "\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ installing herbe ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n"
sleep 0.8
github_clone dudik/herbe herbe

cd herbe
cp ../resources/herbe/config.def.h config.def.h
sudo make install

cd ..
rm -rf herbe

echo -e "\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ installing zsh ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n"
sleep 0.8
pacman_install zsh

echo -e "\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ installing oh-my-zsh ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n"
sleep 0.8
sh -c "RUNZSH='no';$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo -e "\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ installing neovim ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n"
sleep 0.8
pacman_uninstall vim

pacman_install neovim
yay_install neovim-symlinks

echo -e "\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~ installing neovim plugins ~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n"
sleep 0.8

mkdir -p ~/.local/share/nvim/site/pack/vendor/start

cd ~/.local/share/nvim/site/pack/vendor/start 

github_clone cometsong/CommentFrame.vim comment-frame
github_clone preservim/nerdtree nerdtree
github_clone vim-airline/vim-airline vim-airline 
github_clone vim-airline/vim-airline-themes vim-airline-themes
github_clone tpope/vim-fugitive vim-fugitive

cd -

echo -e "\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ installing neofetch ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n"
sleep 0.8
pacman_install neofetch

echo -e "\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ installing picom ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n"
sleep 0.8
pacman_install picom

echo -e "\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ installing feh ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n"
sleep 0.8
pacman_install feh

sudo localectl set-keymap br-abnt2
sudo timedatectl set-timezone America/Sao_Paulo
