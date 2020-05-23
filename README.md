# IceTools

Open Source FPGA toolkit built around [IceStorm](http://www.clifford.at/icestorm/) and [Yosys](http://www.clifford.at/yosys/) by [Clifford Wolf](http://www.clifford.at/).

Forked by nobodywasishere specifically for VHDL development on the Upduino v2.0.

## Run with Docker

```
docker run dimdm/icetools icepack -h
```

## Install locally (brew || sudo apt-get)

```
./icetools.sh
```

## Toolchain

| Component                                                      | Function      | License                                          |
|----------------------------------------------------------------|---------------|--------------------------------------------------|
| [Yosys](http://www.clifford.at/yosys/)                         | Synthesis     | [ISC](https://opensource.org/licenses/ISC)       |
| [IceStorm](http://www.clifford.at/icestorm/)                   | Bitstream     | [ISC](https://opensource.org/licenses/ISC)       |
| [NextPNR](https://github.com/YosysHQ/nextpnr)                  | Place & Route | [ISC](https://opensource.org/licenses/ISC)       |
| [GHDL](https://github.com/ghdl/ghdl)                           | Simulator     | [GPLv2](https://opensource.org/licenses/GPL-2.0) |
| [ghdl-yosys-plugin](https://github.com/ghdl/ghdl-yosys-plugin) | Synthesis     | [GPLv3](https://opensource.org/licenses/GPL-3.0) |

## Supported FPGAs

iCE40UP5K, possibly others as I have only access to this board

## Supported Devkits

- [Upduino v2.0](http://www.gnarlygrey.com/)

## Issues

`iceprog` is not supported in docker and should be installed locally using `./icestorm.sh` which kind of defeats the purpose.

### OS X

To unload the default and vendor drivers in case `iceprog` refuses to connect:
```
sudo kextunload -v -b com.apple.driver.AppleUSBFTDI
sudo kextunload -v -b com.FTDI.driver.FTDIUSBSerialDriver
```

Reload with
```
sudo kextload -v -b com.apple.driver.AppleUSBFTDI
sudo kextload -v -b com.FTDI.driver.FTDIUSBSerialDriver
```
