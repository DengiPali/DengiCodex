# DengiCodex

Privát tudástár és szkriptek Windows 11 + PowerShell + 3D nyomtatáshoz (Creality K1 Max).  
Azonnal használható scaffold: PowerShell szkriptek, LFS a nagy fájlokra, és egy OSD-tiltó script a Nahimichez.

## Gyors start
```powershell
# 1) Git és GitHub CLI (gh) telepítés Wingetből (Admin PowerShell):
winget install --id Git.Git -e
winget install --id GitHub.cli -e
winget install --id Microsoft.PowerShell -e

# 2) Bejelentkezés GitHubra
gh auth login

# 3) Repo létrehozása privátban és feltöltés
gh repo create DengiCodex --private --source . --remote origin --push
```

## Mappa-struktúra
- `scripts/ps` – PowerShell szkriptek (admin és user mód)
- `printing/k1max/gcode` – G-kódok, próbarajzok
- `printing/models` – STL/3MF modellek
- `docs` – jegyzetek, naplók

## Figyelem
- A repo privát legyen. Ne tegyél fel licencelt modelleket, jelszavakat, tokeneket.
- Nagy fájlok: LFS engedélyezve (`.gitattributes`).

