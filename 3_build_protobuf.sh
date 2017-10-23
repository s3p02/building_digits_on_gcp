#!/bin/bash

cd $PROTOBUF_ROOT
sudo ./autogen.sh
sudo ./configure
sudo make "-j$(nproc)"
sudo make install
sudo ldconfig
cd python
sudo python setup.py install --cpp_implementation
