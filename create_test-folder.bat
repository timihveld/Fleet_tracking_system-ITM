@echo off
setlocal

:: Set the path for the installation folder
set INSTALL_DIR=C:\firefox_installer

:: Check if the folder already exists and create it if necessary
if not exist "%INSTALL_DIR%" (
    mkdir "%INSTALL_DIR%"
)

:: Set the correct URL for the latest Firefox installer for Windows (64-bit)
set FIREFOX_URL=https://download.mozilla.org/firefox/stable/desktop

:: Change to the installation folder
cd /d "%INSTALL_DIR%"

:: Download Firefox installer
echo Downloading Firefox...
powershell -Command "Invoke-WebRequest -Uri %FIREFOX_URL% -OutFile %INSTALL_DIR%\firefox_installer.exe"

:: Check if the file was downloaded successfully
if exist "%INSTALL_DIR%\firefox_installer.exe" (
    echo Firefox installer downloaded successfully.
) else (
    echo Failed to download Firefox installer.
    exit /b 1
)

:: Run the installer silently
echo Installing Firefox...
start /wait %INSTALL_DIR%\firefox_installer.exe /silent /install

:: Check if installation was successful
if exist "C:\Program Files\Mozilla Firefox\firefox.exe" (
    echo Firefox installed successfully.
    echo Firefox has been successfully installed! >> C:\installation_log.txt
) else (
    echo Installation failed.
    echo Firefox installation failed! >> C:\installation_log.txt
)

:: Clean up installer
del "%INSTALL_DIR%\firefox_installer.exe"

:: End of script
echo Task completed. Press any key to exit.
pause
