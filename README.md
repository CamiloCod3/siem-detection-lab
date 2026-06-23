# Windows SIEM Detection Lab

This project documents a fully isolated Windows SIEM Detection Lab for blue team training, detection engineering, Windows logging, and SOC-style investigation practice.

The goal is not only to install a SIEM, but to create repeatable detection scenarios, document logs, write detection rules, trigger alerts, analyze them, and produce investigation notes.

## Project Goals

- Build an isolated virtual lab environment
- Collect Windows Event Logs and Sysmon telemetry
- Forward endpoint logs to a SIEM
- Create and test detection rules
- Document each detection use case
- Map detections to MITRE ATT&CK where possible
- Produce screenshots and sample incident reports
- Keep the school network completely unaffected

## Planned Lab Architecture

Isolated Virtual Switch / Private Network

- Windows Server / Domain Controller
- Windows Client
- Wazuh SIEM Server
- Linux/Kali Test VM

## Suggested Stack

- Windows Server
- Windows Client
- Wazuh SIEM
- Wazuh Agent
- Sysmon
- Sigma rules
- Optional Linux/Kali VM for controlled testing

## Detection Use Cases

- Failed logon brute force
- Suspicious PowerShell execution
- New local administrator user
- Scheduled task persistence
- RDP logon activity
- Security control tampering
- Suspicious SMB/share access

## Disclaimer

This project is for educational and defensive security training only.

All tests must be performed inside an isolated lab environment with explicit permission from the system owner.

Do not run tests against school, company, public, or third-party systems.
