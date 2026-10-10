@echo off
setlocal EnableExtensions
cd /d "%~dp0"
title SAAYA v10 production build verification
if not exist "node_modules\.bin\next.cmd" (
 echo Installing dependencies...
 call npm install --no-audit --no-fund
 if errorlevel 1 goto fail
)
call npm run typecheck
if errorlevel 1 goto fail
call npm run build
if errorlevel 1 goto fail
echo.
echo [SUCCESS] SAAYA production build completed.
pause
exit /b 0
:fail
echo [FAILED] Read the errors and fix before deployment.
pause
exit /b 1
