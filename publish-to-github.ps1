# Script para publicar El Rincón del Tapeo II en GitHub Pages
# Ejecuta ESTE script en PowerShell

Write-Host "=== PUBLICAR EN GITHUB PAGES ===" -ForegroundColor Cyan
Write-Host "Sitio: El Rincón del Tapeo II" -ForegroundColor White
Write-Host ""

# Verificar que estamos en la carpeta correcta
$currentDir = Get-Location
$expectedDir = "C:\Users\marko\Desktop\OpenClaw\El-Rincon-del-Tapeo-II"

if ($currentDir.Path -ne $expectedDir) {
    Write-Host "⚠  Cambiando a la carpeta correcta..." -ForegroundColor Yellow
    Set-Location $expectedDir
}

Write-Host "1. Verificando archivos..." -ForegroundColor Yellow
$files = Get-ChildItem -Recurse | Where-Object { $_.Name -notlike ".git*" }
Write-Host "   ✓ Archivos encontrados: $($files.Count)" -ForegroundColor Green

Write-Host ""
Write-Host "2. Inicializando repositorio Git..." -ForegroundColor Yellow

# Eliminar .git si existe
if (Test-Path ".git") {
    Remove-Item -Path ".git" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "   ✓ .git anterior eliminado" -ForegroundColor Green
}

# Inicializar Git
git init
Write-Host "   ✓ Repositorio Git inicializado" -ForegroundColor Green

Write-Host ""
Write-Host "3. Configurando Git..." -ForegroundColor Yellow

# Configurar usuario (ya debería estar configurado globalmente)
$userName = git config --global user.name
$userEmail = git config --global user.email

if ($userName) {
    Write-Host "   ✓ Usuario Git: $userName" -ForegroundColor Green
} else {
    Write-Host "   ⚠  Configura usuario Git:" -ForegroundColor Yellow
    Write-Host "      git config --global user.name 'Tu Nombre'" -ForegroundColor Gray
}

if ($userEmail) {
    Write-Host "   ✓ Email Git: $userEmail" -ForegroundColor Green
} else {
    Write-Host "   ⚠  Configura email Git:" -ForegroundColor Yellow
    Write-Host "      git config --global user.email 'tu@email.com'" -ForegroundColor Gray
}

Write-Host ""
Write-Host "4. Agregando archivos..." -ForegroundColor Yellow
git add .
Write-Host "   ✓ Archivos agregados al staging" -ForegroundColor Green

Write-Host ""
Write-Host "5. Haciendo commit..." -ForegroundColor Yellow
git commit -m "Primera versión del sitio web - El Rincón del Tapeo II"
Write-Host "   ✓ Commit realizado" -ForegroundColor Green

Write-Host ""
Write-Host "6. Conectando con GitHub..." -ForegroundColor Yellow
Write-Host "   URL del repositorio: https://github.com/comarni/El-Rincon-del-Tapeo-II" -ForegroundColor Gray

# Preguntar si ya existe el repositorio
$repoExists = Read-Host "¿Ya creaste el repositorio en GitHub? (s/n)"

if ($repoExists -eq 's' -or $repoExists -eq 'S') {
    Write-Host ""
    Write-Host "7. Subiendo a GitHub..." -ForegroundColor Yellow
    
    # Agregar remote
    git remote add origin https://github.com/comarni/El-Rincon-del-Tapeo-II.git
    Write-Host "   ✓ Remote 'origin' agregado" -ForegroundColor Green
    
    # Renombrar rama principal
    git branch -M main
    Write-Host "   ✓ Rama principal renombrada a 'main'" -ForegroundColor Green
    
    # Hacer push
    Write-Host "   Subiendo código..." -ForegroundColor Gray
    git push -u origin main
    
    Write-Host ""
    Write-Host "✅ ¡Código subido a GitHub!" -ForegroundColor Green
    
    Write-Host ""
    Write-Host "8. Configurar GitHub Pages:" -ForegroundColor Cyan
    Write-Host "   - Ve a: https://github.com/comarni/El-Rincon-del-Tapeo-II" -ForegroundColor Gray
    Write-Host "   - Click en 'Settings' (engranaje)" -ForegroundColor Gray
    Write-Host "   - En menú izquierdo, click en 'Pages'" -ForegroundColor Gray
    Write-Host "   - En 'Source', selecciona:" -ForegroundColor Gray
    Write-Host "     • Branch: main" -ForegroundColor Gray
    Write-Host "     • Folder: / (root)" -ForegroundColor Gray
    Write-Host "   - Click en 'Save'" -ForegroundColor Gray
    Write-Host ""
    Write-Host "   Tu sitio estará en:" -ForegroundColor White
    Write-Host "   https://comarni.github.io/El-Rincon-del-Tapeo-II/" -ForegroundColor Cyan -BackgroundColor DarkBlue
    
} else {
    Write-Host ""
    Write-Host "⚠  Primero crea el repositorio en GitHub:" -ForegroundColor Yellow
    Write-Host "   1. Ve a: https://github.com" -ForegroundColor Gray
    Write-Host "   2. Click en '+' → 'New repository'" -ForegroundColor Gray
    Write-Host "   3. Nombre: El-Rincon-del-Tapeo-II" -ForegroundColor Gray
    Write-Host "   4. Descripción: Sitio web del bar" -ForegroundColor Gray
    Write-Host "   5. NO marques 'Initialize with README'" -ForegroundColor Gray
    Write-Host "   6. Click en 'Create repository'" -ForegroundColor Gray
    Write-Host ""
    Write-Host "   Después ejecuta este script de nuevo." -ForegroundColor Gray
}

Write-Host ""
Write-Host "=== INSTRUCCIONES COMPLETAS ===" -ForegroundColor Cyan
Write-Host "Para más detalles, lee el archivo DEPLOY.md" -ForegroundColor Gray
Write-Host ""
Write-Host "Para probar localmente:" -ForegroundColor White
Write-Host "   start index.html" -ForegroundColor Gray
Write-Host ""
Write-Host "Para actualizar después de cambios:" -ForegroundColor White
Write-Host "   git add ." -ForegroundColor Gray
Write-Host "   git commit -m 'mensaje'" -ForegroundColor Gray
Write-Host "   git push" -ForegroundColor Gray

Write-Host ""
Write-Host "Presiona Enter para salir..."
Read-Host