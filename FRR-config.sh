#!/bin/sh
## dci-router1
# install wireguard
sudo docker exec -d clab-wg-dci-evpn-dci-router1 apk add wireguard-tools
# setup wireguard port
sudo docker exec -d clab-wg-dci-evpn-dci-router1 ip link add dev wg0 type wireguard
sudo docker exec -d clab-wg-dci-evpn-dci-router1 ip address add wg0 192.168.0.1/24
sudo docker exec -d clab-wg-dci-evpn-dci-router1 wg setconf wg0 /etc/wg.conf

# vtep loopback
sudo docker exec -d clab-wg-dci-evpn-dci-router1 ip addr add 100.127.0.1/32 dev lo

# vxlan>vlan bridge
sudo docker exec -d clab-wg-dci-evpn-dci-router1 ip link add br110 type bridge
sudo docker exec -d clab-wg-dci-evpn-dci-router1 ip link set br110 addrgenmode none
sudo docker exec -d clab-wg-dci-evpn-dci-router1 ip link set br110 addr aa:bb:cc:00:11:01
sudo docker exec -d clab-wg-dci-evpn-dci-router1 ip link add vni110 type vxlan local 100.127.0.1 dstport 4789 id 110 nolearning
sudo docker exec -d clab-wg-dci-evpn-dci-router1 ip link set vni110 master br110 addrgenmode none
sudo docker exec -d clab-wg-dci-evpn-dci-router1 ip link set vni110 type bridge_slave neigh_suppress on learning off
sudo docker exec -d clab-wg-dci-evpn-dci-router1 sysctl -w net.ipv4.conf.br110.forwarding=0
sudo docker exec -d clab-wg-dci-evpn-dci-router1 sysctl -w net.ipv6.conf.br110.forwarding=0
sudo docker exec -d clab-wg-dci-evpn-dci-router1 ip link set vni110 up
sudo docker exec -d clab-wg-dci-evpn-dci-router1 ip link set br110 up

# port>vlan association 
sudo docker exec -d clab-wg-dci-evpn-dci-router1 ip link set eth2 up
sudo docker exec -d clab-wg-dci-evpn-dci-router1 ip link add link eth2 name eth2.110 type vlan id 110
sudo docker exec -d clab-wg-dci-evpn-dci-router1 ip link set eth2.110 master br110
sudo docker exec -d clab-wg-dci-evpn-dci-router1 ip link set eth2.110 up

## dci-router2
# install wireguard
sudo docker exec -d clab-wg-dci-evpn-dci-router2 apk add wireguard-tools
# setup wireguard port
sudo docker exec -d clab-wg-dci-evpn-dci-router2 ip link add dev wg0 type wireguard
sudo docker exec -d clab-wg-dci-evpn-dci-router2 ip address add wg0 192.168.0.2/24
sudo docker exec -d clab-wg-dci-evpn-dci-router2 wg setconf wg0 /etc/wg.conf

# vtep loopback
sudo docker exec -d clab-wg-dci-evpn-dci-router2 ip addr add 100.127.0.2/32 dev lo

# vxlan>vlan bridge
sudo docker exec -d clab-wg-dci-evpn-dci-router2 ip link add br110 type bridge
sudo docker exec -d clab-wg-dci-evpn-dci-router2 ip link set br110 addrgenmode none
sudo docker exec -d clab-wg-dci-evpn-dci-router2 ip link set br110 addr aa:bb:cc:00:11:02
sudo docker exec -d clab-wg-dci-evpn-dci-router2 ip link add vni110 type vxlan local 100.127.0.2 dstport 4789 id 110 nolearning
sudo docker exec -d clab-wg-dci-evpn-dci-router2 ip link set vni110 master br110 addrgenmode none
sudo docker exec -d clab-wg-dci-evpn-dci-router2 ip link set vni110 type bridge_slave neigh_suppress on learning off
sudo docker exec -d clab-wg-dci-evpn-dci-router2 sysctl -w net.ipv4.conf.br110.forwarding=0
sudo docker exec -d clab-wg-dci-evpn-dci-router2 sysctl -w net.ipv6.conf.br110.forwarding=0
sudo docker exec -d clab-wg-dci-evpn-dci-router2 ip link set vni110 up
sudo docker exec -d clab-wg-dci-evpn-dci-router2 ip link set br110 up

# port>vlan association 
sudo docker exec -d clab-wg-dci-evpn-dci-router2 ip link set eth2 up
sudo docker exec -d clab-wg-dci-evpn-dci-router2 ip link add link eth2 name eth2.110 type vlan id 110
sudo docker exec -d clab-wg-dci-evpn-dci-router2 ip link set eth2.110 master br110
sudo docker exec -d clab-wg-dci-evpn-dci-router2 ip link set eth2.110 up

## dci-router3
# install wireguard
sudo docker exec -d clab-wg-dci-evpn-dci-router3 apk add wireguard-tools
# setup wireguard port
sudo docker exec -d clab-wg-dci-evpn-dci-router3 ip link add dev wg0 type wireguard
sudo docker exec -d clab-wg-dci-evpn-dci-router3 ip address add wg0 192.168.0.3/24
sudo docker exec -d clab-wg-dci-evpn-dci-router3 wg setconf wg0 /etc/wg.conf

# vtep loopback
sudo docker exec -d clab-wg-dci-evpn-dci-router3 ip addr add 100.127.0.3/32 dev lo

# vxlan>vlan bridge
sudo docker exec -d clab-wg-dci-evpn-dci-router3 ip link add br110 type bridge
sudo docker exec -d clab-wg-dci-evpn-dci-router3 ip link set br110 addrgenmode none
sudo docker exec -d clab-wg-dci-evpn-dci-router3 ip link set br110 addr aa:bb:cc:00:11:03
sudo docker exec -d clab-wg-dci-evpn-dci-router3 ip link add vni110 type vxlan local 100.127.0.3 dstport 4789 id 110 nolearning
sudo docker exec -d clab-wg-dci-evpn-dci-router3 ip link set vni110 master br110 addrgenmode none
sudo docker exec -d clab-wg-dci-evpn-dci-router3 ip link set vni110 type bridge_slave neigh_suppress on learning off
sudo docker exec -d clab-wg-dci-evpn-dci-router3 sysctl -w net.ipv4.conf.br110.forwarding=0
sudo docker exec -d clab-wg-dci-evpn-dci-router3 sysctl -w net.ipv6.conf.br110.forwarding=0
sudo docker exec -d clab-wg-dci-evpn-dci-router3 ip link set vni110 up
sudo docker exec -d clab-wg-dci-evpn-dci-router3 ip link set br110 up

# port>vlan association 
sudo docker exec -d clab-wg-dci-evpn-dci-router3 ip link set eth2 up
sudo docker exec -d clab-wg-dci-evpn-dci-router3 ip link add link eth2 name eth2.110 type vlan id 110
sudo docker exec -d clab-wg-dci-evpn-dci-router3 ip link set eth2.110 master br110
sudo docker exec -d clab-wg-dci-evpn-dci-router3 ip link set eth2.110 up
