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

## 3. Lab Machines and Roles

The lab is built from a small number of virtual machines. Each machine has a specific role in the environment.

| VM | Main Role | What It Does | Example IP | Required? |
| --- | --- | --- | --- | --- |
| SIEM Server | Central log collection and analysis | Receives logs from Windows machines, stores events, generates alerts, and provides dashboards for investigation. | `10.50.10.10` | Yes |
| Windows Server | Server log source / optional Domain Controller | Generates Windows server events. Can optionally be configured as an Active Directory Domain Controller for domain logon and account-management detections. | `10.50.10.20` | Yes |
| Windows Client | Endpoint log source | Simulates a normal user workstation. Used to generate endpoint activity such as logons, PowerShell usage, scheduled tasks, and local admin changes. | `10.50.10.30` | Yes |
| Linux/Kali VM | Optional test machine | Used only for controlled and approved lab activity, such as validating network visibility or generating harmless test traffic inside the isolated lab. | `10.50.10.40` | Optional |

### How the Machines Work Together

```text
Windows Server  ---- logs ----\
                              \
Windows Client  ---- logs ----->  SIEM Server  ---> dashboards, alerts, investigations
                              /
Linux/Kali VM   -- optional --/
```

The Windows machines act as log sources. The SIEM server is the central system that receives, analyzes, and visualizes the logs. The optional Linux/Kali VM should only be used inside the isolated lab and only for safe, controlled testing.

## 4. Recommended Network Design

Use a private or internal virtual switch.

The lab machines should be able to communicate with each other, but not with the school production network.

| Network Setting | Recommendation | Reason |
| --- | --- | --- |
| Network type | Private/Internal virtual switch | Keeps the lab separated from production networks. |
| IP range | `10.50.10.0/24` | Private lab-only address range. |
| Default gateway | None | Prevents the lab from routing traffic outside the isolated network. |
| DNS | Windows Server if using AD, otherwise manual/static as needed | Keeps name resolution inside the lab. |
| Internet access | Disabled during the initial phase | Reduces risk and makes isolation easier to validate. |

Example IP plan:

| VM | IP Address | Notes |
| --- | --- | --- |
| SIEM Server | `10.50.10.10` | Static IP. Windows agents send logs here. |
| Windows Server | `10.50.10.20` | Static IP. Can also provide DNS if configured as AD DC. |
| Windows Client | `10.50.10.30` | Static IP. Endpoint used for user activity simulations. |
| Linux/Kali VM | `10.50.10.40` | Optional. No access outside the lab network. |

## 5. Phase 1: Planning

Complete the planning documentation before deployment.

Recommended files to review and update:

* `docs/safety-rules.md`
* `docs/project-roadmap.md`
* `architecture/network-design.md`

Checklist:

* [ ] Define the purpose of the lab
* [ ] Define what is in scope
* [ ] Define what is out of scope
* [ ] Plan the IP address range
* [ ] Plan the virtual network type
* [ ] Confirm permission and scope before using shared infrastructure

## 6. Phase 2: Build the Isolated Network

Create an isolated virtual network using your hypervisor.

Safe options:

| Hypervisor | Recommended Network Type |
| --- | --- |
| Hyper-V | Private Virtual Switch |
| VMware ESXi | Port Group without physical uplink |
| Proxmox | Linux bridge without physical NIC |
| VirtualBox | Internal Network |
| VMware Workstation | Host-only |

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

* SIEM Server
* Windows Server
* Windows Client
* Optional Linux/Kali VM

Recommended deployment order:

1. Create the isolated virtual switch.
2. Deploy the SIEM Server.
3. Deploy the Windows Server.
4. Deploy the Windows Client.
5. Deploy the optional Linux/Kali VM only if needed.
6. Assign static IP addresses.
7. Confirm that machines can communicate inside the lab.
8. Confirm that the lab cannot reach production networks.
9. Take clean snapshots before testing.

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

The SIEM Server should be the central log receiver. Windows machines should send events to this server using agents or supported log forwarding methods.

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
