# Nahimic / A-Volute OSD DLL letiltása, miközben a Sonic maradhat
# Futtasd Admin PowerShell-ben
$services = @("NahimicService","A-Volute.Nahimic","SS3Svc32","SS3Svc64","NahimicSvc64")
foreach ($s in $services) {
    try { Stop-Service -Name $s -ErrorAction SilentlyContinue } catch {}
    try { Set-Service -Name $s -StartupType Manual -ErrorAction SilentlyContinue } catch {}
}

$roots = @("C:\ProgramData\A-Volute","C:\Program Files\A-Volute","C:\Program Files (x86)\A-Volute")
$changed = 0
foreach ($r in $roots) {
    if (Test-Path $r) {
        Get-ChildItem -Path $r -Recurse -Filter "NahimicOSD.dll" -ErrorAction SilentlyContinue | ForEach-Object {
            try {
                $full = $_.FullName
                takeown /F "$full" /A | Out-Null
                icacls "$full" /grant Administrators:F /T | Out-Null
                Rename-Item -Path "$full" -NewName ($_.Name + ".bak") -Force
                $changed++
            } catch { Write-Host "Hiba: $($_.Exception.Message)" }
        }
    }
}

Write-Host "Átnevezett DLL-ek száma: $changed"
if ($changed -gt 0) { Write-Host "Indítsd újra a CrealityPrint-et." }
