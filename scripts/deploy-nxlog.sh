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

# Download and install Openssl library
# wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl1.0/libssl1.0.0_1.0.2n-1ubuntu5.3_amd64.deb
# apt install ./libssl1.0.0_1.0.2n-1ubuntu5.3_amd64.deb

# # Download and install GNU dbm library
# wget http://archive.ubuntu.com/ubuntu/pool/main/g/gdbm/libgdbm5_1.14.1-6_amd64.deb
# apt install ./libgdbm5_1.14.1-6_amd64.deb

# # Download and install Perl libraries
# wget http://archive.ubuntu.com/ubuntu/pool/main/p/perl/libperl5.26_5.26.1-6_amd64.deb
# apt install ./libperl5.26_5.26.1-6_amd64.deb

# echo "##############################################"
# echo "# Configure UFW Firewall                     #"
# echo "##############################################"

# #  Allow HTTP(s)
# ufw allow 80
# ufw allow 443

# # Allow syslog TCP/UDP in
# ufw allow 514

# # Allow syslog SSL in
# ufw allow 1514

# # Allow ElasticSearch (not for production)
# ufw allow 9200

# echo "##############################################"
# echo "# Setup NXLOG                                #"
# echo "##############################################"

# Download NXLOG
#https://nxlog.co/products/nxlog-community-edition/download
# wget https://nxlog.co/system/files/products/files/348/nxlog-ce_2.10.2150_ubuntu_bionic_amd64.deb
# dpkg -i nxlog-ce_2.10.2150_ubuntu_bionic_amd64.deb # method1

# wget http://nxlog.org/system/files/products/files/1/nxlog-ce_2.8.1248_ubuntu_1404_amd64.deb
# dpkg -i nxlog-ce_2.8.1248_ubuntu_1404_amd64.deb
# apt-get install -f

# service nxlog status

# Remove default NXLOG configuration & replace
# rm /etc/nxlog/nxlog.conf 
# cp nxlog.conf /etc/nxlog/nxlog.conf

# Create certificates for SSL (directory in config)
# mkdir /etc/nxlog/ssl
# openssl req -x509 -nodes -days 1095 -newkey rsa:2048 -keyout /etc/nxlog/ssl/nxlog.key -out /etc/nxlog/ssl/nxlog.crt

#Install Maxmind GeoIP Modules for IP lookups if removed from dependencies
# apt-get install geoip-bin
