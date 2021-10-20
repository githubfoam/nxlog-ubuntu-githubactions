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

# The default location for the nxlog.conf file
stat /etc/nxlog/nxlog.conf

sudo mv /etc/nxlog/nxlog.conf /etc/nxlog/nxlog.conf.orig

sudo systemctl is-active nxlog >/dev/null 2>&1 && echo YES || echo NO

sudo systemctl list-units --type=service | grep nxlog #only active service units
sudo systemctl list-dependencies nxlog.service #Displaying Dependencies

sudo systemctl show nxlog.service #Checking Unit Properties

# where service start with "k" means it will not execute during the boot 
# and service start with "S" will start during the boot.
ls -lai /etc/rc*.d/

#where "+" means service is in running state "-" is in stopped.
service --status-all | grep nxlog 

# echo deb http://download.virtualbox.org/virtualbox/debian xenial contrib | sudo tee -a /etc/apt/sources.list.d/virtualbox.list
echo "deb http://archive.ubuntu.com/ubuntu/ trusty main universe restricted multiverse" | sudo tee -a /etc/apt/sources.list
sudo apt-get update

# Install package
sudo apt-get install sysv-rc-conf -y
# show all services in all the runlevels
sudo sysv-rc-conf --list
sudo sysv-rc-conf --list nxlog #0:off	1:off	2:on	3:on	4:on	5:on	6:off


sudo systemctl status nxlog
sudo systemctl status nxlog.service -l --no-pager
