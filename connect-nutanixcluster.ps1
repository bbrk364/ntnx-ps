$myvarLoaded = Get-PSSnapin -Name NutanixCmdletsPSSnapin -ErrorAction SilentlyContinue | % {$_.Name}
if ($myvarLoaded -eq $null){Add-PSSnapin NutanixCmdletsPSSnapin}
$server = 'Your NTNX CLUSTER IP'
Connect-NTNXCluster -Server $server -AcceptInvalidSSLCerts -ForcedConnection
write-host "Connecting to Cluster..."
write-host "Done!"


