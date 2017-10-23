#!/bin/bash

cd $PROTOBUF_ROOT
./autogen.sh
./configure
make "-j$(nproc)"
make install
ldconfig
cd python
python setup.py install --cpp_implementation
