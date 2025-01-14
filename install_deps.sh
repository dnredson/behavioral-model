#!/bin/bash
set -e
ubuntu_release=`lsb_release -s -r`
apt-get install -y \
    automake \
    cmake \
    libgmp-dev \
    libpcap-dev \
    libboost-dev \
    libboost-test-dev \
    libboost-program-options-dev \
    libboost-system-dev \
    libboost-filesystem-dev \
    libboost-thread-dev \
    libevent-dev \
    libtool \
    flex \
    bison \
    pkg-config \
    g++ \
    libssl-dev \
    libffi-dev \
    python3-dev \
    python3-pip \
    wget

tmpdir=`mktemp -d -p .`
cd $tmpdir

bash ../ci/install-thrift.sh
bash ../ci/install-nanomsg.sh
sudo ldconfig
bash ../ci/install-nnpy.sh

cd ..
rm -rf $tmpdir
