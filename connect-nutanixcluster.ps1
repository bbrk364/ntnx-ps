$myvarLoaded = Get-PSSnapin -Name NutanixCmdletsPSSnapin -ErrorAction SilentlyContinue | % {$_.Name}
if ($myvarLoaded -eq $null){Add-PSSnapin NutanixCmdletsPSSnapin}
# Cluster IP
$server = 'Your NTNX CLUSTER IP'
write-host "Connecting to Cluster..."
Connect-NTNXCluster -Server $server -AcceptInvalidSSLCerts -ForcedConnection
write-host "Done!"
invoke-expression $($connect.content)

