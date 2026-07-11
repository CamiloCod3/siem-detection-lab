# Network Design

## Objective

Create a fully isolated network for the SIEM Detection Lab so that lab activity cannot affect the host, external systems, or production networks.

## Recommended IP Plan

Lab Network: `10.50.10.0/24`

- SIEM Server: `10.50.10.10`
- Windows Server: `10.50.10.20`
- Windows Client: `10.50.10.30`
- Linux/Kali VM: `10.50.10.40`
- Gateway: None
- DNS: Windows Server if using AD

## Isolation Requirements

- Use a private or internal virtual switch
- Do not use bridged networking
- Do not connect the lab switch to a physical NIC
- Do not use external DHCP or DNS services
- Do not scan IP ranges outside the lab
- Do not route traffic from the lab to production or external networks
- Avoid NAT during the initial lab phase

## Safety Validation Checklist

- [ ] VM network is private or internal only
- [ ] No bridged adapter is enabled
- [ ] No default gateway is configured unless explicitly required
- [ ] No route exists to production or external networks
- [ ] Snapshots are taken
- [ ] Test scope is documented
- [ ] All infrastructure used is owned or authorized