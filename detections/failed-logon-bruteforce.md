# Failed Logon Brute Force Detection

## Objective

Detect repeated failed Windows logon attempts that may indicate brute force activity or password guessing.

## Log Source

- Windows Security Event Log
- Wazuh Agent

## Relevant Event IDs

| Event ID | Meaning |
|---|---|
| 4625 | Failed logon |

## Detection Logic

Alert when multiple failed logon events are observed from the same user, source host, or IP address within a short time window.

## False Positives

- User forgot password
- Misconfigured service account
- Expired password
- Scheduled task using old credentials

## MITRE ATT&CK Mapping

| Tactic | Technique |
|---|---|
| Credential Access | Brute Force |
