$vms = get-ntnxvm |select vmName, uuid, hostName, nonNdfsDetails, powerState
$vms
