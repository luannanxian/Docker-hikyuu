#!/usr/bin/bash
sh cleanUnUsedDocker.sh
# 当数一非空时，改变buildName
[ $1 ]  && buildName=$1
[ ! $buildName ] && buildName="hikyuu:latest"

#下载相关资源
[ ! -f ta-lib-0.4.0-src.tar.gz ] && wget -c -O ta-lib-0.4.0-src.tar.gz http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz &
[ ! -d hikyuu ] && git clone https://git.oschina.net/fasiondog/hikyuu.git
# [ ! -d hikyuu ] && git clone https://github.com/fasiondog/hikyuu.git &
[ -d hikyuu ] && echo "git pull hikyuu .........." && cd hikyuu && git pull && cd ..

set -e
echo "building .............................. $buildName"
docker build --no-cache -t=$buildName .
#docker build -t=$buildName .

echo "build .............................. done"
echo --------------------------------------------------
echo run in shell:
echo ./start.sh
echo --------------------------------------------------

