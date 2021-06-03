If script does not work by dragging it to powershell******

Step1.- Open powershell in administrator privelidges 
Step2.- Enter command "set-executionpolicy bypass" and accept when asked 
Step3.- Change path using "cd c:/users/USERNAME/desktop"
Step4.- Type first 3 initials of script then hit tab to auto complete then enter


Set-ExecutionPolicy Bypass

Y

cd $Env:UserProfile\Desktop

./Repair-internet-Script.ps1