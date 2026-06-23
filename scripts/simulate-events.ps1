param(
    [switch]$CreateTestAdmin,
    [switch]$CreateScheduledTask,
    [switch]$EncodedPowerShell,
    [switch]$Cleanup
)

Write-Host "SIEM Detection Lab - Safe Event Simulation" -ForegroundColor Cyan
Write-Host "Run only inside the isolated lab environment." -ForegroundColor Yellow

if ($EncodedPowerShell) {
    Write-Host "[TEST] Running harmless encoded PowerShell command..."
    $Command = 'Write-Output "SIEM lab encoded PowerShell test"'
    $Bytes = [System.Text.Encoding]::Unicode.GetBytes($Command)
    $Encoded = [Convert]::ToBase64String($Bytes)
    powershell.exe -EncodedCommand $Encoded
}

if ($CreateTestAdmin) {
    Write-Host "[TEST] Creating temporary local admin user..."
    net user siemlabadmin "Password123!" /add
    net localgroup administrators siemlabadmin /add
}

if ($CreateScheduledTask) {
    Write-Host "[TEST] Creating harmless scheduled task..."
    schtasks /create /tn "SIEM-Lab-Test" /tr "cmd.exe /c echo SIEM Lab Test" /sc once /st 23:59 /f
}

if ($Cleanup) {
    Write-Host "[CLEANUP] Removing scheduled task and test user..."
    schtasks /delete /tn "SIEM-Lab-Test" /f 2>$null
    net localgroup administrators siemlabadmin /delete 2>$null
    net user siemlabadmin /delete 2>$null
}

Write-Host "Done." -ForegroundColor Green
