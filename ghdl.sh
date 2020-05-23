#!/usr/bin/env bash

pushd `dirname $0` > /dev/null
DIR=`pwd -P`
popd > /dev/null

UNAME_STR=`uname`

# brew ghdl not working as expected
#if [[ "$UNAME_STR" == "Darwin" ]]; then
#    echo "Installing ghdl from brew..."
#    brew cask install ghdl
elif [[ "$UNAME_STR" == "Linux" ]] && hash pacman 2>/dev/null; then
    echo "Installing ghdl from pacman..."
    sudo pacman -S ghdl
else
    if [ ! -d $DIR/ghdl ]; then
    	echo "Checking out ghdl..."
    	git clone https://github.com/ghdl/ghdl $DIR/ghdl
    	cd $DIR/ghdl/
    else
    	cd $DIR/ghdl
    	echo "Updating ghdl..."
    	git pull origin master || exit 1
    fi

    cd $DIR/ghdl

    echo "Building ghdl..."
    ./configure --prefix=/usr/local
    make

    echo "Installing ghdl..."
    if [[ "$UNAME_STR" == "Darwin" ]]; then
        make install
    else
        sudo make install
    fi
fi
