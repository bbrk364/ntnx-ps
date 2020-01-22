<#
    .SYNOPSIS
        Menu Driven CMDlets 
    .DESCRIPTION
        Main Menu gives option to connect to a cluster or proceed to cmdlets. Menu will have a basic menu with get-commands, where the advanced 
		menu will make changes. 
#>




function mainMenu {
    $mainMenu = 'X'
    while($mainMenu -ne ''){
        Clear-Host
		#Setting the first menu options
		
        Write-Host "`n`t`t Nutanix Powershell CMDLets`n"
        Write-Host -ForegroundColor Cyan "Connect Options"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "1"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Connect to your Nutanix Cluster"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "2"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Im already connected"
        $mainMenu = Read-Host "`nSelection (leave blank to quit)"
        #IF statements below for the selected option above
		#subMenu1 is to the connect-cluster command
        if($mainMenu -eq 1){
            subMenu1
        }
        #subMenu2 takes you to the basic get-commands
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
			#Connect-nutanix cluster command with server variable
			
            Connect-NTNXCluster -Server $server -AcceptInvalidSSLCerts -ForcedConnection
            write-host "Connecting to Cluster..."

        }

}
function subMenu2 {
    $subMenu2 = 'X'
    while($subMenu2 -ne ''){
        Clear-Host
		##subMenu2 is the basic get-cmdlets can be expanded upon ##
		
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
            Write-Host -ForegroundColor DarkCyan " List Networks"
		Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "6"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Advanced CMDLets`n"
        $subMenu2 = Read-Host "`nSelection (leave blank to quit)"
        $timeStamp = Get-Date -Uformat %m%d%y%H%M
	   <# 
	   
        .SYNOPSIS
            Option 0 runs the script from the gethub repo currently

        .EXAMPLE
            $cluster = get-ntnxcluster |select ID, name, clusterExternalIPAddress, ClusterExternalDataServicesIPAddress, numNodes, blockSerials, version, externalsubnet, internalsubnet, nccversion, globalNfsWhiteList, hypervisorTypes, faultToleranceDomainType|format-list
            $cluster
    #>
	   
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
            Write-Host "Gathering Networks sit tight"
            $Networks = invoke-webrequest https://raw.githubusercontent.com/cloudcor-ntnx/ntnx-ps/master/get-ntnxNetwork.ps1
            invoke-expression $($Networks.content)
			Write-Host -ForegroundColor DarkCyan "`nScript execution complete."
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
		# Option 5
        if($subMenu2 -eq 6){
            advancedMenu1
		}	
        
    }
}
function advancedMenu1 {
    $advancedMenu1 = 'X'
    while($advancedMenu1 -ne ''){
        Clear-Host
	   ##advancedMenu1 runs cmdlets that will make changes to uvm's and the cluster  ##
		
        Write-Host "`n`t`t Advanced Nutanix Powershell CMDlets`n"
		Write-Host -ForegroundColor Red "These cmdlets do make changes, please consult PowerShell CMDlets reference before use"
		Write-Host -ForegroundColor Yellow "https://portal.nutanix.com/#/page/docs/details?targetId=API-Ref-AOS-v55:PowerShell-Cmdlets-Reference"
		
		Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "0"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " New VM"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "1"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " New Container"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "2"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Start Maintenance Mode"
		Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "3"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Stop Maintenance Mode"
		Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "4"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " New Network (ie. portgroup / vlan)"
	 Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "5"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " New VM's From CSV"
        $advancedMenu1 = Read-Host "`nSelection (leave blank to quit)"
        $timeStamp = Get-Date -Uformat %m%d%y%H%M
   <# 
	   
        .SYNOPSIS
            Option 0 runs the script from the gethub repo currently

        .EXAMPLE
            $VMName = Read-host -prompt 'Enter the Name of the VM'
            $vCPUs = Read-host -prompt 'Enter the # of vCPUs'
            $ramMB = Read-host -prompt 'Enter the amount of RAM in MB (example = 2048 for 2GB)'
            New-NTNXVirtualMachine -Name $VMName -NumVcpus $vCPUs -MemoryMb $ramMB
    #>
        if($advancedMenu1 -eq 0){
            Write-Host "Enter New VM Configuration"
            $NewVM = invoke-webrequest https://raw.githubusercontent.com/cloudcor-ntnx/ntnx-ps-advanced/master/new-vm.ps1
            invoke-expression $($NewVM.content)
			Write-Host -ForegroundColor DarkCyan "`nScript execution complete."
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Option 1
        if($advancedMenu1 -eq 1){
            Write-Host "Creating New Container stand-by"
            $NewContainer = invoke-webrequest https://raw.githubusercontent.com/cloudcor-ntnx/ntnx-ps-advanced/master/new-container.ps1
            invoke-expression $($NewContainer.content)
			Write-Host -ForegroundColor DarkCyan "`nScript execution complete."
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Option 2
        if($advancedMenu1 -eq 2){
            Write-Host "Enter Host to Enter Maintenance Mode"
            $HostsMaintenanceMode = invoke-webrequest https://raw.githubusercontent.com/cloudcor-ntnx/ntnx-ps-advanced/master/start-maintenancemode.ps1
            invoke-expression $($HostsMaintenanceMode.content)
			Write-Host -ForegroundColor DarkCyan "`nScript execution complete."
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
	   # Option 3
        if($advancedMenu1 -eq 3){
            Write-Host "Stop Maintenance Mode"
            $StopMaintenanceMode = invoke-webrequest https://raw.githubusercontent.com/cloudcor-ntnx/ntnx-ps/master/get-container-details.ps1
            invoke-expression $($StopMaintenanceMode.content)
	        Write-Host -ForegroundColor DarkCyan "`nScript execution complete."
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
		# Option 4
        if($advancedMenu1 -eq 4){
            Write-Host "New Network"
            $NewNetwork = invoke-webrequest https://raw.githubusercontent.com/cloudcor-ntnx/ntnx-ps-advanced/master/new-network.ps1
            invoke-expression $($NewNetwork.content)
			Write-Host -ForegroundColor DarkCyan "`nScript execution complete."
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
			# Option 5
        if($advancedMenu1 -eq 5){
            Write-Host "Create multiple VM's by importing csv"
	    Write-Host -ForegroundColor Yellow "https://drive.google.com/file/d/1yvxXVAc7mn4NHrZmv02boTb4lVhV4JJK/view?usp=sharing"
		
            $VMsfromCSV = invoke-webrequest https://raw.githubusercontent.com/cloudcor-ntnx/ntnx-ps-advanced/master/new-vm-from-csv.ps1
            invoke-expression $($VMsfromCSV.content)
			Write-Host -ForegroundColor DarkCyan "`nScript execution complete."
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
	
        
    }
}



mainMenu
