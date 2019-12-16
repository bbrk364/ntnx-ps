function mainMenu {
    $mainMenu = 'X'
    while($mainMenu -ne ''){
        Clear-Host
        Write-Host "`n`t`t Nutanix Powershell CMDLets`n"
        Write-Host -ForegroundColor Cyan "Connect Options"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "1"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Connect to your Nutanix Cluster"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "2"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Im already connected"
        $mainMenu = Read-Host "`nSelection (leave blank to quit)"
        # Connect to cluster 
        if($mainMenu -eq 1){
            subMenu1
        }
        # Launch submenu2
        if($mainMenu -eq 2){
            subMenu2
        }
    }
}

function subMenu1 {
    $subMenu1 = 'X'
    if($subMenu1 -ne ''){
        Clear-Host
        Write-Host "`n`t`t Connect to your Nutanix Cluster`n"
        Write-Host -ForegroundColor Cyan "Enter Nutanix Cluster IP"
		

		    $myvarLoaded = Get-PSSnapin -Name NutanixCmdletsPSSnapin -ErrorAction SilentlyContinue | % {$_.Name}
            if ($myvarLoaded -eq $null){Add-PSSnapin NutanixCmdletsPSSnapin}
            $server = read-host "Your NTNX CLUSTER IP"
            Connect-NTNXCluster -Server $server -AcceptInvalidSSLCerts -ForcedConnection
            write-host "Connecting to Cluster..."

        }

}
function subMenu2 {
    $subMenu2 = 'X'
    while($subMenu2 -ne ''){
        Clear-Host
        Write-Host "`n`t`t Nutanix Powershell CMDlets`n"
        Write-Host -ForegroundColor Cyan "List Items"
		Write-Host -ForegroundColor Red "These cmdlets do not make changes, please select advanced for more cmdlets"
		
		Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "0"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Cluster details"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "1"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " List VMs"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "2"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " List Hosts"
		Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "3"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " List Containers"
		Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "4"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " List Disks"
		Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "5"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Advanced CMDLets`n"
        $subMenu2 = Read-Host "`nSelection (leave blank to quit)"
        $timeStamp = Get-Date -Uformat %m%d%y%H%M
	   # Option 0
        if($subMenu2 -eq 0){
            Write-Host "Cluster Details"
            $Cluster = invoke-webrequest https://raw.githubusercontent.com/cloudcor-ntnx/ntnx-ps/master/get-ntnxcluster.ps1
            invoke-expression $($Cluster.content)
			Write-Host -ForegroundColor DarkCyan "`nScript execution complete."
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Option 1
        if($subMenu2 -eq 1){
            Write-Host "Gathering VM's sit tight"
            $VMs = invoke-webrequest https://raw.githubusercontent.com/cloudcor-ntnx/ntnx-ps/master/get-ntnxvm.ps1
            invoke-expression $($VMs.content)
			Write-Host -ForegroundColor DarkCyan "`nScript execution complete."
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Option 2
        if($subMenu2 -eq 2){
            Write-Host "Gathering Hosts sit tight"
            $Hosts = invoke-webrequest https://raw.githubusercontent.com/cloudcor-ntnx/ntnx-ps/master/get-ntnxhost.ps1
            invoke-expression $($Hosts.content)
			Write-Host -ForegroundColor DarkCyan "`nScript execution complete."
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
	   # Option 3
        if($subMenu2 -eq 3){
            Write-Host "Gathering Containers sit tight"
            $Containers = invoke-webrequest https://raw.githubusercontent.com/cloudcor-ntnx/ntnx-ps/master/get-container-details.ps1
            invoke-expression $($Containers.content)
	    Start-Sleep -s 5
	         	Write-Host -ForegroundColor DarkCyan "`nScript execution complete."
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
		# Option 4
        if($subMenu2 -eq 4){
            Write-Host "Gathering Disks sit tight"
            $Disks = invoke-webrequest https://raw.githubusercontent.com/cloudcor-ntnx/ntnx-ps/master/get-ntnxdisk.ps1
            invoke-expression $($Disks.content)
			Write-Host -ForegroundColor DarkCyan "`nScript execution complete."
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
		# Option 5
        if($subMenu2 -eq 5){
            advancedMenu1
		}	
        
    }
}
function advancedMenu1 {

        Clear-Host
        Write-Host "`n`t`t COMING SOON`n"
        Write-Host -ForegroundColor Cyan "MORE TO COME"
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)

        }



mainMenu
