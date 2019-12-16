$cluster = get-ntnxcluster |select ID, name, clusterExternalIPAddress, ClusterExternalDataServicesIPAddress, numNodes, blockSerials, version, externalsubnet, internalsubnet, nccversion, globalNfsWhiteList, hypervisorTypes, faultToleranceDomainType|format-list
$cluster
