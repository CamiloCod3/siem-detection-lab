# Sysmon Configuration

## Purpose

Sysmon gives better Windows telemetry than default Windows logs.

Useful events include:

- Process creation
- Network connections
- File creation
- Registry changes
- Driver loading
- Image loading
- Remote thread creation
- Process access

## Example Install Command

Run as Administrator inside the lab VM:

Sysmon64.exe -accepteula -i sysmonconfig.xml

## Verify Sysmon Logs

Get-WinEvent -LogName Microsoft-Windows-Sysmon/Operational -MaxEvents 5

## Notes

Do not include downloaded binaries in this repository.
