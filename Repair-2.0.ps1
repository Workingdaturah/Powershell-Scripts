<#

This script itself will utilize very common techinques for fixing a PCs Errors in case nothing works at first
This is the first thing to test and then proceed with manual fixes and targeted repairs
This script will fix common MS problems not mewant to be a Fix All. I will try and utilize this first for fixes as this
will not delete anything on the PC itself.

#>

################################
Write-Host "Starting Repairs, nothing will be deleted"
Write-Host "Loading"
Write-Host ""
Write-Host "Using SFC"
sfc /scannow
Write-Host "Done with SFC, moving to DISM"
Write-Host ""
Write-Host "Checking Health"
DISM /Online /Cleanup-Image /CheckHealth
Write-Host "Scanning Health"
Write-Host ""
DISM /Online /Cleanup-Image /ScanHealth
Write-Host "Restoring HEalth"
Write-Host ""
DISM /Online /Cleanup-Image /RestoreHealth
Write-Host "Done"
Write-Host ""
###### UPDATES SECTION #########
Write-Host "Applying and Boosting PC Performance this will Clean (Delete) or Edit any missconfigured and unnecessary Apps"
Write-Host ""
Write-Host "Searching and applying updates"
Install-Module PSWindowsUpdate
Write-Host " Searching for Updates"
Get-WindowsUpdate
Write-Host "Downloading and Installing Updates"
Install-WindowsUpdate
Write-Host ""
Write-Host "Rebooting"
shutdown.exe /f /r /t 0
