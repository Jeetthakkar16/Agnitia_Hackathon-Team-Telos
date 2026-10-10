@echo off
setlocal EnableExtensions
cd /d "%~dp0"
title AAVRA v13 - Powered by SAAYA Core
echo.
echo ========================================================
echo    AAVRA v13  ^|  ORIGINAL SAAYA v10, UPGRADED
echo    Weather-aware mobile app powered by SAAYA Core
 echo ========================================================
echo.
where node >nul 2>nul
if errorlevel 1 (
  echo [ERROR] Node.js 22 or later is required. Install from https://nodejs.org/
  pause
  exit /b 1
)
node -e "process.exit(parseInt(process.versions.node.split('.')[0],10)>=22?0:1)"
if errorlevel 1 (
  echo [ERROR] Upgrade Node.js to version 22 or newer.
  pause
  exit /b 1
)
where npm >nul 2>nul
if errorlevel 1 (
  echo [ERROR] npm is missing from Node.js installation.
  pause
  exit /b 1
)
if not exist "node_modules\.bin\next.cmd" (
  echo [SETUP] Installing Next.js dependencies for first launch...
  echo [NOTE] Internet access is required for this one-time setup.
  call npm install --no-audit --no-fund
  if errorlevel 1 (
    echo [ERROR] npm installation failed. Check your network and npm error above.
    pause
    exit /b 1
  )
)
if not exist "public\maplibre-gl-worker.mjs" (
  call node scripts\copy-maplibre-worker.mjs
  if errorlevel 1 echo [WARN] Map worker setup could not be confirmed.
)
echo.
echo [READY] Starting app at http://127.0.0.1:3010
echo [FIRST VISIT] http://127.0.0.1:3010/welcome
echo [INFO] SAAYA Core API is embedded at /api/saaya/evaluate
echo [INFO] Close this window or press Ctrl+C to stop.
echo.
start "" /b powershell.exe -NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File "%~dp0tools\open-when-ready.ps1" "http://127.0.0.1:3010/welcome"
call npm run dev
if errorlevel 1 (
  echo [ERROR] Next.js could not start. Verify port 3010 and the log above.
  pause
)
endlocal
