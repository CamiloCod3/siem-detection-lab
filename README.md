# Windows SIEM Detection Lab

A hands-on blue team lab project focused on Windows logging, SIEM log collection, detection engineering, and SOC-style incident investigation.

The goal of this project is to build a fully isolated virtual lab where Windows events can be collected, analyzed, and used to create practical security detections.

## Project Status

Planning phase.

The lab environment has not been deployed yet.

## Who This Project Is For

This repository is an independent portfolio project and a practical lab guide for anyone who wants to study Windows logging and detection engineering.

Learners can use the instructions to understand how the lab should be planned and built step by step. Reviewers and employers can use the repository to evaluate the project scope, safety mindset, documentation quality, and planned technical workflow.

## Purpose

This project is designed to demonstrate practical skills in:

* Windows Server administration
* Windows Event Log analysis
* Sysmon telemetry
* SIEM log collection
* Detection engineering
* Basic SOC investigation workflow
* Secure lab isolation
* Technical documentation

## Planned Lab Environment

The lab will be built using virtual machines connected to an isolated virtual network.

Planned components:

* Windows Server
* Windows Client
* SIEM Server
* Optional Linux/Kali test VM
* Sysmon
* Wazuh or another SIEM platform

## Planned Architecture

```text
[Isolated Virtual Switch / Private Network]
        |
        ├── Windows Server
        ├── Windows Client
        ├── SIEM Server
        └── Linux/Kali Test VM
```

The lab must not be connected directly to the host network or any external or production network.

## Planned Detection Use Cases

The project will include detection scenarios such as:

* Failed Windows logons
* Suspicious PowerShell execution
* New local administrator user
* Scheduled task creation
* RDP logon activity

Each detection will be documented with:

* Objective
* Log source
* Relevant event IDs
* Detection logic
* Test procedure
* Expected result
* Screenshot of alert
* False positives
* Response steps

## How to Follow This Project

If you want to understand or reproduce the lab, start here:

[Lab Instructions](./Instructions.md)

Additional documentation:

* [Safety Rules](./docs/safety-rules.md)
* [Project Roadmap](./docs/project-roadmap.md)
* [Network Design](./architecture/network-design.md)

## Repository Structure

```text
siem-detection-lab/
├── README.md
├── Instructions.md
├── architecture/
├── docs/
├── detections/
├── reports/
├── screenshots/
└── scripts/
```

## Safety Disclaimer

This project is for educational and defensive security training only.

All testing must be performed inside the isolated lab environment.

Do not run tests against personal, company, public, production, or third-party systems outside the lab.

Do not publish sensitive information such as passwords, tokens, private keys, real internal IP addresses, real usernames, raw production logs, or sensitive screenshots.