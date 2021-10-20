#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

echo "##############################################"
echo "# run cve test                               #"
echo "##############################################"

cat /etc/nxlog/nxlog.conf 
cat /etc/nxlog/nxlog.conf | grep "Port        514"

sudo systemctl status nxlog

lsof -i :514

gitclone https://github.com/GuillaumePetit84/CVE-2020-35488.git
ls -lai

./PoC.py -ip 192.168.1.55 -os 3
