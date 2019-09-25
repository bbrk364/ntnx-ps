$vms = get-ntnxvm |select ipaddresses, vmName, uuid, hostName, nonNdfsDetails, powerState |ft -autosize
$vms
