### If the script doesn't work by dragging it to PowerShell:

1. Open PowerShell with administrator privileges.
2. Run the command `Set-ExecutionPolicy Bypass` and accept when prompted.
3. Change the path using `cd C:/Users/USERNAME/Desktop`.
4. Type the first 3 initials of the script, then hit Tab to autocomplete, and press Enter.

```powershell
Set-ExecutionPolicy Bypass

Y

cd $Env:UserProfile\Desktop

./Repair-Internet-Script.ps1
