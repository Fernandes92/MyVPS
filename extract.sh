#!/bin/bash
# Extract dotfiles to their correct locations
cp vimrc ~/.vimrc
cp bashrc ~/.bashrc
cp screenrc ~/.screenrc
cp .gitconfig ~/.gitconfig
cp .gitignore ~/.gitignore
cp -r vim ~/.vim
mkdir -p ~/.vim/sessions
cp git-prompt.sh ~/.git-prompt.sh
