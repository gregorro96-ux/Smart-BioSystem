# SBS (Smart Bio System)

# Architektura Systemu - Full Version v3

Projekt w fazie aktywnej realizacji.

Stan bazy danych: 93 tabele.

## AquaCore OS

-   API
-   Automation
-   Backup
-   Compatibility
-   Core
-   Database
-   Engines
-   Logging
-   NAIDA
-   Notifications
-   Scheduler
-   Security
-   Services
-   System

## Engines

-   Climate Engine
-   Life History Engine
-   Light Engine
-   Moon Engine
-   Weather Engine

## Knowledge Base

Wewnętrzna baza wiedzy NAIDA.

## Library

Biblioteka wiedzy użytkownika.

## LightLab

Laboratorium kalibracji i diagnostyki oświetlenia.

## Kontrola wersji

Git jest warstwą kontroli wersji projektu Smart BioSystem.

Repozytorium znajduje się lokalnie w głównym katalogu projektu SBS na dysku `S:`.

Główna gałąź robocza:

- development

Rola Git:

- historia zmian kodu i dokumentacji
- kontrola zakresu commitów
- audyt rozwoju projektu
- wsparcie pracy lokalnej na Synology

Git nie jest elementem runtime SBS.

Nie uczestniczy w działaniu AquaCore OS, MQTT, bazy danych, automatyzacji ani urządzeń.

Pliki zawierające hasła, tokeny, klucze prywatne, pliki `.env` i prywatną konfigurację muszą pozostawać poza repozytorium.

