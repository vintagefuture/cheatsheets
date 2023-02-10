## Enable automatic login on a Windows VM

**Step 1** Open the ‘Run’ dialogue box by entering the shortcut [Windows] + [R] and enter the CMD command `regedit`. This will open your system’s Registry Editor.
Note

**Step 2** Enter the path `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsNT\CurrentVersion\PasswordLess\Device`

**Step 3** Double click on ‘DevicePasswordLessBuildVersion’ and change the value from ‘2’ to ‘0’ in the Value data menu

**Step 4** Open the ‘Run’ dialogue box again with the shortcut [Windows] + [R] and enter `netplwiz`

**Step 5** The ‘User accounts’ menu will open. Untick the box beside *Users must enter a user name and password to use this computer*

**Step 6** Enter the current password to confirm changes and click OK

Source: https://www.ionos.co.uk/digitalguide/server/configuration/windows-11-automatic-login/

## Activate virtualization

Start Windows Powershell as Administrator and run these commands to activate the feautres.

```powershell
Enable-WindowsOptionalFeature -Online -FeatureName containers –All
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V –All
```
