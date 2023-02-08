#!/bin/sh
# install wireguard everywhere and wait for APK to finish
sudo docker exec -d clab-wg-dci-evpn-dci-router1 apk add wireguard-tools 
sudo docker exec -d clab-wg-dci-evpn-dci-router2 apk add wireguard-tools
sudo docker exec -d clab-wg-dci-evpn-dci-router3 apk add wireguard-tools
sleep 150

## dci-router1
# setup wireguard port
sudo docker exec -d clab-wg-dci-evpn-dci-router1 ip link add dev wg0 type wireguard
sudo docker exec -d clab-wg-dci-evpn-dci-router1 ip address add 192.168.0.1/24 dev wg0
sudo docker exec -d clab-wg-dci-evpn-dci-router1 wg setconf wg0 /etc/wg.conf

## dci-router2
# setup wireguard port
sudo docker exec -d clab-wg-dci-evpn-dci-router2 ip link add dev wg0 type wireguard
sudo docker exec -d clab-wg-dci-evpn-dci-router2 ip address add 192.168.0.2/24 dev wg0
sudo docker exec -d clab-wg-dci-evpn-dci-router2 wg setconf wg0 /etc/wg.conf

## dci-router3
# setup wireguard port
sudo docker exec -d clab-wg-dci-evpn-dci-router3 ip link add dev wg0 type wireguard
sudo docker exec -d clab-wg-dci-evpn-dci-router3 ip address add 192.168.0.3/24 dev wg0
sudo docker exec -d clab-wg-dci-evpn-dci-router3 wg setconf wg0 /etc/wg.conf

# set ports up 
sudo docker exec -d clab-wg-dci-evpn-dci-router1 ip link set wg0 up
sudo docker exec -d clab-wg-dci-evpn-dci-router2 ip link set wg0 up
sudo docker exec -d clab-wg-dci-evpn-dci-router3 ip link set wg0 up
