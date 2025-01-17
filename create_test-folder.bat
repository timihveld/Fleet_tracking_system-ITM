@echo off
setlocal enabledelayedexpansion

:: Path to save the installer
set INSTALLER_PATH=C:\google_chrome\firefox_installer.exe

:: URL for Firefox 64-bit version
set FIREFOX_URL=https://download.mozilla.org/?product=firefox-latest&os=win64&lang=en-US

:: Check if Firefox is already installed
if exist "C:\Program Files\Mozilla Firefox\firefox.exe" (
    echo Firefox is already installed.
    exit /b
)

:: Download Firefox if not already installed
echo Downloading Firefox...
powershell -Command "Invoke-WebRequest -Uri !FIREFOX_URL! -OutFile !INSTALLER_PATH!"

:: Check if the download was successful
if exist "!INSTALLER_PATH!" (
    echo Firefox downloaded successfully.
    echo Installing Firefox...

    :: Run the installer silently
    start /wait !INSTALLER_PATH! /silent

    :: Check if the installation was successful
    if exist "C:\Program Files\Mozilla Firefox\firefox.exe" (
        echo Firefox has been installed successfully.
    ) else (
        echo Firefox installation failed.
        exit /b 1
    )
) else (
    echo Failed to download Firefox.
    exit /b 1
)

:: Clean up installer
del /f /q "!INSTALLER_PATH!"
