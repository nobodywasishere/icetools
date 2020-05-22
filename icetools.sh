#!/usr/bin/env bash

pushd `dirname $0` > /dev/null
DIR=`pwd -P`
popd > /dev/null

UNAME_STR=`uname`

echo "Installing dependencies..."
if [[ "$UNAME_STR" == "Darwin" ]] && hash brew 2>/dev/null; then
	brew update && brew install python3 libftdi0 libffi autoconf bison gawk gnu-sed graphviz xdot mercurial cmake
fi
if [[ "$UNAME_STR" == "Linux" ]] && hash apt-get 2>/dev/null; then
	sudo apt-get install -y pkg-config build-essential bison flex gawk tcl-dev libffi-dev git mercurial python python3 libftdi-dev
    sudo apt-get install -y libreadline-dev clang graphviz xdot cmake
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
