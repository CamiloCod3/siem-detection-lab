# RDP Logon Detection

## Objective

Detect Remote Desktop logons to Windows systems.

## Relevant Event IDs

| Event ID | Meaning |
|---|---|
| 4624 | Successful logon |
| 4625 | Failed logon |
| Logon Type 10 | RemoteInteractive / RDP |

## Detection Logic

Alert on successful or failed RDP logons, especially from unusual source hosts.

## MITRE ATT&CK Mapping

| Tactic | Technique |
|---|---|
| Lateral Movement | Remote Services |
