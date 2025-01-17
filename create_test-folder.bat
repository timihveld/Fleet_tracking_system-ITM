@echo off
:: Maak de map C:\tbm aan als deze nog niet bestaat
if not exist C:\tbm (
    mkdir C:\tbm
)

:: Maak een tekstbestand met de gewenste boodschap
echo Dit is voor de opdracht van Technische Beheer en Monitoring (TBM) en CI/CD en werkt! > C:\tbm\opdracht_uitgevoerd.txt

:: Bevestiging
echo Map en bestand zijn succesvol aangemaakt.
pause
