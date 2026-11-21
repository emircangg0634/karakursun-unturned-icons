param(
    [string]$UnturnedDir = "D:\SteamLibrary\steamapps\common\Unturned",
    [string]$OutputDir = "$PSScriptRoot\icons",
    [switch]$IncludeWorkshop
)

$ErrorActionPreference = "Stop"
$iconsSource = Join-Path $UnturnedDir "Extras\Icons"

if (-not (Test-Path $iconsSource)) {
    throw "Unturned Extras\Icons klasörü bulunamadı: $iconsSource"
}

New-Item -ItemType Directory -Force -Path $OutputDir | Out-Null

$copied = 0
Get-ChildItem -Path $iconsSource -Filter "*.png" -File | ForEach-Object {
    if ($_.BaseName -match '^(?<name>.+)_(?<id>\d+)$') {
        $itemId = $Matches['id']
        $destPath = Join-Path $OutputDir "$itemId.png"
        if (-not (Test-Path $destPath)) {
            Copy-Item -Path $_.FullName -Destination $destPath -Force
            $copied++
        }
    }
}

if ($IncludeWorkshop) {
    $workshopDir = Join-Path (Split-Path (Split-Path $UnturnedDir -Parent) -Parent) "workshop\content\304930"
    if (Test-Path $workshopDir) {
        Get-ChildItem -Path $workshopDir -Filter "*.png" -Recurse -File -ErrorAction SilentlyContinue | ForEach-Object {
            if ($_.BaseName -match '^(?<name>.+)_(?<id>\d+)$') {
                $itemId = $Matches['id']
                $destPath = Join-Path $OutputDir "$itemId.png"
                if (-not (Test-Path $destPath)) {
                    Copy-Item -Path $_.FullName -Destination $destPath -Force
                    $copied++
                }
            }
        }
    }
}

Write-Host "Toplam $copied adet benzersiz ItemID ikonu cikarildi -> $OutputDir"
