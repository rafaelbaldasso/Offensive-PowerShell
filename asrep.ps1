$Searcher = New-Object DirectoryServices.DirectorySearcher
$Searcher.Filter = "(&(objectCategory=User)(userAccountControl:1.2.840.113556.1.4.803:=4194304))"
$Searcher.PropertiesToLoad.Add("samaccountname") | Out-Null
$Results = $Searcher.FindAll()

ForEach ($Result in $Results) {
    Write-Output "AS-REP Roastable User: $($Result.Properties.samaccountname)"
}
