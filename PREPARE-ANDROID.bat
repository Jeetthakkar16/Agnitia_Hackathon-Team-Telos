@echo off
setlocal
cd /d "%~dp0"
echo ====================================================
echo SAAYA V10 - PREPARE ANDROID PROJECT
echo ====================================================
echo.
echo This prepares an Android Studio project, NOT a signed APK or store release.
echo You must have a LIVE public HTTPS deployment for SAAYA APIs.
echo.
if "%CAPACITOR_SERVER_URL%"=="" (
  set /p "CAPACITOR_SERVER_URL=Paste your public HTTPS SAAYA URL: "
)
if "%CAPACITOR_SERVER_URL%"=="" (echo Missing URL. & pause & exit /b 1)
where node >nul 2>&1 || (echo Install Node.js 22+ first. & pause & exit /b 1)
if not exist node_modules\@capacitor\cli (
  echo Installing dependencies... internet required.
  call npm install
  if errorlevel 1 (echo Install failed. & pause & exit /b 1)
)
call npm run native:android:prepare
if errorlevel 1 (echo Android setup failed. Check the messages above. & pause & exit /b 1)
echo.
echo Done. Open Android Studio with this project's android folder.
echo Test with a real phone, then create a signed release using YOUR keystore.
pause
