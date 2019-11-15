#!/bin/bash
###############################################
# File Name :uninstall.sh
# Author: rootkiter
# E-mail: rootkiter@rootkiter.com
#   Created : Tue 14 Mar 2017 06:43:24 AM PDT
###############################################


test -d ~/.vim && \
    rm -rf ~/.vim

test -d ~/vim_oldrc && \
    test -f ~/vim_oldrc/vimrc_backup && \
    echo -e "\n\n-> Tips <--- Recovering file [~/.vimrc]...\n" && \
    mv ~/vim_oldrc/vimrc_backup ~/.vimrc

test -d ~/vim_oldrc && \
    echo -e "\n\n-> Tips <--- Recovering directory [~/.vim/]...\n" && \
    mv ~/vim_oldrc/ ~/.vim
