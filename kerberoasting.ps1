$Searcher = New-Object DirectoryServices.DirectorySearcher
$Searcher.Filter = "(&(objectCategory=User)(servicePrincipalName=*))"
$Searcher.PropertiesToLoad.Add("samaccountname") | Out-Null
$Searcher.PropertiesToLoad.Add("servicePrincipalName") | Out-Null
$Results = $Searcher.FindAll()

ForEach ($Result in $Results) {
    Write-Output "User: $($Result.Properties.samaccountname) - SPN: $($Result.Properties.serviceprincipalname)"
}
