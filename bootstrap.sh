#!/usr/bin/env bash

#This is needed to supress annoying (but harmeless) error messages from apt-get
export DEBIAN_FRONTEND=noninteractive

#Fix DNS issues
echo "nameserver 8.8.8.8" > /etc/resolv.conf

#Update package information
apt-get --yes --force-yes update

#Install some miscellaneous packages
apt-get --yes --force-yes install curl git netsed nmap build-essential make build-essential libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev python-pip python python-dev python-setuptools tcpdump iptables iptables-dev vim

#Mitmproxy installation
apt-get --yes --force-yes install libffi-dev libssl-dev libxml2-dev libxslt1-dev  zlib1g-dev \
        libfreetype6-dev liblcms2-dev libwebp-dev tcl8.5-dev tk8.5-dev python-tk
pip install --upgrade cffi
pip install --upgrade pyasn1
pip install mitmproxy

#SSLStrip installation
apt-get install --yes --force-yes sslstrip

#SSLSniff installation
apt-get --yes --force-yes install sslsniff

#SoCat installation
apt-get --yes --force-yes install socat

#BTProxy installation
apt-get --yes --force-yes install bluez bluez-cups bluez-dbg bluez-hcidump bluez-tools python-bluez libbluetooth-dev libbluetooth3 python-gobject python-dbus
git clone https://github.com/conorpp/btproxy.git
cd btproxy
python setup.py install

#Killerbee installation
pip uninstall pyyaml
apt-get --yes --force-yes install python-gtk2 python-cairo python-usb python-crypto python-serial python-dev libgcrypt-dev mercurial libyaml-dev libgcrypt11-dev libpython2.7-dev usbutils
pip install pyyaml
hg clone https://bitbucket.org/secdev/scapy-com
cd scapy-com
python setup.py install
cd ..
git clone https://github.com/riverloopsec/killerbee.git
cd killerbee
python setup.py install
chmod +x ./tools/*
echo 'export="$PATH:$HOME/killerbee/tools"' >> ~/.bashrc

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
/usr/local/go/bin/go get "github.com/praetorian-inc/trudy"
