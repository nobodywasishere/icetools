#!/usr/bin/env bash

pushd `dirname $0` > /dev/null
DIR=`pwd -P`
popd > /dev/null

UNAME_STR=`uname`

echo "Installing dependencies..."
if [[ "$UNAME_STR" == "Darwin" ]] && hash brew 2>/dev/null; then
	brew update && brew install autoconf bison boost-python3 cmake eigen flex \
        gawk gnu-sed graphviz libffi libftdi0 mercurial python3 qt5 readline \
        tcl-tk xdot
    alias python=python3
fi
if [[ "$UNAME_STR" == "Linux" ]] && hash apt-get 2>/dev/null; then
    sudo apt install bison build-essential clang cmake flex gawk git gnat-8 \
        graphviz libboost-all-dev libeigen3-dev libffi-dev libftdi-dev \
        libreadline-dev mercurial pkg-config python python3 python3-dev \
        qt5-default tcl-dev xdot
fi

echo "┌──────────┐"
echo "│ icestorm │"
echo "└──────────┘"
$DIR/icestorm.sh

echo "┌─────────────┐"
echo "│ arachne-pnr │"
echo "└─────────────┘"
$DIR/arachne-pnr.sh

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
