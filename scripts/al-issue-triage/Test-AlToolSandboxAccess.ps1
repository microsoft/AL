[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$projectPath = Join-Path $env:RUNNER_TEMP 'altool-sandbox-preflight'
New-Item -ItemType Directory -Path $projectPath -Force | Out-Null

foreach ($name in @('BC_APPLICATION_VERSION', 'BC_PLATFORM_VERSION')) {
    if ([string]::IsNullOrWhiteSpace([Environment]::GetEnvironmentVariable($name))) {
        throw "Required sandbox version variable '$name' is unavailable."
    }
}

[ordered]@{
    id = [guid]::NewGuid().ToString()
    name = 'Public AL Triage Preflight'
    publisher = 'Microsoft'
    version = '1.0.0.0'
    platform = $env:BC_PLATFORM_VERSION
    application = $env:BC_APPLICATION_VERSION
    target = 'OnPrem'
    idRanges = @([ordered]@{ from = 50100; to = 50100 })
} | ConvertTo-Json -Depth 5 |
    Set-Content -LiteralPath (Join-Path $projectPath 'app.json') -Encoding utf8

try {
    $maximumAttempts = 3
    for ($attempt = 1; $attempt -le $maximumAttempts; $attempt++) {
        try {
            & .\.github\skills\download-al-symbols\Invoke-DownloadAlSymbols.ps1 `
                -ProjectPath $projectPath
            break
        }
        catch {
            if ($attempt -eq $maximumAttempts -or
                $_.Exception.Message -notmatch '"retryable":true') {
                throw
            }

            Write-Warning "ALTool symbol download failed with a retryable error (attempt $attempt of $maximumAttempts): $($_.Exception.Message)"
            Start-Sleep -Seconds 10
        }
    }
}
finally {
    Remove-Item -LiteralPath $projectPath -Recurse -Force -ErrorAction SilentlyContinue
}
