	   <# 
	   
        .SYNOPSIS
            get-vm with set parameters

        .EXAMPLE
            $cluster = get-ntnxcluster |select ID, name, clusterExternalIPAddress, ClusterExternalDataServicesIPAddress, numNodes, blockSerials, version, externalsubnet, internalsubnet, nccversion, globalNfsWhiteList, hypervisorTypes, faultToleranceDomainType|format-list
            $cluster
    #>

$vms = get-ntnxvm |select ipaddresses, vmName, uuid, hostName, nonNdfsDetails, powerState |sort-object nonndfsdetails|ft -autosize
$vms
