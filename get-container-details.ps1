$container = Get-NTNXContainer | select @{name="Container_ID";expression={$_.id.substring($_.id.indexof(":") + 2)}},Name, markedForRemoval, replicationFactor, oplogReplicationFactor, nfsWhitelist
$container
