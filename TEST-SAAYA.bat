@echo off
setlocal EnableExtensions
cd /d "%~dp0"
title SAAYA v10 tests
node --version
if errorlevel 1 (echo [ERROR] Install Node.js 22+ & pause & exit /b 1)
call npm run test:v10
if errorlevel 1 goto fail
call npm run test:v9
if errorlevel 1 goto fail
call npm run test:occupation
if errorlevel 1 goto fail
call npm run test:toolkit
if errorlevel 1 goto fail
call npm run test:guidance
if errorlevel 1 goto fail
call npm run test:pure
if errorlevel 1 goto fail
call npm run qa
if errorlevel 1 goto fail
call npm run test:isotherms
if errorlevel 1 goto fail
if exist "node_modules\.bin\tsc.cmd" (
 call npm run typecheck
 if errorlevel 1 goto fail
) else (
 echo [INFO] Full TypeScript check requires npm install.
)
echo.
echo [PASS] All available SAAYA checks completed.
pause
exit /b 0
:fail
echo [FAIL] Read errors above.
pause
exit /b 1
