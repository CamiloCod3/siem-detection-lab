# Hypervisor Networking Setup

## Goal

Create a virtual network where lab machines can communicate with each other, but not with the school production network.

## Safe Configuration

- Private Virtual Switch
- Internal Network
- Host-only Network
- Port Group without physical uplink
- Linux bridge without physical NIC

## Unsafe Configuration

- Bridged networking
- Shared school VLAN
- Production DHCP
- Production DNS
- Routing between lab and school network

## Validation Commands

Windows:

ipconfig /all
route print
Test-NetConnection 10.50.10.10

Linux:

ip addr
ip route
ping 10.50.10.10
