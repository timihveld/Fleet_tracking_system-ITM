@echo off
:: Controleer of de map C:\google_chrome bestaat, maak deze alleen aan als deze nog niet bestaat
if not exist C:\google_chrome (
    mkdir C:\google_chrome
)

:: Download Google Chrome, alleen als het nog niet gedownload is
if not exist C:\google_chrome\chrome_installer.exe (
    echo Downloaden van Google Chrome...
    curl -o C:\google_chrome\chrome_installer.exe https://dl.google.com/chrome/install/latest/chrome_installer.exe
)

:: Installeer Google Chrome automatisch als het gedownload is
if exist C:\google_chrome\chrome_installer.exe (
    echo Installeren van Google Chrome...
    C:\google_chrome\chrome_installer.exe /silent /install
)

:: Maak een tekstbestand met de boodschap voor TBM en CI/CD
echo Dit is voor de opdracht van Technische Beheer en Monitoring (TBM) en CI/CD en werkt! > C:\google_chrome\opdracht_uitgevoerd.txt

:: Bevestiging
echo Google Chrome is succesvol gedownload, geïnstalleerd en de opdracht is voltooid.
pause
