@echo off
setlocal
cd /d "%~dp0"
where npm >nul 2>nul
if errorlevel 1 (echo [ERROR] Node.js/npm required. & pause & exit /b 1)
if not exist "node_modules\.bin\next.cmd" (
 call npm install --no-audit --no-fund
 if errorlevel 1 (echo [FAIL] Cannot install dependencies. & pause & exit /b 1)
)
call npm run typecheck
if errorlevel 1 (echo [FAIL] Typecheck failed. & pause & exit /b 1)
call npm run build
if errorlevel 1 (echo [FAIL] Next.js build failed. & pause & exit /b 1)
echo [PASS] Web release build finished. Android and iOS still require platform SDKs and deployed HTTPS backend.
pause
