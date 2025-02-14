#!/bin/bash
echo start build talib................................. $0

#set -e
tocheckfile=/ta-lib-0.4.0-src.tar.gz
if [ -f $tocheckfile ]; then
  tar -xzf $tocheckfile
  cd ta-lib/
  ./configure
  make
  make install
  cd ../
  rm $tocheckfile
  rm -rf ta-lib
fi

pip install ta-lib

echo done ................................. $0
