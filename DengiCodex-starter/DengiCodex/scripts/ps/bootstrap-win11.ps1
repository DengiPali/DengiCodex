param(
    [switch]$InstallTools
)
# Alap beállítások
$ErrorActionPreference = 'Stop'

Write-Host "ExecutionPolicy beállítása (CurrentUser: RemoteSigned)"
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force

if ($InstallTools) {
    Write-Host "Winget csomagok telepítése..."
    winget install --id Git.Git -e --silent
    winget install --id GitHub.cli -e --silent
    winget install --id Microsoft.VisualStudioCode -e --silent
    winget install --id Microsoft.PowerShell -e --silent
    winget install --id 7zip.7zip -e --silent
}

# Git alapbeállítások – módosítsd saját adataidra
git config --global core.autocrlf true
git config --global init.defaultBranch main

# LFS engedélyezés
try { git lfs install } catch {}

Write-Host "Kész. Jelentkezz be: gh auth login"
