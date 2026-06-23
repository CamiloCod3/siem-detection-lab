# Network Design

## Objective

Create a fully isolated network for the SIEM Detection Lab so that no activity can affect the school environment.

## Recommended IP Plan

Lab Network: 10.50.10.0/24

- SIEM Server: 10.50.10.10
- Windows Server: 10.50.10.20
- Windows Client: 10.50.10.30
- Linux/Kali VM: 10.50.10.40
- Gateway: None
- DNS: Windows Server if using AD

## Isolation Requirements

- Use a private/internal virtual switch
- Do not use bridged networking
- Do not connect the lab switch to a physical NIC
- Do not use the school DHCP server
- Do not scan school IP ranges
- Do not route traffic from the lab to the school network
- Avoid NAT during the initial lab phase

## Safety Validation Checklist

- [ ] VM network is private/internal only
- [ ] No bridged adapter is enabled
- [ ] No default gateway is configured unless required
- [ ] No route exists to school production networks
- [ ] Snapshots are taken
- [ ] Test scope is documented
- [ ] Approval has been received from responsible staff
