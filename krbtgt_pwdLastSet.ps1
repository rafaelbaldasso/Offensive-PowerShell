param($domain)
# Alternatively, get the current domain:
# [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()
$Searcher = New-Object DirectoryServices.DirectorySearcher
$Searcher.SearchRoot = "LDAP://$domain"
$Searcher.Filter = "(sAMAccountName=krbtgt)"
$Searcher.PropertiesToLoad.Add("pwdLastSet") | Out-Null

$result = $Searcher.FindOne()

if ($result -ne $null) {
    $pwdLastSet = $result.Properties["pwdlastset"][0]
    $lastSetDate = [DateTime]::FromFileTime($pwdLastSet)
    Write-Output "`n[$domain] krbtgt account password last set on: $lastSetDate`n"
} else {
    Write-Output "`n[$domain] krbtgt account not found`n"
}
