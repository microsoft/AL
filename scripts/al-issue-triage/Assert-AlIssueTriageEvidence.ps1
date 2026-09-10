function Assert-AlIssueTriageEvidence {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string] $Comment
    )

    $classificationMatch = [regex]::Match(
        $Comment,
        '(?m)^\*\*Classification:\*\*\s*`?(?<value>[^`\r\n]+)`?\s*$'
    )
    $scopeMatch = [regex]::Match(
        $Comment,
        '(?m)^-\s*\*\*Scope:\*\*\s*`?(?<value>in scope|likely fixed|out of scope|needs human decision)`?'
    )
    if (-not $classificationMatch.Success -or -not $scopeMatch.Success) {
        throw 'Triage output has an invalid classification or scope field.'
    }

    function Get-AttemptRow {
        param([Parameter(Mandatory)][string] $Name)

        $match = [regex]::Match(
            $Comment,
            "(?m)^\|\s*$([regex]::Escape($Name))\s*\|\s*``?(?<result>[^``|]+)``?\s*\|\s*(?<evidence>.*?)\s*\|\s*$"
        )
        if (-not $match.Success) {
            throw "Triage output has an invalid '$Name' row."
        }
        [pscustomobject]@{
            Result = $match.Groups['result'].Value.Trim().ToLowerInvariant()
            Evidence = $match.Groups['evidence'].Value.Trim()
        }
    }

    function Assert-ExecutedEvidence {
        param(
            [Parameter(Mandatory)][pscustomobject] $Row,
            [Parameter(Mandatory)][string] $Name
        )

        if ($Row.Result -notin @('reproduced', 'not reproduced', 'inconclusive')) {
            throw "$Name must contain an independently executed attempt."
        }
        if ($Row.Result -eq 'inconclusive') {
            if ($Row.Evidence -notmatch '(?i)\battempted\b' -or
                $Row.Evidence -notmatch '(?i)\b(blocked|failed|unavailable|timed out|missing|could not)\b') {
                throw "$Name inconclusive evidence must identify the attempted invocation and exact blocker."
            }
            return
        }
        if ($Row.Evidence -notmatch '(?i)\bexecuted\b' -or
            $Row.Evidence -notmatch '(?i)\b(exit code|observed|returned|result|diagnostic|output)\b') {
            throw "$Name evidence must identify the executed invocation and observed result."
        }
    }

    $classification = $classificationMatch.Groups['value'].Value.Trim().ToLowerInvariant()
    $scope = $scopeMatch.Groups['value'].Value.Trim().ToLowerInvariant()
    $altool = Get-AttemptRow -Name 'ALTool reproduction'
    $runtime = Get-AttemptRow -Name 'BC runtime reproduction'

    if ($scope -eq 'in scope' -and $classification -in @('compiler bug', 'tooling bug')) {
        Assert-ExecutedEvidence -Row $altool -Name 'ALTool reproduction'
    }
    if ($scope -eq 'in scope' -and $classification -eq 'runtime/server issue') {
        Assert-ExecutedEvidence -Row $runtime -Name 'BC runtime reproduction'
    }
    if ($scope -eq 'likely fixed') {
        if ($classification -notin @('compiler bug', 'tooling bug', 'runtime/server issue')) {
            throw 'Likely fixed is only valid for compiler, tooling, or runtime/server bugs.'
        }

        $reproduction = if ($classification -eq 'runtime/server issue') { $runtime } else { $altool }
        $reproductionName = if ($classification -eq 'runtime/server issue') {
            'BC runtime reproduction'
        }
        else {
            'ALTool reproduction'
        }
        Assert-ExecutedEvidence -Row $reproduction -Name $reproductionName
        if ($reproduction.Result -ne 'not reproduced') {
            throw 'Likely fixed requires independently executed not reproduced evidence.'
        }

        $recommendedNextStep = [regex]::Match(
            $Comment,
            '(?ms)^### Recommended next step\s*(?<value>.*?)(?:\r?\n### |\z)'
        )
        if (-not $recommendedNextStep.Success -or
            $recommendedNextStep.Groups['value'].Value -notmatch
                '(?im)^\s*(?:please\s+|we\s+recommend(?:\s+to)?\s+)?clos(?:e|ing)\b.*\blikely fixed\b') {
            throw 'Likely fixed must recommend closing the issue as likely fixed.'
        }
        if ($recommendedNextStep.Groups['value'].Value -match '(?i)\baccept(?:ed|ance)?\b') {
            throw 'Likely fixed must not recommend acceptance.'
        }
    }

    foreach ($row in @($altool, $runtime)) {
        if ($row.Result -in @('reproduced', 'not reproduced') -and
            $row.Evidence -match '(?i)^\s*(the\s+)?(reporter|issue|report)\s+(states|says|shows|claims)') {
            throw 'Reporter claims cannot be presented as independent reproduction evidence.'
        }
    }
}
