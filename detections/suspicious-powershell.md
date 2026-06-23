# Suspicious PowerShell Detection

## Objective

Detect suspicious PowerShell usage such as encoded commands or hidden execution.

## Log Source

- Sysmon Process Creation
- Windows PowerShell Operational Log
- Wazuh Agent

## Relevant Event IDs

| Event ID | Meaning |
|---|---|
| Sysmon 1 | Process creation |
| 4688 | Process creation if enabled |
| 4104 | PowerShell script block logging |

## Detection Logic

Alert when PowerShell is launched with suspicious flags such as -enc, -encodedcommand, -nop, -w hidden, iex, or downloadstring.

## Safe Test Procedure

Inside the isolated lab, run a harmless encoded command using scripts/simulate-events.ps1.

## False Positives

- Admin scripts
- Software deployment tools
- Monitoring tools
- Helpdesk automation

## MITRE ATT&CK Mapping

| Tactic | Technique |
|---|---|
| Execution | PowerShell |
