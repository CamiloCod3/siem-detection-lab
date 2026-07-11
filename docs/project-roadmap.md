# Project Roadmap

This roadmap develops the repository as an independent, self-directed SIEM detection engineering project. The first milestone is a small but fully working Windows detection lab. Later phases expand the same foundation with Linux telemetry, automation, testing, and optional framework mappings.

## Phase 0: Repository Foundation

- [x] Create the GitHub repository
- [x] Define the project scope and safety rules
- [x] Document the planned VM roles
- [x] Create the isolated network design
- [x] Define the initial Windows detection use cases
- [ ] Finalize the detection folder structure and naming convention
- [ ] Add setup documentation placeholders

## Phase 1: Build the Isolated Lab

- [ ] Create a private or internal virtual switch
- [ ] Deploy the SIEM server
- [ ] Deploy the Windows Server VM
- [ ] Deploy the Windows Client VM
- [ ] Assign static IP addresses
- [ ] Verify communication inside the lab
- [ ] Verify that the lab cannot reach external or production networks
- [ ] Create clean VM snapshots

## Phase 2: Deploy Wazuh

- [ ] Install the Wazuh server, indexer, and dashboard
- [ ] Record the Wazuh and operating system versions
- [ ] Install Wazuh agents on both Windows machines
- [ ] Confirm that both agents are connected and healthy
- [ ] Document the installation and any problems encountered

## Phase 3: Onboard Windows Telemetry

- [ ] Collect Windows Security, System, and Application logs
- [ ] Enable PowerShell Operational logging
- [ ] Enable process creation auditing where required
- [ ] Install and configure Sysmon
- [ ] Confirm that Sysmon events reach Wazuh
- [ ] Document important event IDs and decoded Wazuh fields

## Phase 4: Windows Detection MVP

Implement and validate three complete detection use cases:

- [ ] `DET-WIN-001` — Repeated failed Windows logons
- [ ] `DET-WIN-002` — Encoded or suspicious PowerShell execution
- [ ] `DET-WIN-003` — User added to the local Administrators group

Each detection must include:

- [ ] Detection objective and threat scenario
- [ ] Required log source and event IDs
- [ ] Wazuh rule or query logic
- [ ] Safe simulation procedure
- [ ] Expected alert result
- [ ] False-positive considerations
- [ ] MITRE ATT&CK mapping
- [ ] Cleanup steps where required

## Phase 5: Validate and Investigate

- [ ] Run each simulation inside the isolated lab
- [ ] Confirm that the expected Windows event is generated
- [ ] Confirm that Wazuh receives and decodes the event
- [ ] Confirm that the intended detection rule fires
- [ ] Tune rule severity and reduce obvious false positives
- [ ] Capture sanitized screenshots
- [ ] Write at least one complete incident report
- [ ] Record lessons learned and failed test attempts

## Phase 6: Portfolio MVP

The first portfolio milestone is complete when:

- [ ] The architecture and isolation controls are documented
- [ ] Wazuh is operational with two Windows agents
- [ ] Sysmon and Windows security telemetry are visible
- [ ] Three detections have been tested successfully
- [ ] Each detection has repeatable documentation
- [ ] At least one alert investigation is documented end to end
- [ ] Screenshots and sample evidence are sanitized
- [ ] The README reflects the deployed environment honestly

## Phase 7: Evidence and Reporting Automation

- [ ] Define a small sanitized evidence schema
- [ ] Build a Python CLI for exporting selected Wazuh alert metadata
- [ ] Add detection IDs and validation status to reports
- [ ] Generate Markdown incident report drafts from exported evidence
- [ ] Add safe handling for API credentials and configuration
- [ ] Document limitations and data-redaction rules

## Phase 8: Linux Expansion

- [ ] Deploy an Ubuntu endpoint VM
- [ ] Install and enroll the Wazuh agent
- [ ] Collect authentication, journald, and auditd telemetry
- [ ] Validate Linux field parsing in Wazuh
- [ ] Add initial Linux detections:
  - [ ] Repeated failed SSH logons
  - [ ] User added to the sudo group
  - [ ] Modification of `sshd_config`
  - [ ] Suspicious cron persistence
- [ ] Update the architecture and project title if the lab becomes fully hybrid

## Phase 9: Detection Quality and CI

- [ ] Add a detection metadata schema
- [ ] Validate YAML, JSON, and XML files in GitHub Actions
- [ ] Check that detection IDs are unique
- [ ] Check for required documentation fields
- [ ] Scan commits for secrets and unsafe sample data
- [ ] Create a detection coverage matrix
- [ ] Track detection status: planned, experimental, tested, or deprecated

## Phase 10: Future Enhancements

- [ ] Add file integrity monitoring use cases
- [ ] Add asset and software inventory views
- [ ] Add reusable Sigma rules where they provide value
- [ ] Add rule regression-test manifests
- [ ] Document alert tuning and rule version history
- [ ] Add optional ISO 27001 and NIST CSF mappings to tested controls
- [ ] Explore dashboards for detection coverage and lab health

## Project Principle

Build one small, working, and well-documented detection pipeline before expanding the scope. A tested rule with clear evidence is more valuable than a large collection of unverified detections.