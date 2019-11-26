function Show-Menu
{
    param (
        [string]$Title = 'Nutanix Powershell CMDLETS MENU'
    )
    Clear-Host
    Write-Host "================ $Title ================"
    Write-Host "X: Press 'X' to connect to a Nutanix Cluster
    Write-Host "1: Press '1' to list all the Vms."
    Write-Host "2: Press '2' to list all the hosts."
    Write-Host "3: Press '3' to list containers"
    Write-Host "4: Press '4' to do next thing "
    Write-Host "5: Press '5' to do next thing "
    Write-Host "6: Press '6' to do next thing "
    Write-Host "Q: Press 'Q' to quit."
}

function Connect-Cluster
{
Write-Host "Script Block to Display all the VMs"
$CONNECT = invoke-webrequest https://raw.githubusercontent.com/cloudcor-ntnx/ntnx-ps/master/connect-nutanixcluster.ps1
invoke-expression $($connect.content)
}

function List-VMs
{
Write-Host "Script Block to Display all the VMs"
$VMs = invoke-webrequest https://raw.githubusercontent.com/cloudcor-ntnx/ntnx-ps/master/get-ntnxvm.ps1
invoke-expression $($VMs.content)
}

function List-Hosts
{
Write-Host "Script Block to Display all the HOSTS"
$hosts = invoke-webrequest "https://raw.githubusercontent.com/cloudcor-ntnx/ntnx-ps/master/get-ntnxhost.ps1"
invoke-expression $($hosts.content)
}

function List-Containers
{
Write-Host "Script Block to Display all the Containers"
$containers = invoke-webrequest "https://raw.githubusercontent.com/cloudcor-ntnx/ntnx-ps/master/get-container-details.ps1"
invoke-expression $($containers.content)
}

do

{
    Show-Menu –Title 'Nutanix Powershell CMDLETS MENU'
    $input = Read-Host "what do you want to do?"
    switch ($input)
}
    {
        'X' {               
                Connect-NTNXcluster
            }
        '1' {               
                List-Vms
            }
        '2' {
                List-Hosts
            }
        '3' {
                List-Containers
            }
        'q' {
                 return
            }
    }
    pause
}
until ($input -eq 'q')
