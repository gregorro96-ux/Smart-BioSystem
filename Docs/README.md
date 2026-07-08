# Dokumentacja Smart BioSystem

Ten folder zawiera dokumentację projektu SBS.

Główna zasada: dokument powinien znajdować się tam, gdzie użytkownik lub opiekun projektu będzie go naturalnie szukał.

## Najważniejsze miejsca

- `AGENTS.md` - zasady pracy dla Codex i agentów projektu.
- `AquaCore OS/` - dokumentacja rdzenia AquaCore OS i CLI.
- `AquaCore UI/` - dokumentacja interfejsu użytkownika AquaCore UI.
- `Architektura/` - dokumenty architektoniczne SBS.
- `Dzienniki/` - dziennik prac i dziennik projektu.
- `Raporty/` - raporty błędów i incydentów.
- `Standardy/` - standardy pracy, struktury katalogów i dokumentowania.
- `Zarządzanie projektem/` - decyzje projektowe, historia rozwoju i roadmapa.
- `Dokumentacja techniczna/` - dokumentacja bazy danych, integracji, urządzeń i elektroniki.

## Dokumentacja techniczna

- `Dokumentacja techniczna/Baza danych/` - mapy bazy, opisy schematów i eksportów SQL.
- `Dokumentacja techniczna/Integracje/` - MQTT i przyszłe integracje techniczne.
- `Dokumentacja techniczna/Urządzenia/` - ESP32, specyfikacje urządzeń i elektronika.
- `Dokumentacja techniczna/Urządzenia/Oświetlenie/` - lampy, LED, LightLab i dokumenty związane z oświetleniem.

## Pliki wrażliwe

Pliki z hasłami, tokenami, kluczami i prywatną konfiguracją nie są częścią dokumentacji projektowej przeznaczonej do wersjonowania.

Takie pliki muszą pozostać poza repozytorium albo w lokalizacji wyłączonej przez `.gitignore`.

## Standard pracy z GitHubem

Szczegółowy standard commitów, pushowania, opisów commitów, ochrony sekretów i kontroli przed większym etapem znajduje się w:

- `Standardy/Standard pracy z GitHubem.md`

## Standard konfiguracji lokalnej

Zasady przechowywania prywatnych plików poza repozytorium, przygotowywania przykładów konfiguracji bez sekretów oraz rozróżniania plików commitowanych i lokalnych znajdują się w:

- `Standardy/Standard konfiguracji lokalnej.md`