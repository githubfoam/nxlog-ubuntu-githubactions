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
