# Performance Script
# Should be something like a Fix All but only if necessary. it's like a +4 Card on UNO
# It will apply a few of the Tips and Tricks recommended by Microsoft to up the Performance of the PC
# Because of the various Steps this might take some time. Not fully automated needs small interaction
# Author : Adrian Novoa
# Version 1.0
# WARNING: This script is as-is use at your own risk as this will Force apply 
# any updates or modify default settings and install 3rd party Repositories for PowerShell

###### UPDATES SECTION #########

Write-Host "Applying and Boosting PC Performance this will Clean (Delete) or Edit any missconfigured and unnecessary Apps"
Write-Host ""
Write-Host "Searching and applying updates"
Install-Module PSWindowsUpdate
Write-Host " Searching for Updates"
Get-WindowsUpdate
Write-Host "Downloading and Installing Updates"
Install-WindowsUpdate
Write-Host "Skipping Reboot"
Write-Host ""
Write-Host " Optimizing C: Drive "
######## DEFRAG SECTION ############
Write-Host "Optimizing C Drive, will take a while!!"
Optimize-Volume -DriveLetter C -Defrag -Verbose

#############DISK CLEANUP SECTION#####################
# It needs interaction to choose what is being deleted

Write-Host 'Setup Files to Clean'
CleanMgr.exe /sageset:1337

Write-Host 'Starting CleanMgr.exe...'
CleanMgr.exe/sagerun:1337

################ EDIT STARTUP APPS ##################

msconfig

#####################################################

Write-Host 'Rebooting to complete Cleanup and Performance....'
SHUTDOWN.EXE /r /f /t 0