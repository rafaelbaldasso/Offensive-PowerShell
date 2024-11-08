# Offensive PowerShell

\# Cmdlet Help  
`Get-Help <CMDLET>`  
\# List all running processes  
`Get-Process`  
\# Execution Policy Information  
`Get-ExecutionPolicy`  
\# Allow unsigned scripts execution for the current user  
`Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser`  
`powershell -ep bypass`  
\# Get Current Computer Information  
`Get-ComputerInfo -Property CsName,WindowsVersion,WindowsBuildLabEx,WindowsEditionId,OsArchitecture,CsProcessors,CsTotalPhysicalMemory`  
\# Get Network Interfaces Information  
`Get-NetAdapter`  
`Get-NetIPAddress`  
`Get-NetIPConfiguration`  
\# Get Local Users Information  
`Get-LocalUser | Select-Object Name,SID,Enabled,LastLogon,Created,Modified`  
\# Get Local Groups Information  
`Get-LocalGroup`  
`Get-LocalGroupMember -Group <GROUP NAME>`  
\# Get Firewall Information  
` Get-NetFirewallProfile`  
\# Get Defender Status  
`Get-MpComputerStatus | Select AntivirusEnabled,RealTimeProtectionEnabled,IoavProtectionEnabled,AntispywareEnabled,IsTamperProtected`  
\# List AV Products  
`Get-CimInstance -Namespace root/SecurityCenter2 -ClassName AntivirusProduct`  
`'0x{0:x}' -f <ProductState>`  (10 from the 4th number position = on)  
\# Disable UAC (requires admin)  
`cmd.exe /c "C:\Windows\System32\cmd.exe /k %windir%\System32\reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f"`  
\# Disables realtime monitoring (requires admin)    
`Set-MpPreference -DisableRealtimeMonitoring $true`  
\# Disables scanning for downloaded files or attachments (requires admin)    
`Set-MpPreference -DisableIOAVProtection $true`  
\# Disable behaviour monitoring (requires admin)    
`Set-MPPreference -DisableBehaviourMonitoring $true`  
\# Make exclusion for a certain folder (requires admin)    
`Add-MpPreference -ExclusionPath "C:\Windows\Temp"`  
\# Disables cloud detection (requires admin)    
`Set-MPPreference -DisableBlockAtFirstSeen $true`  
\# Disables scanning of .pst and other email formats (requires admin)    
`Set-MPPreference -DisableEmailScanning $true`  
\# Disables script scanning during malware scans (requires admin)    
`Set-MPPReference -DisableScriptScanning $true`  
\# Exclude files by extension (requires admin)  
`Set-MpPreference -ExclusionExtension "ps1"`  
