# Internet Repair Script
# Author Adrian Novoa
# Version 1.1
# A quick command script that will help restore the internet without messing on the Custom DNS and Static IP"s
Write-Host "Quick Repair Script V. 1.1"

# Grabs System info

Write-host "Grabbing System Info"
systeminfo.exe

# Restarts Network Adapters

Write-Host "Restarting Network"
Restart-NetAdapter -Name *

# Flushes, Releases and Renew IP

Write-host "Flushing, Releasing, Renewing IP Address"
Clear-DnsClientCache
ipconfig /release
ipconfig /flushdns
ipconfig /renew

# Resets Sockets

Write-Host "Resetting Socks"
netsh winsock reset
netsh int ip reset

# Extra Step to disable drivers and reactivate them. Why it works? No Idea

Write-Host "Forcing Disable and Re-Enable Devices"
Write-Host "Targeted Devices Realtek Devices"
Get-PnpDevice| where {$_.friendlyname -like "Realtek*"}
$Realtek = Get-PnpDevice| where {$_.friendlyname -like "Realtek*"}
Write-Host "Disbaling"
$Realtek | Disable-PnpDevice -Confirm:$false
Write-host "Re-Enabling"
$Realtek | Enable-PnpDevice -Confirm:$false
Write-Host "If Errors still persist Download IOBIT and update DRIVERS ONLY"