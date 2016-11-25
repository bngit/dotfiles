#!/bin/bash

CURRPATH=${PWD}

function install {
    if [ -e ~/.bashrc ]; then
        mv ~/.bashrc ~/.bashrc.backup
        echo "mv ~/.bashrc ~/.bashrc.backup"
    fi
    ln -s ${CURRPATH}/bashrc ~/.bashrc

    if [ -e ~/.zshrc ]; then
        mv ~/.zshrc ~/.zshrc.backup
        echo "mv ~/.zshrc ~/.zshrc.backup"
    fi
    ln -s ${CURRPATH}/zshrc ~/.zshrc

    if [ -e ~/.tmux.conf ]; then
        mv ~/.tmux.conf ~/.tmux.conf.backup
        echo "mv ~/.tmux.conf ~/.tmux.conf.backup"
    fi
    ln -s ${CURRPATH}/tmux.conf ~/.tmux.conf


    # git global ignore file
    if [ -e ~/.gitignore_global ]; then
        mv ~/.gitignore_global ~/.gitignore_global.backup
        echo "mv ~/.gitignore_global ~/.gitignore_global.backup"
    fi
    ln -s ${CURRPATH}/gitignore_global ~/.gitignore_global
    git config --global core.excludesfile ~/.gitignore_global

    echo ""
    echo "Create OK!"
}

function rmback {
    rm ~/.vimrc.backup
    rm ~/.vim/config.backup
    rm ~/.bashrc.backup
    rm ~/.zshrc.backup
    rm ~/.tmux.conf.backup
}

function installvim {
    if [ -e ~/.vimrc ]; then
        mv ~/.vimrc ~/.vimrc.backup
        echo "mv ~/.vimrc to ~/.vimrc.backup."
    fi
    ln -s ${CURRPATH}/vimrc ~/.vimrc

    if [ -e ~/.vim/config ]; then
        mv ~/.vim/config ~/.vim/config.backup
        echo "mv ~/.vim/config to ~/.vim/config.backup"
    fi
    ln -s ${CURRPATH}/vim/config ~/.vim/config

    if [ ! -d ~/.vim/undofiles ]; then
        mkdir ~/.vim/undofiles
    fi

    # install vundle
    if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    fi

    echo ""
    echo "Next  do it by hand:"
    echo ""
    echo "  Install vim Plugins, run:"
    echo "  $ vim +PluginInstall +qall"
    echo ""
}

# ------------------------
# main

if [ -z "$1" ]; then
    echo usage:
    echo $0 install     : Install the config files
    echo $0 rmback      : Rm the backup files
    echo $0 installvim  : Install vim config files
fi

if [ "$1" == "install" ]; then
    install
elif [ "$1" == "rmback" ]; then
    rmback
elif [ "$1" == "installvim" ]; then
    installvim
fi

