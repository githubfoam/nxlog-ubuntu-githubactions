#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

echo "##############################################"
echo "# Install NXlog CE                           #"
echo "##############################################"

apt-get update -qq


# Download NXLOG
#https://nxlog.co/products/nxlog-community-edition/download
# wget https://nxlog.co/system/files/products/files/348/nxlog-ce_2.11.2190_ubuntu_focal_amd64.deb
# sudo apt-get install ./nxlog-ce_2.11.2190_ubuntu_focal_amd64.deb
wget https://nxlog.co/system/files/products/files/348/nxlog-ce_2.11.2190_ubuntu_bionic_amd64.deb
sudo apt-get install ./nxlog-ce_2.11.2190_ubuntu_bionic_amd64.deb

echo "##############################################"
echo "# run cve test                               #"
echo "##############################################"

cat /etc/nxlog/nxlog.conf 
cat /etc/nxlog/nxlog.conf | grep "514"

sudo systemctl status nxlog

lsof -i :514

git clone https://github.com/GuillaumePetit84/CVE-2020-35488.git
ls -lai
cd CVE-*
ls -lai
# sudo ./PoC.py -ip 192.168.1.55 -os 3
