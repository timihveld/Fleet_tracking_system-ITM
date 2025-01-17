@echo off
:: Maak de map C:\tbm aan als deze nog niet bestaat
if not exist C:\tbm (
    mkdir C:\tbm
)

:: Maak een map voor Google Chrome
if not exist C:\tbm\google_chrome (
    mkdir C:\tbm\google_chrome
)

:: Download Google Chrome
echo Downloaden van Google Chrome...
curl -o C:\tbm\google_chrome\chrome_installer.exe https://dl.google.com/chrome/install/latest/chrome_installer.exe

:: Installeer Google Chrome
echo Installeren van Google Chrome...
C:\tbm\google_chrome\chrome_installer.exe /silent /install

:: Maak een tekstbestand met de boodschap voor TBM en CI/CD
echo Dit is voor de opdracht van Technische Beheer en Monitoring (TBM) en CI/CD en werkt! > C:\tbm\opdracht_uitgevoerd.txt

:: Bevestiging
echo Map, bestand, en Google Chrome zijn succesvol aangemaakt en geïnstalleerd.
pause
