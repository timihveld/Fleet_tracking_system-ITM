@echo off
setlocal

:: Set the path for the installation folder
set INSTALL_DIR=C:\google_chrome

:: Check if the folder already exists and create it if necessary
if not exist "%INSTALL_DIR%" (
    mkdir "%INSTALL_DIR%"
)

:: Set the download URL for the 64-bit version of Google Chrome for Windows
set CHROME_URL=https://dl.google.com/chrome/install/standalone/chrome_installer.exe

:: Change to the installation folder
cd /d "%INSTALL_DIR%"

:: Download Google Chrome installer
echo Downloading Google Chrome...
powershell -Command "Invoke-WebRequest -Uri %CHROME_URL% -OutFile %INSTALL_DIR%\chrome_installer.exe"

:: Check if the file was downloaded successfully
if exist "%INSTALL_DIR%\chrome_installer.exe" (
    echo Google Chrome installer downloaded successfully.
) else (
    echo Failed to download Google Chrome installer.
    exit /b 1
)

:: Run the installer silently
echo Installing Google Chrome...
start /wait %INSTALL_DIR%\chrome_installer.exe --silent --install

:: Check if installation was successful
if exist "C:\Program Files\Google\Chrome\Application\chrome.exe" (
    echo Google Chrome installed successfully.
    echo Google Chrome has been successfully installed! >> C:\installation_log.txt
) else (
    echo Installation failed.
    echo Google Chrome installation failed! >> C:\installation_log.txt
)

:: Clean up installer
del "%INSTALL_DIR%\chrome_installer.exe"

:: End of script
echo Task completed. Press any key to exit.
pause
