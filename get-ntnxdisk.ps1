$clusterdisks = Get-NTNXDisk |select location, id, storagetiername, hostName, cvmipaddress, mountpath, markedforremoval, datamigrated, online,
diskstatus, selfencryptingdrive |sort-object nonndfsdetails|format-list
$clusterdisks
