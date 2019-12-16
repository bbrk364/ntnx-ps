$networks = get-ntnxnetwork |select vlanId, name, vswitchName |sort-object vlanID|ft
$networks
