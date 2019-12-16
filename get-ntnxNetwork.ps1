$networks = get-ntnxnetwork |select vlanId, name, vswitchName|ft
$networks
