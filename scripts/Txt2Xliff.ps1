<#
.SYNOPSIS
Convert txt translations to xliff

.DESCRIPTION
Convert txt translations to xliff

.PARAMETER TxtTranslationPath
Path to the language file.

.PARAMETER XliffPath
Path to the xliff file that is used as a mapping from C/AL to AL

.PARAMETER OutputDirectory
Path to the directory where the resulting xliff translations will be written
#>
[CmdletBinding()]
param (
    [Parameter(Mandatory=$true)]
    [string]
    $TxtTranslationPath,

    [Parameter(Mandatory=$true)]
    [string]
    $XliffPath,

    [Parameter(Mandatory=$true)]
    [string]
    $OutputDirectory
)

if(-not (Test-Path -Path $TxtTranslationPath)) {
    Write-Output "Invalid path for TxtTranslation: $TxtTranslationPath"
    return
}

if(-not (Test-Path -Path $XliffPath)) {
    Write-Output "Invalid path for Xliff: $XliffPath"
    return
}

if(-not (Test-Path -Path $OutputDirectory)) {
    Write-Output "Invalid path for Output Directory: $OutputDirectory"
    return
}

# Setup of functions
$approvedLegacyParts = "c","n","t","x","r","q","g","c","f","p","v","d","e"
$xliffTranslationFiles = @{}

function GetXliffTranslationObject {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string]
        $Culture,

        [Parameter(Mandatory=$true)]
        [string]
        $original
    )
    
    if(-not ($xliffTranslationFiles.ContainsKey($Culture))) {
        $baseXmlObject = CreateBaseXliffObject -TargetLanguage $Culture -original $original
        $xliffTranslationFiles[$Culture] = $baseXmlObject
    }
    return $xliffTranslationFiles[$Culture]
}

function CreateBaseXliffObject {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [string]
        $TargetLanguage,

        [Parameter(Mandatory=$true)]
        [string]
        $original
    )
    Write-Verbose "Creates base document for target-language: $TargetLanguage"

    [xml]$doc = New-Object System.Xml.XmlDocument

    $dec = $Doc.CreateXmlDeclaration("1.0", "utf-8", $null)
    [void]$doc.AppendChild($dec)

    $xliffElem = $doc.CreateElement("Xliff")
    $xliffElem.SetAttribute("version", "1.2")
    $xliffElem.SetAttribute("xmlns", "urn:oasis:names:tc:xliff:document:1.2")
    $xliffElem.SetAttribute("xmlns:xsi", "http://www.w3.org/2001/XMLSchema-instance")
    [void]$xliffElem.SetAttribute("schemaLocation", "http://www.w3.org/2001/XMLSchema-instance", "urn:oasis:names:tc:xliff:document:1.2 xliff-core-1.2-transitional.xsd")
    [void]$doc.AppendChild($xliffElem)

    $fileElem = $doc.CreateElement("file")
    $fileElem.SetAttribute("datatype", "xml")
    $fileElem.SetAttribute("source-language", "en-US")
    $fileElem.SetAttribute("target-language", $TargetLanguage)
    $fileElem.SetAttribute("original", $original)
    [void]$xliffElem.AppendChild($fileElem)

    $bodyElem = $doc.CreateElement("body")
    [void]$fileElem.AppendChild($bodyElem)

    $groupElem = $doc.CreateElement("group")
    $groupElem.SetAttribute("id", "body")
    [void]$bodyElem.AppendChild($groupElem)

    return $doc
}

function GetLegacyTranslationKey {
    param (
        [string]
        $LegacyId
    )
    $regexResult = [regex]::matches($LegacyId, "(\w{1}\d+)+")
    if(-not ($regexResult.Success)) {
        return $LegacyId
    }
    $parts = $regexResult.Captures | ForEach-Object {$_.Value} | Where-Object {$_[0] -in $approvedLegacyParts }
    $resultingKey = (($parts | Sort-Object) -join "-")
    return $resultingKey
}

function ParseTxtLine {
    param (
        [string]
        $TranslationLine
    )
    $translationObject = @{}
    $regexResult = [regex]::matches($TranslationLine, "(.*?):(.*)")
    if(-not ($regexResult.Success)) {
        return $null
    }
    $translationObject["Text"] = $regexResult.Groups[2].Value
    $keyPart = $regexResult.Groups[1].Value
    $translationObject["KeyPart"] = $keyPart
    $translationObject["Key"] = GetLegacyTranslationKey $keyPart

    if(-not ($keyPart -match 'A(\d+)')) {
        return $null
    }
    [int]$LCID = $Matches[1]
    $CultureInfo = GetCultureInfo $LCID
    if(!$CultureInfo) {
        return $null
    }
    $translationObject["Culture"] = $CultureInfo.TextInfo.CultureName

    return $translationObject
}

