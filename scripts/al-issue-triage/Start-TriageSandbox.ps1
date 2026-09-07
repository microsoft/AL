[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
Import-Module BcContainerHelper -Force

function Wait-DockerApi {
    param(
        [int] $MaximumAttempts = 12,
        [int] $DelaySeconds = 10
    )

    $dockerPath = (Get-Command docker -ErrorAction Stop).Source
    $lastResponse = 'Docker did not return a response.'
    for ($attempt = 1; $attempt -le $MaximumAttempts; $attempt++) {
        $dockerService = Get-Service -Name docker -ErrorAction SilentlyContinue
        if ($dockerService -and $dockerService.Status -ne 'Running') {
            try {
                Start-Service -Name docker -ErrorAction Stop
            }
            catch {
                $lastResponse = $_.Exception.Message
            }
        }

        $response = & $dockerPath version --format '{{.Server.Version}}' 2>&1 |
            Out-String
        if ($LASTEXITCODE -eq 0 -and -not [string]::IsNullOrWhiteSpace($response)) {
            Write-Information "Docker API is ready (server $($response.Trim()))." -InformationAction Continue
            return
        }

        if (-not [string]::IsNullOrWhiteSpace($response)) {
            $lastResponse = $response.Trim()
        }
        if ($attempt -lt $MaximumAttempts) {
            Write-Warning "Docker API is not ready (attempt $attempt of $MaximumAttempts): $lastResponse"
            Start-Sleep -Seconds $DelaySeconds
        }
    }

    throw "Docker API did not become ready after $MaximumAttempts attempts. Last response: $lastResponse"
}

$artifactUrl = Get-BcArtifactUrl -Type Sandbox -Country w1 -Select Latest `
    -StorageAccount bcinsider -Accept_InsiderEula
if (-not $artifactUrl -or [string]$artifactUrl -notmatch '(?i)bcinsider') {
    throw "Could not resolve a BCInsider Platform master sandbox artifact: '$artifactUrl'."
}

$containerName = 'al-public-triage'
$passwordText = [guid]::NewGuid().ToString('N') + 'aA1!'
Write-Host "::add-mask::$passwordText"
$credential = [pscredential]::new(
    'admin',
    (ConvertTo-SecureString $passwordText -AsPlainText -Force)
)

Wait-DockerApi

New-BcContainer `
    -Accept_Eula `
    -Accept_InsiderEula `
    -ContainerName $containerName `
    -ArtifactUrl $artifactUrl `
    -Auth UserPassword `
    -Credential $credential `
    -UpdateHosts `
    -Shortcuts None `
    -IncludeAL

if (-not (Get-BcContainerId -ContainerName $containerName)) {
    throw "Business Central container '$containerName' was not created."
}

$versions = & (Join-Path $PSScriptRoot 'Resolve-TriageSandboxVersions.ps1') `
    -ApplicationVersion (Get-BcContainerNavVersion -containerOrImageName $containerName) `
    -PlatformVersion (Get-BcContainerPlatformVersion -containerOrImageName $containerName)

"BC_CONTAINER_NAME=$containerName" | Add-Content -Path $env:GITHUB_ENV
"BC_ARTIFACT_URL=$artifactUrl" | Add-Content -Path $env:GITHUB_ENV
"BC_APPLICATION_VERSION=$($versions.Application)" | Add-Content -Path $env:GITHUB_ENV
"BC_PLATFORM_VERSION=$($versions.Platform)" | Add-Content -Path $env:GITHUB_ENV
"BC_SERVER_URL=http://$containerName" | Add-Content -Path $env:GITHUB_ENV
"BC_SERVER_INSTANCE=BC" | Add-Content -Path $env:GITHUB_ENV
"BC_SERVER_PORT=7049" | Add-Content -Path $env:GITHUB_ENV
"BC_TENANT=default" | Add-Content -Path $env:GITHUB_ENV
"BC_AUTHENTICATION=UserPassword" | Add-Content -Path $env:GITHUB_ENV
"BC_SERVER_USERNAME=admin" | Add-Content -Path $env:GITHUB_ENV
"BC_SERVER_PASSWORD=$passwordText" | Add-Content -Path $env:GITHUB_ENV
