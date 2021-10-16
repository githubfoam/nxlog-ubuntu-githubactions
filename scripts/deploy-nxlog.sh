#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

echo "##############################################"
echo "# Install Dependencies                       #"
echo "##############################################"

apt-get update -qq
# apt-get install -qqy openjdk-7-jre-headless, nginx, pv, htop, socat, geoip-bin, git, make
# apt-get install -qqy openjdk-13-jre-headless, nginx, pv, htop, socat, geoip-bin, git, make

# Download and install Perl Modules
wget http://archive.ubuntu.com/ubuntu/pool/main/p/perl/perl-modules-5.26_5.26.1-6_all.deb
apt install ./perl-modules-5.26_5.26.1-6_all.deb