function GetCultureInfo {
    param (
        [int]
        $LCID
    )
    try {
        $CultureInfo = [System.Globalization.CultureInfo]::GetCultureInfo($LCID)
        return $CultureInfo
    }
    catch {
        Write-Verbose "Couldn't find a culture for the LCID $LCID"
        return $null
    }
}

function ExtractNote {
    param (
        [System.Xml.XmlElement]
        $transunitElement,

        [string]
        $NoteFrom
    )
    foreach($childElements in $transunitElement.ChildNodes) {
        if($childElements.NodeType -eq [System.Xml.XmlNodeType]::Element) {
            if($childElements.name -eq "note") {
                if($childElements.from -ieq $NoteFrom) {
                    return $childElements.InnerText
                }
            }
        }
    }
    return $null
}

function CreateTransunit {
    param (
        $doc,

        [string]
        $id,

        [string]
        $source,

        [string]
        $target,

        [string]
        $humanName,

        [string]
        $legacyId
    )
    $transunit = $doc.CreateElement("trans-unit")
    $transunit.SetAttribute("id", $id)
    $transunit.SetAttribute("size-unit", "char")
    $transunit.SetAttribute("translate", "yes")
    $transunit.SetAttribute("xml:space", "preserve")

    $sourceElem = $doc.CreateElement("source")
    $sourceElem.InnerText = $source
    [void]$transunit.AppendChild($sourceElem)

    $targetElem = $doc.CreateElement("target")
    $targetElem.InnerText = $target
    [void]$transunit.AppendChild($targetElem)

    $humanNoteElem = $doc.CreateElement("note")
    $humanNoteElem.SetAttribute("from", "Xliff Generator")
    $humanNoteElem.SetAttribute("annotates", "general")
    $humanNoteElem.SetAttribute("priority", "3")
    $humanNoteElem.InnerText = $humanName
    [void]$transunit.AppendChild($humanNoteElem)

    $legacyNoteElem = $doc.CreateElement("note")
    $legacyNoteElem.SetAttribute("from", "Transitional")
    $legacyNoteElem.SetAttribute("annotates", "general")
    $legacyNoteElem.SetAttribute("priority", "4")
    $legacyNoteElem.InnerText = $legacyId
    [void]$transunit.AppendChild($legacyNoteElem)

    return $transunit
}

# Parse Translation file
$parsedTranslationLines = @{}
$skippedTxtFileLines = 0
[System.IO.File]::ReadLines($TxtTranslationPath) | ForEach-Object {
    $parsedObject = ParseTxtLine $_
    if(!$parsedObject) {
        $skippedTxtFileLines = $skippedTxtFileLines +1
        return
    }

    if(-not $parsedTranslationLines.ContainsKey($parsedObject["Key"])) {
        $parsedTranslationLines[$parsedObject["Key"]] = @{}
    }
    $parsedTranslationLines[$parsedObject["Key"]][$parsedObject["Culture"]] = $parsedObject["Text"]
}

if($parsedTranslationLines.Count -eq 0) {
    Write-Output "No Translaitons found with languages"
    return
}
Write-Output "Translation lines found: $($parsedTranslationLines.Count)"
Write-Output "Skipped lines in language file $skippedTxtFileLines"

[xml]$xliffXml = Get-Content -Path $XliffPath
[string]$originalText = $xliffXml.Xliff.file.original

$translationUnitsCount = 0
$group = $xliffXml.xliff.file.body.group
$group.ChildNodes | Where-Object { $_.NodeType -eq [System.Xml.XmlNodeType]::Element } | ForEach-Object {
    $LegacyId = ExtractNote $_ "Transitional"
    $HumanName = ExtractNote $_ "Xliff Generator"
    if(($null -eq $LegacyId) -or ($null -eq $HumanName)) {
        return
    }

    $LegacyKey = GetLegacyTranslationKey $LegacyId
    if(-not $parsedTranslationLines.ContainsKey($LegacyKey)) {
        return
    }

    $transunitId = $_.id
    $transunitSource = $_.Source

    $foundTranslations = $parsedTranslationLines[$LegacyKey]
    foreach($transCulture in $foundTranslations.Keys) {
        $translationText = $foundTranslations[$transCulture]
        $xliffObject = GetXliffTranslationObject -original $originalText -Culture $transCulture
        $newTransunit = CreateTransunit -doc $xliffObject -id $transunitId -source $transunitSource -target $translationText -humanName $HumanName -legacyId $LegacyId
        [void]$xliffObject.xliff.file.body.group.AppendChild($newTransunit)

        $translationUnitsCount = $translationUnitsCount + 1
    }
}

Write-Output "Number of languages found: $($xliffTranslationFiles.Keys.Count)"
Write-Output "Number of Trans-Units created: $translationUnitsCount"

# Write out the files
foreach($xliffCulture in $xliffTranslationFiles.Keys) {
    $xliffObject = $xliffTranslationFiles[$xliffCulture]
    $filepath = Join-Path $OutputDirectory "$($xliffCulture).xliff"
    $xliffObject.save($filepath)
}