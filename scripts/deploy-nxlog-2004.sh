#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

echo "##############################################"
echo "#             nxlog                           #"
echo "##############################################"

apt-get update -qq

# Download NXLOG
#https://nxlog.co/products/nxlog-community-edition/download
wget https://nxlog.co/system/files/products/files/348/nxlog-ce_2.11.2190_ubuntu_focal_amd64.deb
sudo apt install ./nxlog-ce_2.11.2190_ubuntu_focal_amd64.deb

# The default location for the nxlog.conf file
stat /etc/nxlog/nxlog.conf

sudo mv /etc/nxlog/nxlog.conf /etc/nxlog/nxlog.conf.orig

sudo systemctl is-active nxlog >/dev/null 2>&1 && echo YES || echo NO

sudo systemctl list-units --type=service #only active service units
sudo systemctl list-dependencies nxlog.service #Displaying Dependencies

sudo systemctl show nxlog.service #Checking Unit Properties

chkconfig --list #shows SysV services only and does not include native systemd services.
chkconfig --list nxlog #verify that the run level configured correctly for the nxlog service
chkconfig nxlog on #configure it to start Automatically while system start-up

sudo systemctl status nxlog
sudo systemctl status nxlog.service -l --no-pager
