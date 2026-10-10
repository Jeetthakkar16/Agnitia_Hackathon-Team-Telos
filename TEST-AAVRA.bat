@echo off
setlocal
cd /d "%~dp0"
echo [AAVRA] Running offline engine and original app regressions.
call node --test scripts\test-saaya-core.mjs
if errorlevel 1 goto fail
call npm run test:v10
if errorlevel 1 goto fail
call node scripts\qa.mjs
if errorlevel 1 goto fail
echo [PASS] Source-level and SAAYA Core tests passed.
echo [NOTE] Run npm run build separately after installing dependencies.
pause
exit /b 0
:fail
echo [FAIL] Check error above.
pause
exit /b 1
