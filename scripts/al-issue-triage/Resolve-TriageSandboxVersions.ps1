[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [string] $ApplicationVersion,

    [Parameter(Mandatory)]
    [string] $PlatformVersion
)

$ErrorActionPreference = 'Stop'

function ConvertTo-ManifestVersion {
    param(
        [Parameter(Mandatory)]
        [string] $Version,

        [Parameter(Mandatory)]
        [string] $Name
    )

    $versionText = $Version.Split('-')[0]
    try {
        $parsedVersion = [version]$versionText
    }
    catch {
        throw "Could not determine the $Name manifest version from '$Version'."
    }

    "$($parsedVersion.Major).$($parsedVersion.Minor).0.0"
}

[pscustomobject]@{
    Application = ConvertTo-ManifestVersion -Version $ApplicationVersion -Name 'application'
    Platform = ConvertTo-ManifestVersion -Version $PlatformVersion -Name 'platform'
}
