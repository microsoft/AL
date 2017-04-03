& ' C:\Program Files (x86)\Microsoft Dynamics NAV\100\RoleTailored Client\NavModelTools.ps1 ' | Out-Null

$instance = 'Navision_main'

$alProjectLike = 'ALProject*'
$designerExtLike = 'Designer_*'

Get-NAVAppInfo $instance | Where-Object { $_.Name -like $alProjectLike -or $_.Name -like $designerExtLike } | `
    ForEach-Object { 
        Write-Host ('Removing ' + $_.Name)
        Uninstall-NAVApp -Name $_.Name -ServerInstance $instance
        Unpublish-NAVApp -Name $_.Name -ServerInstance $instance 
    }