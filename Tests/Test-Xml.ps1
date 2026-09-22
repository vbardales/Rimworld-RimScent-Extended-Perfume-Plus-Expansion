[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot

function Read-Xml([string]$relativePath) {
    [xml](Get-Content -Raw (Join-Path $root $relativePath))
}

function Assert-True([bool]$condition, [string]$message) {
    if (-not $condition) { throw $message }
}

$xmlFiles = Get-ChildItem (Join-Path $root 'Mod') -Recurse -File -Filter '*.xml'
foreach ($file in $xmlFiles) {
    [xml](Get-Content -Raw $file.FullName) | Out-Null
}

$thoughtFiles = @(
    'Mod/RomyPerfumes/Defs/Scents_Perfumes.xml',
    'Mod/SocialSupplements/Defs/Scents_SocialSupplements.xml'
)
$thoughts = @{}
foreach ($path in $thoughtFiles) {
    $document = Read-Xml $path
    foreach ($thought in @($document.Defs.ThoughtDef | Where-Object { $_.defName })) {
        Assert-True (-not $thoughts.ContainsKey($thought.defName)) "Duplicate owned thought: $($thought.defName)."
        $thoughts[$thought.defName] = [string]$thought.stages.li.baseMoodEffect
    }
}

$expectedMoodEffects = [ordered]@{
    RimScentExtended_Scent_PerfumeFlower      = '3'
    RimScentExtended_Scent_PerfumePlant       = '2'
    RimScentExtended_Scent_PerfumeHunting     = '-1'
    RimScentExtended_Scent_PerfumeAncient     = '5'
    RimScentExtended_Scent_PerfumeAnima       = '3'
    RimScentExtended_Scent_AromaflowerPetals  = '2'
    RimScentExtended_Scent_Vapour              = '-1'
    RimScentExtended_Scent_Mint                = '2'
    RimScentExtended_Scent_Chilli              = '-1'
}
$actualThoughtInventory = @($thoughts.Keys | Sort-Object) -join ','
$expectedThoughtInventory = @($expectedMoodEffects.Keys | Sort-Object) -join ','
Assert-True ($actualThoughtInventory -eq $expectedThoughtInventory) 'Owned scent thought inventory changed.'
foreach ($name in $expectedMoodEffects.Keys) {
    Assert-True ($thoughts[$name] -eq $expectedMoodEffects[$name]) "Unexpected mood effect for $name."
}

$patchFiles = @(
    'Mod/RomyPerfumes/Patches/Perfumes.xml',
    'Mod/SocialSupplements/Patches/SocialSupplements.xml'
)
$patchThoughts = foreach ($path in $patchFiles) {
    Select-String -Path (Join-Path $root $path) -Pattern '<thought>([^<]+)</thought>' |
        ForEach-Object { $_.Matches.Groups[1].Value }
}
$expectedPatchReferenceCounts = @{}
foreach ($name in $expectedMoodEffects.Keys) { $expectedPatchReferenceCounts[$name] = 2 }
$expectedPatchReferenceCounts['RimScentExtended_Scent_Mint'] = 4
foreach ($name in $expectedPatchReferenceCounts.Keys) {
    Assert-True ((@($patchThoughts | Where-Object { $_ -eq $name }).Count) -eq $expectedPatchReferenceCounts[$name]) "Unexpected conditional-branch reference count for $name."
}
foreach ($name in $patchThoughts | Where-Object { $_ -like 'RimScentExtended_*' }) {
    Assert-True ($name -in $expectedMoodEffects.Keys -or $name -eq 'RimScentExtended_Scent_WornScent') "Patch references an unknown RimScent Extended thought: $name."
}
Assert-True ($patchThoughts -contains 'RimScent_FloweryScent') 'Polyflower support must reuse RimScent_FloweryScent.'

$about = Read-Xml 'Mod/About/About.xml'
$dependencyIds = @($about.ModMetaData.modDependencies.li.packageId)
foreach ($id in @('reo.RimScent', 'reo.rimscent.perfumeexpansion', 'nelim.rimscent.extended')) {
    Assert-True ($dependencyIds -contains $id) "Missing hard dependency: $id."
}
Assert-True ($dependencyIds.Count -eq 3) 'Optional integrations must not become hard dependencies.'
$loadAfter = @($about.ModMetaData.loadAfter.li)
foreach ($id in @('romyashi.perfumes', 'romyashi.animaexpansion', 'mlie.socialsupplements')) {
    Assert-True ($loadAfter -contains $id) "Missing optional loadAfter declaration: $id."
}

[xml]$folders = Get-Content -Raw (Join-Path $root 'Mod/LoadFolders.xml')
foreach ($entry in @(
    @{ Id = 'romyashi.perfumes'; Folder = 'RomyPerfumes' },
    @{ Id = 'romyashi.animaexpansion'; Folder = 'RomyPerfumesAnima' },
    @{ Id = 'mlie.socialsupplements'; Folder = 'SocialSupplements' }
)) {
    $matches = @($folders.SelectNodes("/loadFolders/v1.6/li[@IfModActive='$($entry.Id)' and text()='$($entry.Folder)']"))
    Assert-True ($matches.Count -eq 1) "Missing or changed conditional folder for $($entry.Id)."
}

$frenchEntries = @{}
$frenchCount = 0
$frenchFiles = $xmlFiles | Where-Object { $_.FullName -match '[\\/]Languages[\\/]French[\\/]' }
foreach ($file in $frenchFiles) {
    [xml]$document = Get-Content -Raw $file.FullName
    foreach ($node in @($document.LanguageData.ChildNodes | Where-Object NodeType -eq Element)) {
        Assert-True (-not $frenchEntries.ContainsKey($node.Name)) "Duplicate French DefInjected key: $($node.Name)."
        Assert-True (-not [string]::IsNullOrWhiteSpace($node.InnerText)) "Empty French DefInjected key: $($node.Name)."
        $frenchEntries[$node.Name] = $true
        $frenchCount++
    }
}
Assert-True ($frenchCount -eq 60) 'French DefInjected inventory changed.'
foreach ($name in $expectedMoodEffects.Keys) {
    $matches = @($frenchEntries.Keys | Where-Object { $_ -match "^$([regex]::Escape($name))\.stages\..+\.(label|description)$" })
    Assert-True ($matches.Count -eq 2) "French translation must provide a label and description for $name."
}

Add-Type -AssemblyName System.Drawing
foreach ($spec in @(
    @{ Name = 'ModIcon'; Width = 128; Height = 128; MaxBytes = 30720 },
    @{ Name = 'Preview'; Width = 896; Height = 504; MaxBytes = 1MB }
)) {
    $file = Get-Item (Join-Path $root "Mod/About/$($spec.Name).png")
    $image = [System.Drawing.Image]::FromFile($file.FullName)
    try {
        Assert-True ($image.Width -eq $spec.Width -and $image.Height -eq $spec.Height) "$($spec.Name) dimensions changed."
        Assert-True ($file.Length -lt $spec.MaxBytes) "$($spec.Name) exceeds its size limit."
    }
    finally { $image.Dispose() }
}

Write-Host "PASS: $($xmlFiles.Count) XML files, $($expectedMoodEffects.Count) owned thoughts, and $frenchCount French DefInjected entries validated."
