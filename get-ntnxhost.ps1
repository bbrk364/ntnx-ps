	   <# 
	   
        .SYNOPSIS
            get-hosts with select parameters

        .EXAMPLE
            $cluster = get-ntnxcluster |select ID, name, clusterExternalIPAddress, ClusterExternalDataServicesIPAddress, numNodes, blockSerials, version, externalsubnet, internalsubnet, nccversion, globalNfsWhiteList, hypervisorTypes, faultToleranceDomainType|format-list
            $cluster
    #>

$hosts = get-ntnxhost |select name, uuid, serviceVMExternalIP, serial, blockSerial, blockModelName, state |sort-object |ft -autosize
$hosts
