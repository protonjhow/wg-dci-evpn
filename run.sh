#!/bin/sh
sudo clab deploy --topo wg-dci-evpn.yml
./SRL-config.sh
./PC-interfaces.sh
./WG-config.sh
./FRR-config.sh