	   <# 
	   
        .SYNOPSIS
            list networks with selected parameters
        .EXAMPLE
            $cluster = get-ntnxcluster |select ID, name, clusterExternalIPAddress, ClusterExternalDataServicesIPAddress, numNodes, blockSerials, version, externalsubnet, internalsubnet, nccversion, globalNfsWhiteList, hypervisorTypes, faultToleranceDomainType|format-list
            $cluster
    #>

$networks = get-ntnxnetwork |select vlanId, name, vswitchName |sort-object vlanID|ft
$networks
