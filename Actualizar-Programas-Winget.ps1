# Comprobar si se está ejecutando como Administrador
$esAdmin = ([Security.Principal.WindowsPrincipal] `
    [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(
    [Security.Principal.WindowsBuiltInRole]::Administrator)

if (-not $esAdmin) {
    Start-Process powershell.exe `
        -Verb RunAs `
        -ArgumentList "-ExecutionPolicy Bypass -NoProfile -File `"$PSCommandPath`""
    exit
}
Clear-Host

Write-Host "========================================="
Write-Host " ACTUALIZADOR DE PROGRAMAS CON WINGET"
Write-Host "========================================="
Write-Host ""

if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Host "Winget no está disponible." -ForegroundColor Red
    Pause
    exit
}

Write-Host "Buscando actualizaciones..."
Write-Host ""

$lines = winget upgrade --accept-source-agreements | Out-String
$lines = $lines -split "`n"

$apps = @()

foreach ($line in $lines) {
    $line = $line.Trim()

    if ($line -eq "" -or
        $line -match "^Name\s+Id\s+Version" -or
        $line -match "^-+" -or
        $line -match "upgrades available" -or
        $line -match "No installed package") {
        continue
    }

    if ($line -match "\s([A-Za-z0-9][A-Za-z0-9\.\-_]+)\s+\S+\s+\S+\s+\S+$") {
        $apps += [PSCustomObject]@{
            Name = $line
            Id   = $matches[1]
        }
    }
}

if ($apps.Count -eq 0) {
    Write-Host "No hay programas pendientes de actualizar." -ForegroundColor Green
    Pause
    exit
}

Write-Host "Programas que se pueden actualizar:"
Write-Host ""

for ($i = 0; $i -lt $apps.Count; $i++) {
    Write-Host "$($i + 1). $($apps[$i].Name)"
}

Write-Host ""
Write-Host "A - Actualizar todos"
Write-Host "N - No actualizar ninguno"
Write-Host "Ejemplo: 1,3,5 para elegir programas concretos"
Write-Host ""

$selection = Read-Host "Elige una opcion"

if ($selection -match "^[Nn]$") {
    Write-Host "No se actualizará ningún programa."
    Pause
    exit
}

if ($selection -match "^[Aa]$") {
    $selectedApps = $apps
} else {
    $selectedApps = @()
    $numbers = $selection -split ","

    foreach ($num in $numbers) {
        $num = $num.Trim()
        if ($num -match "^\d+$") {
            $index = [int]$num - 1
            if ($index -ge 0 -and $index -lt $apps.Count) {
                $selectedApps += $apps[$index]
            }
        }
    }
}

if ($selectedApps.Count -eq 0) {
    Write-Host "No se ha seleccionado ningún programa válido." -ForegroundColor Yellow
    Pause
    exit
}

Write-Host ""
Write-Host "Se actualizarán:"
foreach ($app in $selectedApps) {
    Write-Host "- $($app.Id)"
}

Write-Host ""
$confirm = Read-Host "Pulsa S para comenzar"

if ($confirm -notmatch "^[Ss]$") {
    Write-Host "Operación cancelada."
    Pause
    exit
}

foreach ($app in $selectedApps) {
    Write-Host ""
    Write-Host "Actualizando $($app.Id)..." -ForegroundColor Cyan

    winget upgrade --id $app.Id --accept-package-agreements --accept-source-agreements
}

Write-Host ""
Write-Host "Actualización finalizada." -ForegroundColor Green
Pause