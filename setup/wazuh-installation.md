# Wazuh Installation Notes

## Purpose

Wazuh will be used as the SIEM/XDR platform for collecting logs, generating alerts, and visualizing security events.

## Components

- Wazuh Server
- Wazuh Indexer
- Wazuh Dashboard
- Wazuh Agents on Windows endpoints

## Basic Flow

Windows Endpoint -> Wazuh Agent -> Wazuh Server -> Wazuh Indexer -> Wazuh Dashboard

## Installation Plan

1. Install Linux server VM
2. Assign static IP address, for example 10.50.10.10
3. Install Wazuh all-in-one or distributed setup
4. Access Wazuh Dashboard from a lab VM
5. Install Wazuh Agent on Windows Server
6. Install Wazuh Agent on Windows Client
7. Confirm events are received

## Notes

Do not include passwords, tokens, internal school IPs, or private keys in this repository.
