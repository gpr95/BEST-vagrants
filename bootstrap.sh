#!/usr/bin/env bash

#This is needed to supress annoying (but harmeless) error messages from apt-get
export DEBIAN_FRONTEND=noninteractive

#Fix DNS issues
echo "nameserver 8.8.8.8" > /etc/resolv.conf

#Update package information
apt-get --yes --force-yes update

#Install some miscellaneous packages
apt-get --yes --force-yes install curl git build-essential make build-essential libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev python-pip python python-dev python-setuptools tcpdump iptables iptables-dev vim

#Mitmproxy installation
apt-get --yes --force-yes install libffi-dev libssl-dev libxml2-dev libxslt1-dev  zlib1g-dev \
        libfreetype6-dev liblcms2-dev libpcap-dev libwebp-dev tcl8.5-dev tk8.5-dev python-tk
pip install --upgrade cffi
pip install --upgrade pyasn1
pip install mitmproxy

#Trudy installation
echo 'export GOPATH="/root/go"' >> /root/.bashrc
echo 'export PATH=$PATH:/usr/local/go/bin' >> /root/.bashrc
mkdir -p /root/go
mkdir -p /root/go/src
mkdir -p /root/go/pkg
mkdir -p /root/go/bin
mkdir -p /root/go-src
wget -q -O /root/go-src/go.tar.gz https://storage.googleapis.com/golang/go1.6.2.linux-amd64.tar.gz
tar -C /usr/local -xzf /root/go-src/go.tar.gz
export GOPATH="/root/go"
/usr/local/go/bin/go get "https://github.com/gpr95/trudy"
