$networks = get-ntnxnetwork |select vlanId, name, vswitchName|ft -autosize
$networks
