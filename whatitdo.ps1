function mainMenu {
    $mainMenu = 'X'
    while($mainMenu -ne ''){
        Clear-Host
        Write-Host "`n`t`t Nutanix Powershell CMDLets`n"
        Write-Host -ForegroundColor Cyan "Main Menu"
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
    while($subMenu1 -ne ''){
        Clear-Host
        Write-Host "`n`t`t Connect to your Nutanix Cluster`n"
        Write-Host -ForegroundColor Cyan "Sub Menu 1"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "1"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
		     Write-Host -ForegroundColor DarkCyan "Connect to your cluster"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "2"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
		     Write-Host -ForegroundColor DarkCyan "Proceed to CMDlets"

        $subMenu1 = Read-Host "`nSelection (leave blank to quit)"
        $timeStamp = Get-Date -Uformat %m%d%y%H%M
        # Option 1
        if($subMenu1 -eq 1){
		    $myvarLoaded = Get-PSSnapin -Name NutanixCmdletsPSSnapin -ErrorAction SilentlyContinue | % {$_.Name}
            if ($myvarLoaded -eq $null){Add-PSSnapin NutanixCmdletsPSSnapin}
            $server = read-host "Your NTNX CLUSTER IP"
            Connect-NTNXCluster -Server $server -AcceptInvalidSSLCerts -ForcedConnection
            write-host "Connecting to Cluster..."

        }
        # Option 2
        if($subMenu1 -eq 2){
            subMenu2
        }
    }
}

function subMenu2 {
    $subMenu2 = 'X'
    while($subMenu2 -ne ''){
        Clear-Host
        Write-Host "`n`t`t Nutanix Powershell CMDlets`n"
        Write-Host -ForegroundColor Cyan "Sub Menu 2"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "1"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " List VMs"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "2"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " List Hosts"
		Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "3"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " List Containers"
        $subMenu2 = Read-Host "`nSelection (leave blank to quit)"
        $timeStamp = Get-Date -Uformat %m%d%y%H%M
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
			Write-Host -ForegroundColor DarkCyan "`nScript execution complete."
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
    }
}

mainMenu
