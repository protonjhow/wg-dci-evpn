#!/bin/sh
sudo docker exec -d clab-wg-dci-evpn-PC1 ip link set eth1 up
sudo docker exec -d clab-wg-dci-evpn-PC1 ip addr add 172.16.0.1/24 dev eth1

sudo docker exec -d clab-wg-dci-evpn-PC2 ip link set eth1 up
sudo docker exec -d clab-wg-dci-evpn-PC2 ip addr add 172.16.0.2/24 dev eth1

sudo docker exec -d clab-wg-dci-evpn-PC3 ip link set eth1 up
sudo docker exec -d clab-wg-dci-evpn-PC3 ip addr add 172.16.0.3/24 dev eth1
