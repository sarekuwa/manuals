In Windows 10, you can launch various system utilities by typing their commands in the **Run** dialog (`Win + R`) or Command Prompt. Here are the most useful ones, similar to `ncpa.cpl` (Network Connections):

### Control Panel Applets (`.cpl`)
| Command | Description |
|---------|-------------|
| `ncpa.cpl` | Network Connections |
| `appwiz.cpl` | Programs and Features (Add/Remove Programs) |
| `sysdm.cpl` | System Properties |
| `inetcpl.cpl` | Internet Properties |
| `firewall.cpl` | Windows Defender Firewall |
| `main.cpl` | Mouse Properties |
| `powercfg.cpl` | Power Options |
| `desk.cpl` | Display Settings (Desktop) |
| `mmsys.cpl` | Sound (Playback/Recording devices) |
| `timedate.cpl` | Date and Time |
| `intl.cpl` | Region and Language |
| `joy.cpl` | Game Controllers |
| `telephon.cpl` | Phone and Modem |
| `wscui.cpl` | Security and Maintenance |

### Microsoft Management Consoles (`.msc`)
| Command | Description |
|---------|-------------|
| `services.msc` | Services |
| `compmgmt.msc` | Computer Management |
| `devmgmt.msc` | Device Manager |
| `diskmgmt.msc` | Disk Management |
| `eventvwr.msc` | Event Viewer |
| `lusrmgr.msc` | Local Users and Groups |
| `gpedit.msc` | Local Group Policy Editor |
| `taskschd.msc` | Task Scheduler |
| `perfmon.msc` | Performance Monitor |
| `certlm.msc` | Certificates (Local Machine) |
| `rsop.msc` | Resultant Set of Policy |

### System Folders & Settings
| Command | Description |
|---------|-------------|
| `control` | Opens Control Panel |
| `control printers` | Devices and Printers |
| `control keyboard` | Keyboard Properties |
| `control userpasswords2` | User Accounts (Advanced) |
| `control /name Microsoft.WindowsUpdate` | Windows Update settings |
| `control /name Microsoft.NetworkAndSharingCenter` | Network and Sharing Center |
| `control /name Microsoft.BackupAndRestore` | Backup and Restore (Windows 7) |
| `ms-settings:` | Opens Windows Settings (modern UI) – e.g., `ms-settings:privacy-webcam` |

### Other Useful Commands
| Command | Description |
|---------|-------------|
| `cmd` | Command Prompt |
| `powershell` | PowerShell |
| `regedit` | Registry Editor |
| `taskmgr` | Task Manager |
| `msconfig` | System Configuration |
| `dxdiag` | DirectX Diagnostic Tool |
| `cleanmgr` | Disk Cleanup |
| `charmap` | Character Map |
| `osk` | On‑Screen Keyboard |
| `magnify` | Magnifier |
| `snippingtool` | Snipping Tool |
| `calc` | Calculator |
| `notepad` | Notepad |
| `write` | WordPad |
| `mspaint` | Paint |
| `explorer` | File Explorer |

To run any of these, press `Win + R`, type the command, and hit Enter. You can also use them directly in Command Prompt or PowerShell.


### Restart Win 10 Pnp device
pnputil /restart-device "USB\VID_0000&PID_0003\5&202ecbb1&0&8" ; Get-PnpDevice -InstanceId "USB\VID_0000&PID_0003\5&202ecbb1&0&8" | Disable-PnpDevice -Confirm:$false -ErrorAction SilentlyContinue ; Start-Sleep 2 ; Enable-PnpDevice -InstanceId "USB\VID_0000&PID_0003\5&202ecbb1&0&8" -Confirm:$false

### Windows 10 Update stop

# Stop and disable services

Stop-Service wuauserv, bits, dosvc, UsoSvc -Force
Set-Service wuauserv -StartupType Disabled
Set-Service bits -StartupType Disabled
Set-Service dosvc -StartupType Disabled
Set-Service UsoSvc -StartupType Disabled

# Block automatic updates via registry
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "NoAutoUpdate" -Value 1 -Type DWord
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "AUOptions" -Value 1 -Type DWord

# Disable scheduled tasks that trigger updates
Get-ScheduledTask -TaskPath "\Microsoft\Windows\UpdateOrchestrator\" | Disable-ScheduledTask


# Remove already installed

Stop-Service wuauserv, bits, dosvc, UsoSvc -Force
Remove-Item -Path "C:\Windows\SoftwareDistribution" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\Windows\System32\catroot2" -Recurse -Force -ErrorAction SilentlyContinue
Start-Service wuauserv, bits, dosvc, UsoSvc

wmic qfe list brief /format:table

wusa /uninstall /kb:KB1234567 /quiet /norestart

DISM /Online /Cleanup-Image /RestoreHealth
Dism /Online /Get-Packages | Select-String -Pattern "KB5066746"

Get-WmiObject -Class Win32_QuickFixEngineering | Where-Object { $_.HotFixID -eq "KB890830" -or $_.HotFixID -eq "KB5066746" }

Stop-Service wuauserv, bits, dosvc -Force
Remove-Item -Path "C:\Windows\SoftwareDistribution" -Recurse -Force -ErrorAction SilentlyContinue


### Remove autostartup process


# Run this in PowerShell as Administrator
# Kill any running Chromium processes
Get-Process -Name chromium* -ErrorAction SilentlyContinue | Stop-Process -Force

# Remove startup entries from Registry
$regPaths = @(
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run",
    "HKLM:\Software\Microsoft\Windows\CurrentVersion\Run"
)
foreach ($path in $regPaths) {
    Get-ItemProperty -Path $path -Name "*chromium*" -ErrorAction SilentlyContinue | ForEach-Object {
        Remove-ItemProperty -Path $path -Name $_.PSChildName -Force
    }
}
# Remove from startup folder
$startupFolders = @(
    "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup",
    "$env:PROGRAMDATA\Microsoft\Windows\Start Menu\Programs\Startup"
)
foreach ($folder in $startupFolders) {
    Get-ChildItem $folder -Filter "*chromium*" -ErrorAction SilentlyContinue | Remove-Item -Force
}

# Disable scheduled tasks with "chromium"
Get-ScheduledTask | Where-Object { $_.TaskName -like "*chromium*" } | Disable-ScheduledTask -ErrorAction SilentlyContinue
Write-Host "Chromium startup entries removed. Reboot to apply fully." -ForegroundColor Green