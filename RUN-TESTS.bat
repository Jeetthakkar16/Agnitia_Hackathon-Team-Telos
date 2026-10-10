@echo off
setlocal EnableExtensions
cd /d "%~dp0"
if not exist "node_modules\.bin\next.cmd" (
 echo  Run START-TERRA07.bat first to install dependencies.
 pause
 exit /b 1
)
echo  Running TERRA07 v4 source and safety regressions...
call npx --yes pnpm@11.25.0 test:all
if errorlevel 1 goto :bad
call node --experimental-strip-types scripts\test-v4-experience.mjs
if errorlevel 1 goto :bad
call node scripts\check-v4-syntax.mjs
if errorlevel 1 goto :bad
call npx --yes pnpm@11.25.0 typecheck
if errorlevel 1 goto :bad
call npx --yes pnpm@11.25.0 build
if errorlevel 1 goto :bad
echo.
echo  TERRA07 v4 QA, tests, typecheck and production build passed.
pause
exit /b 0
:bad
echo  Checks failed. Copy the complete error for troubleshooting.
pause
exit /b 1
