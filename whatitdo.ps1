function Show-Menu
{
    param (
        [string]$Title = 'My Menu'
    )
    Clear-Host
    Write-Host "================ $Title ================"
    Write-Host "1: Press '1' to list all the Vms."
    Write-Host "2: Press '2' to get the cluster data state."
    Write-Host "3: Press '3' to do next thing"
    Write-Host "4: Press '4' to do next thing "
    Write-Host "5: Press '5' to do next thing "
    Write-Host "6: Press '6' to do next thing "
    Write-Host "Q: Press 'Q' to quit."
}

function List-VMs
{
        Write-Host "Script Block to Display all the VMs"
$VMs = invoke-webrequest https://raw.githubusercontent.com/cloudcor-ntnx/ntnx-ps/master/get-ntnxvm.ps1
invoke-expression $($VMs.content)
}

function ClusDatastate
{
$localID = get-ntnxcluster |select uuid
        Write-Host "Script Block"
Get-NTNXClusterDataState -id $localID
}

do
{
    Show-Menu –Title 'My Menu'
    $input = Read-Host "what do you want to do?"
    switch ($input)
    {
        '1' {               
                List-Vms
            }
        '2' {
                Get-clusterdatastate
            }
        'q' {
                 return
            }
    }
    pause
}
until ($input -eq 'q')
