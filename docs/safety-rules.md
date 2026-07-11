# Safety Rules

## Allowed

- Testing inside isolated lab VMs
- Generating harmless Windows events
- Creating test users inside lab VMs
- Running detection simulations
- Taking screenshots with sensitive data removed
- Writing detection documentation

## Not Allowed

- Testing against systems outside the isolated lab
- Scanning external, public, or production IP ranges
- Bridging lab VMs to the host or a production network
- Running real malware
- Publishing data from real or external environments
- Publishing credentials, tokens, or private keys
- Installing agents on non-lab machines

## GitHub Publishing Rules

Do not publish real usernames, passwords, internal domains, real internal IP addresses, sensitive screenshots, private keys, tokens, or raw event logs from production or third-party environments.