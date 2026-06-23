# New Local Administrator Detection

## Objective

Detect when a user is added to a local administrators group.

## Log Source

- Windows Security Event Log
- Wazuh Agent

## Relevant Event IDs

| Event ID | Meaning |
|---|---|
| 4732 | Member added to a security-enabled local group |
| 4728 | Member added to a security-enabled global group |

## Safe Test Procedure

Inside the isolated lab only:

net user labadmin Password123! /add
net localgroup administrators labadmin /add

Cleanup:

net localgroup administrators labadmin /delete
net user labadmin /delete

## MITRE ATT&CK Mapping

| Tactic | Technique |
|---|---|
| Persistence | Create Account |
| Privilege Escalation | Valid Accounts |
