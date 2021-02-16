#!/bin/sh

echo -e "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ installing st ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
sleep 0.8
git clone https://git.suckless.org/st ~/repo/st

cd ~/repo/st
curl -O https://st.suckless.org/patches/alpha/st-alpha-0.8.2.diff

git apply st-alpha-0.8.2.diff
cp $SETUP_DIR/resources/st/config.def.h .

sudo make install

cd $SETUP_DIR

echo -e "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ installing herbe ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
sleep 0.8
github_clone dudik/herbe ~/repo/herbe

cd ~/repo/herbe
cp $SETUP_DIR/resources/herbe/config.def.h config.def.h
sudo make install

cd $SETUP_DIR

echo -e "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ installing zsh ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
sleep 0.8
pacman_install zsh

echo -e "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ installing oh-my-zsh ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
sleep 0.8
sh -c "RUNZSH='no';$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo -e "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ installing neovim ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
sleep 0.8
pacman_uninstall vim

pacman_install neovim
yay_install neovim-symlinks

echo -e "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~ installing neovim plugins ~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
sleep 0.8

mkdir -p ~/.local/share/nvim/site/pack/vendor/start

cd ~/.local/share/nvim/site/pack/vendor/start 

github_clone cometsong/CommentFrame.vim comment-frame
github_clone preservim/nerdtree nerdtree
github_clone vim-airline/vim-airline vim-airline 
github_clone vim-airline/vim-airline-themes vim-airline-themes
github_clone tpope/vim-fugitive vim-fugitive

cd $SETUP_DIR

echo -e "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ installing neofetch ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
sleep 0.8
pacman_install neofetch

echo -e "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ installing picom ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
sleep 0.8
pacman_install picom

echo -e "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ installing feh ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
sleep 0.8
pacman_install feh

sudo localectl set-keymap br-abnt2
sudo timedatectl set-timezone America/Sao_Paulo
