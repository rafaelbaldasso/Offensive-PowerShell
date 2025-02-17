param($target)
if(!$target) {
    Write-Output "`n [#] Full Port Scan"   
    Write-Output " [>] Usage: .\full_port_scan.ps1 HOST"
    Write-Output " [>] Example: .\full_port_scan.ps1 172.16.1.100`n"
} else {
    Write-Output "`n [#] Full Port Scan"
    Write-Output "`n [>] Target: $target"
    Write-Output "`n [>] Open Ports:"
try {foreach ($port in 1..65535) {
if (Test-NetConnection $target -Port $port -WarningAction SilentlyContinue -InformationLevel Quiet) {
    Write-Output " [+] $port"
}}
} catch {}
Write-Output ""
}
