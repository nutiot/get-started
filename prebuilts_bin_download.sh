#!/bin/bash

HOST="https://repo.huaweicloud.com"

GN_TGZ="gn-linux-x86-20240115.tar.gz"
GN_URL="$HOST/openharmony/compiler/gn/20240115/linux/$GN_TGZ"

NINJA_TGZ="ninja-linux-x86-1.11.0.tar.gz"
NINJA_URL="$HOST//openharmony/compiler/ninja/1.11.0/linux/ninja-linux-x86-1.11.0.tar.gz"

UNZIP_DIR="prebuilts/build-tools/linux-x86/bin"

wget $GN_URL
wget $NINJA_URL

if [ ! -e ]; then
    mkdir -p $UNZIP_DIR
fi

tar -C $UNZIP_DIR -xvf $GN_TGZ
tar -C $UNZIP_DIR -xvf $NINJA_TGZ
