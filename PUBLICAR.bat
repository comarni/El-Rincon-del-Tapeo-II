@echo off
echo ========================================
echo   PUBLICAR EL RINCON DEL TAPEO II
echo ========================================
echo.
echo Este script te ayudara a publicar tu sitio web.
echo.

REM Cambiar a la carpeta del script
cd /d "%~dp0"

REM Verificar si PowerShell está disponible
where powershell >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: PowerShell no encontrado.
    echo Instala PowerShell o ejecuta manualmente.
    pause
    exit /b 1
)

echo Ejecutando script de publicacion...
echo.
powershell -ExecutionPolicy Bypass -File "publish-to-github.ps1"

echo.
echo ========================================
echo   PROCESO COMPLETADO
echo ========================================
echo.
echo Si tienes problemas, lee DEPLOY.md
echo.
pause