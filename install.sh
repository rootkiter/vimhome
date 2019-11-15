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
    echo -e "\n\n-> Tips <--- Synchronizing [Nerdtree] and [Powerline] plug-ins...\n" && \
    git submodule init && \
    git submodule update

echo -e "\n\n-> Tips <--- Done. Help your self.\n"
