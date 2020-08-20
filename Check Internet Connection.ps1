# Check internet if it doesn't work it will Restart Adaprters. If this fails it will Reboot the PC
# It will do it in Intervals of 20 Minutes it should Retry 3 times if it works it will just Stop and then Wait 20 Minutes

$CheckOne = ping 8.8.8.8

If ($CheckOne -Match "Reply from 8.8.8.8") {"We have Connection"}
ElseIf ($CheckOne -Match "Ping request could not find host") {"No Internet connection Restarting Adapters" and Trying Again"}
Start-Sleep -Seconds 5

Restart-NetAdapter *

$CheckTwo = ping 8.8.8.8

If ($CheckTwo -Match "Reply from 8.8.8.8") {"We have a connection"}
ElseIf ($CheckTwo -Match "Ping request could not find host") {No Internet Connection Disabling and Restarting Adapters. Please check manually if this doesn't work"}
Start-Sleep -Seconds 5

Write-Host "Forcing Disable and Re-Enable Devices"
Write-Host "Targeted Devices Realtek Devices"
Get-PnpDevice| where {$_.friendlyname -like "Realtek*"}
$Realtek = Get-PnpDevice| where {$_.friendlyname -like "Realtek*"}
Write-Host "Disbaling"
$Realtek | Disable-PnpDevice -Confirm:$false
Write-host "Re-Enabling"
$Realtek | Enable-PnpDevice -Confirm:$false

$CheckThree = ping 8.8.8.8
If ($CheckThree -Match "Reply from 8.8.8.8") {"We have a connection"}
ElseIf ($CheckThree -Match "Ping request could not find host") {No Internet Connection Restarting PC in 10 Seconds. Please check manually if this doesn't work"}
Start-Sleep -Seconds 10

shutdown.exe /r /t 0