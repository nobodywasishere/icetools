#!/usr/bin/env bash

pushd `dirname $0` > /dev/null
DIR=`pwd -P`
popd > /dev/null

UNAME_STR=`uname`

if [ ! -d $DIR/ghdl-yosys-plugin ]; then
	echo "Checking out ghdl-yosys-plugin..."
	git clone https://github.com/ghdl/ghdl-yosys-plugin $DIR/ghdl-yosys-plugin
	cd $DIR/ghdl-yosys-plugin/
else
	cd $DIR/ghdl-yosys-plugin
	echo "Updating ghdl-yosys-plugin..."
	git pull origin master || exit 1
fi

cd $DIR/ghdl-yosys-plugin

echo "Building ghdl-yosys-plugin..."
make clean
make

echo "Installing ghdl-yosys-plugin..."
if [[ "$UNAME_STR" == "Darwin" ]]; then
	make install
else
	sudo make install
fi
