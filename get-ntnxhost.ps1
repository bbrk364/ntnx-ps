$hosts = get-ntnxhost |select name, uuid, serviceVMExternalIP, serial, blockSerial, blockModelName, state |sort-object |ft -autosize
$hosts
