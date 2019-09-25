$vms = get-ntnxvm |select ipaddresses, vmName, uuid, hostName, nonNdfsDetails, powerState |sort-object nonndfsdetails|ft -autosize
$vms
