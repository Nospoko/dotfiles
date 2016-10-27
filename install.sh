#!/bin/sh

if [[ -e $HOME/.vimrc || -e $HOME/.vim ]]; then
    echo "Ooops: ~/.vimrc or ~/.vim already exists. \n\
	It looks like you already have some vim configuration."
else
    echo === Checking out vundle
    git submodule update --init
    cd -

    echo === Linking vim directories
    ln -s $PWD/vimrc $HOME/.vimrc
    ln -s $PWD/vim $HOME/.vim

    echo === Vundling
    vim +BundleInstall +qall

    echo === Done
fi
