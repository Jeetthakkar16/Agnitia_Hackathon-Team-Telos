@echo off
setlocal EnableExtensions
cd /d "%~dp0"
title SAAYA 10 - Simple Mobile
color 0B
echo.
echo  ========================================================
echo   SAAYA 10.0 - YOUR DAY MADE SIMPLE
 echo  ========================================================
echo.
where node >nul 2>nul
if errorlevel 1 (
 echo [ERROR] Node.js 22 or newer is needed. Visit https://nodejs.org/
 pause
 exit /b 1
)
node -e "process.exit(parseInt(process.versions.node.split('.')[0])>=22?0:1)"
if errorlevel 1 (
 echo [ERROR] Node.js version must be 22 or newer.
 pause
 exit /b 1
)
where npm >nul 2>nul
if errorlevel 1 (
 echo [ERROR] npm not found. Reinstall Node.js with npm.
 pause
 exit /b 1
)
if not exist "node_modules\.bin\next.cmd" (
 echo [SETUP] Installing dependencies. Internet access is needed on first launch.
 call npm install --no-audit --no-fund
 if errorlevel 1 (
  echo [ERROR] Dependency setup failed. Check your internet and the message above.
  pause
  exit /b 1
 )
)
if not exist "public\maplibre-gl-worker.mjs" (
 call node scripts\copy-maplibre-worker.mjs
 if errorlevel 1 echo [WARN] Globe worker setup failed. Check dependencies.
)
echo.
echo [START] Open http://localhost:3010/welcome (first visit)
echo [START] Existing user dashboard: http://localhost:3010/
echo [INFO] Press Ctrl+C to stop the application.
echo.
start "" /b powershell.exe -NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File "%~dp0tools\open-when-ready.ps1" "http://localhost:3010/welcome"
call npm run dev
if errorlevel 1 (
 echo [ERROR] Server did not start. Ensure port 3010 is free.
 pause
)
endlocal
