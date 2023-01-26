# DCI lab 

Uses Wireguard for underlay tunnel with strong, fast encryption and FRR for EVPN transport of VLANs within the tunnel.

This lab example consists of three FRR routers connected in a ring topology. Each router is connected to an L3 switch that emulates the internet. Each "Site" has a SRLinux switch that connects the FRR DCI Routers to the local LAN. For testing purposes there are PCs deployed in each site to prove reachability and segmentation. 

To start this lab, run the *run.sh* script, which will run the containerlab deploy commands, and then configure the PC interfaces.

Based heavily on original work done by Brian Linkletter, and detailed here: https://www.brianlinkletter.com/2021/05/use-containerlab-to-emulate-open-source-routers/
