# Offensive PowerShell

\# Cmdlet Help  
`Get-Help <CMDLET>`  
\# List all running processes  
`Get-Process`  
\# Execution Policy Information  
`Get-ExecutionPolicy`  
\# Allow unsigned scripts execution for the current user  
`Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser`  
\# Get Current Computer Information  
`Get-ComputerInfo -Property CsName,WindowsVersion,WindowsBuildLabEx,WindowsEditionId,OsArchitecture,CsProcessors,CsTotalPhysicalMemory`  
\# Get Network Interfaces Information  
`Get-NetAdapter`  
`Get-NetIPAddress`  
`Get-NetIPConfiguration`  
\# Get Local Users Information  
`Get-LocalUser | Select-Object -Property Name,SID,Enabled,LastLogon`  

