#!/usr/bin/env bash

pushd `dirname $0` > /dev/null
DIR=`pwd -P`
popd > /dev/null

UNAME_STR=`uname`

echo "Installing dependencies..."

# MacOS dependencies through homebrew
if [[ "$UNAME_STR" == "Darwin" ]] && hash brew 2>/dev/null; then
	brew update
    brew install bash bison boost boost-python3 cmake eigen flex gawk git \
        gnu-sed graphviz libffi libftdi0 llvm mercurial pkg-config python \
        python3 qt5 readline tcl-tk xdot
    echo 'export PATH="/usr/local/opt/qt/bin:$PATH"' >> ~/.bash_profile
fi
# Ubuntu
if [[ "$UNAME_STR" == "Linux" ]] && hash apt 2>/dev/null; then
    sudo apt update -y
    sudo apt upgrade -y
    sudo apt install bison build-essential clang clang-format cmake flex gawk \
        gcc git gnat-8 graphviz libboost-all-dev libeigen3-dev libffi-dev \
        libftdi-dev libreadline-dev mercurial pkg-config python python3 \
        python3-dev qt5-default tcl-dev xdot zlib1g-dev
fi
# Arch or Manjaro
if [[ "$UNAME_STR" == "Linux" ]] && hash pacman 2>/dev/null; then
    sudo pacman -Syu bison clang cmake flex gawk gcc git gcc-ada \
        graphviz boost eigen libffi libftdi readline mercurial pkg-config \
        python python3 qt5 tcl xdot zlib
fi

echo "┌──────────┐"
echo "│ icestorm │"
echo "└──────────┘"
$DIR/icestorm.sh

echo "┌─────────┐"
echo "│ nextpnr │"
echo "└─────────┘"
$DIR/nextpnr.sh

echo "┌─────────┐"
echo "│ nextpnr │"
echo "└─────────┘"
$DIR/nextpnr.sh

echo "┌───────┐"
echo "│ yosys │"
echo "└───────┘"
$DIR/yosys.sh

echo "┌──────┐"
echo "│ GHDL │"
echo "└──────┘"
$DIR/ghdl.sh

echo "┌───────────────────┐"
echo "│ ghdl-yosys-plugin │"
echo "└───────────────────┘"
$DIR/ghdl-yosys-plugin.sh
