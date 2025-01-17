@echo off
:: Controleer of de map C:\google_chrome bestaat, maak deze alleen aan als deze nog niet bestaat
if not exist C:\google_chrome (
    mkdir C:\google_chrome
)

:: Controleer of de installatie van Chrome al gedaan is, zo niet, download de juiste versie
if not exist C:\google_chrome\chrome_installer.exe (
    echo Downloaden van Google Chrome...

    :: Controleer of de machine een 64-bit of 32-bit Windows heeft
    set "ARCHITECTURE="
    if exist "%ProgramFiles(x86)%" set ARCHITECTURE=64
    if not defined ARCHITECTURE set ARCHITECTURE=32

    :: Download de juiste versie van de installer van een betrouwbare bron
    if "%ARCHITECTURE%"=="64" (
        echo 64-bit versie gedetecteerd, downloaden van de 64-bit Chrome installer...
        curl -o C:\google_chrome\chrome_installer.exe https://dl.google.com/chrome/install/standalonesetup64.exe
    ) else (
        echo 32-bit versie gedetecteerd, downloaden van de 32-bit Chrome installer...
        curl -o C:\google_chrome\chrome_installer.exe https://dl.google.com/chrome/install/standalonesetup.exe
    )
)

:: Controleer of de installer aanwezig is en voer deze uit
if exist C:\google_chrome\chrome_installer.exe (
    echo Installeren van Google Chrome...
    start /wait C:\google_chrome\chrome_installer.exe /silent /install
    if errorlevel 1 (
        echo Er is een fout opgetreden tijdens de installatie van Google Chrome.
    ) else (
        echo Google Chrome is succesvol geïnstalleerd.
    )
)

:: Maak een tekstbestand met de boodschap voor TBM en CI/CD
echo Dit is voor de opdracht van Technische Beheer en Monitoring (TBM) en CI/CD en werkt! > C:\google_chrome\opdracht_uitgevoerd.txt

:: Bevestiging
echo Google Chrome is succesvol gedownload, geïnstalleerd en de opdracht is voltooid.
pause
