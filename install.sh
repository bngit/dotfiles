#!/bin/bash

CURRPATH=${PWD}

function cleanvim {
    rm -rf ~/.vim/
    rm -rf ~/.vimrc
    rm -rf ~/.vim/config/
    rm -rf ~/.vim/undofiles
}

function installvim {
    # clean current config
    cleanvim

    ln -s ${CURRPATH}/vimrc ~/.vimrc
    ln -s ${CURRPATH}/gvimrc ~/.gvimrc

    # install vim-plug
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    # link the config files
    ln -s ${CURRPATH}/vim/config ~/.vim/config

    # undofiles folder
    mkdir -p ~/.vim/undofiles

    echo ""
    echo "Next do it by hand:"
    echo ""
    echo "  Install vim Plugins, open vim and run:"
    echo "  :PlugInstall!"
    echo ""
}

# ------------------------
# main

if [ -z "$1" ]; then
    echo usage:
    echo $0 clean: clean vim config files
    echo $0 vim  : install vim files
fi

if [ "$1" == "clean" ]; then
    cleanvim
elif [ "$1" == "vim" ]; then
    installvim
fi
