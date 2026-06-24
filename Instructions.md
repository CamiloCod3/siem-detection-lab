# Lab Instructions: Windows SIEM Detection Lab

This document explains how to build and document the Windows SIEM Detection Lab step by step.

The goal is to make the project understandable for both students who want to reproduce the lab and reviewers who want to understand the technical workflow.

## 1. Project Goal

The goal is to build an isolated SIEM lab using Windows machines and a SIEM platform.

The lab should collect Windows logs, generate security alerts, and document how those alerts can be investigated in a SOC-style workflow.

## 2. Before You Start

Before building the lab, make sure the following requirements are met:

* You have permission to use the infrastructure.
* The lab network is isolated.
* No bridged networking is used.
* No testing is performed against production systems.
* No school or company systems are scanned.
* No real malware is used.
* Snapshots are created before testing.

## 3. Required Virtual Machines

Recommended minimum lab:

| Machine        | Purpose                                          |
| -------------- | ------------------------------------------------ |
| Windows Server | Domain Controller or Windows log source          |
| Windows Client | Endpoint for user activity and detection testing |
| SIEM Server    | Receives and analyzes logs                       |
| Linux/Kali VM  | Optional controlled test machine                 |

## 4. Recommended Network Design

Use a private or internal virtual switch.

Example IP plan:

| Machine        | IP Address  |
| -------------- | ----------- |
| SIEM Server    | 10.50.10.10 |
| Windows Server | 10.50.10.20 |
| Windows Client | 10.50.10.30 |
| Linux/Kali VM  | 10.50.10.40 |

Gateway: None
Network type: Private/Internal virtual switch

The lab machines should be able to communicate with each other, but not with the school production network.

## 5. Phase 1: Planning

Complete the planning documentation before deployment.

Recommended files to review and update:

* `docs/safety-rules.md`
* `docs/project-roadmap.md`
* `architecture/network-design.md`
* `docs/school-approval-request.md`

Checklist:

* [ ] Define the purpose of the lab
* [ ] Define what is in scope
* [ ] Define what is out of scope
* [ ] Plan the IP address range
* [ ] Plan the virtual network type
* [ ] Request approval if using school infrastructure

## 6. Phase 2: Build the Isolated Network

Create an isolated virtual network using your hypervisor.

Safe options:

| Hypervisor         | Recommended Network Type           |
| ------------------ | ---------------------------------- |
| Hyper-V            | Private Virtual Switch             |
| VMware ESXi        | Port Group without physical uplink |
| Proxmox            | Linux bridge without physical NIC  |
| VirtualBox         | Internal Network                   |
| VMware Workstation | Host-only                          |

Avoid:

* Bridged networking
* School DHCP
* School DNS
* Routing to production networks
* Shared production VLANs

Validation commands on Windows:

```powershell
ipconfig /all
route print
Test-NetConnection 10.50.10.10
```

Validation commands on Linux:

```bash
ip addr
ip route
ping 10.50.10.10
```

## 7. Phase 3: Deploy the Virtual Machines

Deploy the planned virtual machines:

* Windows Server
* Windows Client
* SIEM Server
* Optional Linux/Kali VM

Document:

* VM names
* Operating systems
* IP addresses
* Network adapter type
* Snapshot names
* Any important configuration choices

Do not document passwords or secrets.

## 8. Phase 4: Install and Configure the SIEM

Install the selected SIEM platform.

Recommended starting option:

* Wazuh

Document the installation in a setup file, for example:

```text
setup/wazuh-installation.md
```

Document:

* SIEM version
* Operating system
* IP address
* Installation method
* Agent connection status
* Problems encountered
* Lessons learned

## 9. Phase 5: Configure Windows Logging

Configure log collection from Windows machines.

Recommended log sources:

* Windows Security Event Log
* Windows System Event Log
* Windows Application Event Log
* PowerShell Operational Log
* Sysmon Operational Log

Install Sysmon only inside the isolated lab machines.

Document the configuration in:

```text
setup/windows-logging.md
setup/sysmon-config.md
```

## 10. Phase 6: Create Detection Use Cases

Each detection should be documented in the `detections/` folder.

Start with simple detections:

* Failed Windows logons
* Suspicious PowerShell execution
* New local administrator user
* Scheduled task creation
* RDP logon activity

Each detection should include:

* Objective
* Threat scenario
* Log source
* Relevant event IDs
* Detection logic
* Test procedure
* Expected result
* Screenshot
* False positives
* Response steps
* MITRE ATT&CK mapping if possible

Use the detection template as a starting point.

## 11. Phase 7: Test Detections Safely

Only use harmless simulations.

Examples of safe activities:

* Failed login attempts with a test account
* Creating a temporary local test user
* Creating a harmless scheduled task
* Running a harmless encoded PowerShell command
* Connecting with RDP between lab machines

Do not use real malware.

Do not attack school systems.

Do not scan outside the lab network.

## 12. Phase 8: Write Incident Reports

For each successful detection, write a short incident report in the `reports/` folder.

Each report should explain:

* What happened
* Which host was involved
* Which user was involved
* Which logs were generated
* Why the alert matters
* Whether the activity was malicious or simulated
* What a SOC analyst should do next

Use:

```text
reports/incident-report-template.md
```

## 13. Phase 9: Add Screenshots

Screenshots should be stored in:

```text
screenshots/
```

Before publishing screenshots, remove or hide:

* Real usernames
* Internal school IP addresses
* Hostnames if sensitive
* Tokens
* Secrets
* Private information

## 14. Definition of Done

The project is considered complete when:

* The lab network is documented and isolated.
* Windows logs are collected by the SIEM.
* Sysmon telemetry is collected.
* At least three detection use cases are tested.
* Each tested detection has documentation.
* At least one alert screenshot is included.
* At least one incident report is written.
* The README explains the project clearly.
* No sensitive school information is published.

## 15. Recommended Git Workflow

After each meaningful update:

```powershell
git status
git add .
git commit -m "Describe what changed"
git push
```

Example commit messages:

```text
Add network isolation plan
Document SIEM installation steps
Add Windows logging notes
Test failed logon detection
Add suspicious PowerShell investigation report
Update project roadmap
```

## 16. Notes for Students

Do not rush directly into testing.

The most important parts of this lab are:

* Clear scope
* Safe isolation
* Good documentation
* Repeatable detection testing
* Honest reporting of what worked and what did not

A good security lab is not only about tools. It is about understanding, process, evidence, and responsible testing.
