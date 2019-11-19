$myvarLoaded = Get-PSSnapin -Name NutanixCmdletsPSSnapin -ErrorAction SilentlyContinue | % {$_.Name}
if ($myvarLoaded -eq $null){Add-PSSnapin NutanixCmdletsPSSnapin}
# Cluster IP
$server = 'Your NTNX CLUSTER IP'

# Request & Verify credentials 
$credentials = Get-Credential -Message "**Enter your Nutanix Admin credentials here**"

$username = $credentials.username
$password = ConvertTo-SecureString $($credentials.GetNetworkCredential().password) -AsPlainText -Force

write-host "Connecting to Cluster..."
Connect-NTNXCluster -Server $server -UserName $UserName -Password $password -AcceptInvalidSSLCerts -ForcedConnection
write-host "Done!"
invoke-expression $($connect.content)
