# Scheduled Task Persistence Detection

## Objective

Detect creation of scheduled tasks that may be used for persistence.

## Relevant Event IDs

| Event ID | Meaning |
|---|---|
| 4698 | Scheduled task created |
| Sysmon 1 | Process creation |

## Safe Test Procedure

Use scripts/simulate-events.ps1 with the -CreateScheduledTask option.

## MITRE ATT&CK Mapping

| Tactic | Technique |
|---|---|
| Persistence | Scheduled Task/Job |
