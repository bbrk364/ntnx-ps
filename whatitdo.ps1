function Show-Menu
{
    param (
        [string]$Title = 'My Menu'
    )
    Clear-Host
    Write-Host "================ $Title ================"
    Write-Host "1: Press '1' to list all the Vms."
    Write-Host "2: Press '2' to "
    Write-Host "3: Press '2' to "
    Write-Host "2: Press '2' to "
    Write-Host "2: Press '2' to "
    Write-Host "2: Press '2' to "
    Write-Host "Q: Press 'Q' to quit."
}

function List-VMs
{
        Write-Host "Script Block to Display all the VMs"
$VMs = invoke-webrequest https://raw.githubusercontent.com/cloudcor-ntnx/ntnx-ps/master/get-ntnxvm.ps1
invoke-expression $($VMs.content)
}
function Delete-VMs
{
        Write-Host "Script Block"
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
                ACTION
            }
        'q' {
                 return
            }
    }
    pause
}
until ($input -eq 'q')
