Write-Host "`n=== Current Domain ===`n"
[System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()

Write-Host "`n=== FQDN ===`n"
whoami /fqdn

Write-Host "`n=== DCs ===`n"
nltest /dclist:
nltest /dsgetdc:

Write-Host "`n=== Domain Trusts ===`n"
nltest /domain_trusts

Write-Host "`n=== Domain Password Policy ===`n"
net accounts /domain
