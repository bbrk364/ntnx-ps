$container = Get-NTNXContainer | select @{name="Container_ID";expression={$_.id.substring($_.id.indexof(":") + 2)}},Name,@{name="Free_Space_[gb]";expression={((Get-NTNXContainerStat -id ($_.id.substring($_.id.indexof(":") + 2)) -Metrics storage.user_free_bytes).values)}}
$container
