#!/bin/bash
###############################################
# File Name : install.sh
#    Author : rootkiter
#    E-mail : rootkiter@rootkiter.com
#   Created : Tue 14 Mar 2017 06:43:24 AM PDT
###############################################

#backup old vim dir
mv ~/.vim ~/vim_oldrc
#install my dir
cp -r ./ ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
cd ~/.vim/
git submodule init
git submodule update
