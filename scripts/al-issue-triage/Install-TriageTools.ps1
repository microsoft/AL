[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$bcContainerHelperVersion = '6.1.17'

dotnet tool install --global Microsoft.Dynamics.BusinessCentral.Development.Tools --prerelease
npm install --global @github/copilot@1.0.79-9
Install-Module BcContainerHelper -RequiredVersion $bcContainerHelperVersion `
    -Force -Scope CurrentUser -Repository PSGallery

$alVersion = (& al --version 2>&1 | Out-String).Trim()
if (-not $alVersion) {
    throw 'The AL Development Tools installation did not report a version.'
}

$altoolPath = (Get-Command al -ErrorAction Stop).Source
"ALTOOL_VERSION=$alVersion" | Add-Content -Path $env:GITHUB_ENV
"ALTOOL_PATH=$altoolPath" | Add-Content -Path $env:GITHUB_ENV
