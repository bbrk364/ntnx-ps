$myvarLoaded = Get-PSSnapin -Name NutanixCmdletsPSSnapin -ErrorAction SilentlyContinue | % {$_.Name}
if ($myvarLoaded -eq $null){Add-PSSnapin NutanixCmdletsPSSnapin}
$ntnxcluster = READ-host "Name/IP of cluster?"
connect-nutanixcluster -name $ntnxcluster -AcceptInvalidSSLCerts
invoke-expression $($connect.content)
