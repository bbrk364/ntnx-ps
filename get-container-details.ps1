	   <# 
	   
        .SYNOPSIS
            list containers with select parameters
        .EXAMPLE
            $cluster = get-ntnxcluster |select ID, name, clusterExternalIPAddress, ClusterExternalDataServicesIPAddress, numNodes, blockSerials, version, externalsubnet, internalsubnet, nccversion, globalNfsWhiteList, hypervisorTypes, faultToleranceDomainType|format-list
            $cluster
    #>
$container = Get-NTNXContainer | select @{name="Container_ID";expression={$_.id.substring($_.id.indexof(":") + 2)}},Name, markedForRemoval, replicationFactor, oplogReplicationFactor, nfsWhitelist |Sort-Object name |format-table -autosize 
$container
