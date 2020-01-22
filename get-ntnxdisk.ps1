	   <# 
	   
        .SYNOPSIS
            get-disk information with the selected parameters
        .EXAMPLE
            $cluster = get-ntnxcluster |select ID, name, clusterExternalIPAddress, ClusterExternalDataServicesIPAddress, numNodes, blockSerials, version, externalsubnet, internalsubnet, nccversion, globalNfsWhiteList, hypervisorTypes, faultToleranceDomainType|format-list
            $cluster
    #>

$clusterdisks = Get-NTNXDisk |select location, id, storagetiername, hostName, cvmipaddress, mountpath, markedforremoval, datamigrated, online,
diskstatus, selfencryptingdrive |sort-object nonndfsdetails|format-list
$clusterdisks
