#!/bin/bash
###############################################
# File Name : install.sh
#    Author : rootkiter
#    E-mail : rootkiter@rootkiter.com
#   Created : Tue 14 Mar 2017 06:43:24 AM PDT
###############################################

#backup old vim dir
test -d ~/.vim && \
    echo -e "\n\n-> Tips <--- Backing up directory [~/.vim]...\n" && \
    mv ~/.vim ~/vim_oldrc
test -f ~/.vimrc && \
    echo -e "\n\n-> Tips <--- Backing up file [~/.vimrc]...\n" && \
    mv ~/.vimrc ~/vim_oldrc/vimrc_backup

#install my dir
git clone https://github.com/rootkiter/vimhome.git ~/.vim && \
    cd ~/.vim/ && \
    echo -e "\n\n-> Tips <--- Synchronizing [Nerdtree] and [Powerline] plug-ins...\n"

git clone https://github.com/preservim/nerdtree.git ./bundle/nerdtree && \
    cd ./bundle/nerdtree && git checkout e671e403dd1ec1da59f70605c73aaedb6cb0e637 && cd ~/.vim/

git clone https://github.com/Lokaltog/vim-powerline.git ./bundle/vim-powerline && \
    cd ./bundle/vim-powerline && git checkout 09c0cea859a2e0989eea740655b35976d951a84e && cd ~/.vim/


echo -e "\n\n-> Tips <--- Done. Help your self.\n"
