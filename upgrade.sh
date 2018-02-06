#!/bin/bash

cd /usr/bin
bulwark-cli stop
sudo rm -rf bulwar*
wget http://ryu.spb.ru/bwk/bulwarkd
wget http://ryu.spb.ru/bwk/bulwark-cli
chmod +x bulwarkd
chmod +x bulwark-cli
cd ~
sudo mv /root/.bulwark /root/.bulwark.old
mkdir /root/.bulwark
sudo cp /root/.bulwark.old/wallet.dat /root.bulwark
sudo cp /root/.bulwark.old/bulwark.conf /root/.bulwark
sudo chown -R /root/.bulwark
echo '
addnode=213.32.23.65:52543
addnode=199.247.7.119:52543
addnode=185.223.30.31:52543
addnode=80.209.229.92:52543
addnode=45.33.58.91:52543
addnode=46.101.131.50:52543
addnode=159.203.123.44:52543
addnode=209.250.232.68:42870
addnode=199.247.4.86:39654
addnode=109.101.221.204:57374
addnode=46.149.120.21:53380
addnode=86.149.228.161:54055
addnode=45.77.138.177:52543
addnode=207.148.1.60:52543
addnode=114.94.190.239:54954
addnode=45.63.49.239:38716
addnode=80.122.43.78:52543
addnode=45.32.221.80:52543
addnode=108.61.188.251:52543
addnode=73.73.160.113:51356
addnode=134.255.252.218:55912
addnode=104.238.157.205:52543
addnode=45.76.118.238:52543
addnode=47.88.220.108:52543
addnode=104.156.225.96:52543
' | sudo -E tee ~/.bulwark/bulwark.conf >/dev/null 2>&1
    sudo chmod 0600 ~/.bulwark/bulwark.conf
bulwarkd -daemon
watch bulwark-cli getinfo
