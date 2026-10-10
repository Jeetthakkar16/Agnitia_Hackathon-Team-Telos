@echo off
setlocal EnableExtensions
cd /d "%~dp0"
title TERRA07 - Localhost (keep this window open)
color 0A
echo.
echo  =============================================================
echo    TERRA07  ^|  EARTH + OCEAN + CLIMATE  ^|  v4.2 - SIMPLE MAP FIX
echo  =============================================================
echo.
where node >nul 2>nul
if errorlevel 1 (
  echo  [ERROR] Node.js was not found. Install Node.js 22 or later.
  pause
  exit /b 1
)
node -e "const m=parseInt(process.versions.node.split('.')[0]);process.exit(m>=22?0:1)"
if errorlevel 1 (
  echo  [ERROR] Install Node.js 22 or later.
  pause
  exit /b 1
)
rem Ensure another TERRA07/Next.js server is not already using port 3009.
rem Otherwise the browser might open an old Earth-only build.
powershell.exe -NoProfile -Command "if (Get-NetTCPConnection -LocalPort 3009 -State Listen -ErrorAction SilentlyContinue) { exit 1 } else { exit 0 }" >nul 2>nul
if errorlevel 1 (
  echo  [PORT 3009 IN USE] Close your previous TERRA07 command window.
  echo  Press Ctrl+C in the old window, then run this launcher again.
  echo  This prevents accidentally opening an old application version.
  pause
  exit /b 1
)
rem The stamp is written ONLY after pnpm install has completed successfully.
rem Check node_modules too, so a partially failed first install is repaired.
if not exist "node_modules\.bin\next.cmd" goto INSTALL
if not exist ".terra07-deps-ready" goto INSTALL
goto START

:INSTALL
echo  Installing or repairing TERRA07 dependencies...
echo  (pnpm 11 builds approved only for esbuild and sharp.)
call npx --yes pnpm@11.25.0 install
if errorlevel 1 (
  echo.
  echo  [ERROR] Dependency installation did not complete.
  echo  Please copy the full error output and send it for troubleshooting.
  pause
  exit /b 1
)
> ".terra07-deps-ready" echo Successfully installed with pnpm 11.25.0

:START
if not exist "public\maplibre-gl-worker.mjs" (
  echo  Preparing the WebGL mapping worker...
  node scripts\copy-maplibre-worker.mjs
  if errorlevel 1 (
    echo  [ERROR] The WebGL mapping worker could not be prepared.
    pause
    exit /b 1
  )
)
echo.
echo  Starting TERRA07 v4.2 at http://localhost:3009
echo  Browser opens when the app responds. Leave this window open.
echo  To stop the server press Ctrl+C.
echo.
start "" /b powershell.exe -NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File "%~dp0tools\open-when-ready.ps1" "http://localhost:3009/welcome"
call npx --yes pnpm@11.25.0 dev
if errorlevel 1 (
  echo.
  echo  [ERROR] The Next.js server failed to start.
  echo  If port 3009 is in use, close the other local server and retry.
  pause
)
endlocal
