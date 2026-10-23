# Create: Connected Fluid Vessel boiler heat fix
# Edits ONE EXISTING value in ONE explicitly selected server config.
# Run only while Minecraft server is stopped.
# This is not an automatic deployment script.
param(
    [Parameter(Mandatory = $true)]
    [string]$ConfigPath
)
Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$fullPath = [System.IO.Path]::GetFullPath($ConfigPath)
if ([System.IO.Path]::GetFileName($fullPath) -ne "create_connected-server.toml") {
    throw "Expected filename create_connected-server.toml, got: $fullPath"
}
if (-not [System.IO.File]::Exists($fullPath)) {
    throw "Config not found: $fullPath"
}

$rawBytes = [System.IO.File]::ReadAllBytes($fullPath)
$hasUtf8Bom = $rawBytes.Length -ge 3 -and
    $rawBytes[0] -eq 0xEF -and $rawBytes[1] -eq 0xBB -and $rawBytes[2] -eq 0xBF
$encoding = [System.Text.UTF8Encoding]::new($hasUtf8Bom, $true)
$text = [System.IO.File]::ReadAllText($fullPath, $encoding)

$pattern = '(?m)^(?<indent>[ \t]*)vesselHeatMultiplier(?<equals>[ \t]*=[ \t]*)(?<value>[+-]?(?:[0-9]+(?:\.[0-9]*)?|\.[0-9]+)(?:[eE][+-]?[0-9]+)?)(?<suffix>[ \t]*(?:#.*)?)$'
$matches = [regex]::Matches($text, $pattern)
if ($matches.Count -ne 1) {
    throw "Expected exactly one uncommented vesselHeatMultiplier setting; found $($matches.Count). No changes made."
}
$m = $matches[0]
$oldValue = $m.Groups["value"].Value
if ($oldValue -eq "1.0") {
    Write-Host "Already 1.0; no changes made: $fullPath"
    exit 0
}

$newLine = $m.Groups["indent"].Value + "vesselHeatMultiplier" +
    $m.Groups["equals"].Value + "1.0" + $m.Groups["suffix"].Value
$newText = $text.Substring(0, $m.Index) + $newLine +
    $text.Substring($m.Index + $m.Length)

# Replace is atomic on the same volume and writes the prior version to backup.
$backup = "$fullPath.backup-" + [DateTime]::UtcNow.ToString("yyyyMMddTHHmmssfffZ")
$temp = [System.IO.Path]::Combine(
    [System.IO.Path]::GetDirectoryName($fullPath),
    ".create_connected-server.toml.$PID.tmp"
)
try {
    [System.IO.File]::WriteAllText($temp, $newText, $encoding)
    [System.IO.File]::Replace($temp, $fullPath, $backup)
} finally {
    if ([System.IO.File]::Exists($temp)) {
        [System.IO.File]::Delete($temp)
    }
}
Write-Host "Updated vesselHeatMultiplier: $oldValue -> 1.0"
Write-Host "Config: $fullPath"
Write-Host "Backup: $backup"
Write-Host "No other settings were intentionally changed. Restart the server and test the vessel boiler."
