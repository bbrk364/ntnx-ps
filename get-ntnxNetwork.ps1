$networks = get-ntnxnetwork |select vlanId, name, vswitchName|format-list
$networks
