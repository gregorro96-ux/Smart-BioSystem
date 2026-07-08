ETAP 1
Fundamenty systemu
(Status: W trakcie)

- Synology
- Docker
- MQTT
- Node-RED
- MariaDB
- dokumentacja
- relacje
- indeksy
- eksport SQL

↓

ETAP 2
AquaCore OS Core

- logika systemu
- API
- komunikacja z urządzeniami
- zarządzanie ekosystemami
- zarządzanie urządzeniami

↓

ETAP 3
Silniki środowiskowe

- Climate Engine
- Weather Engine
- Light Engine
- Moon Engine
- Season Engine
- Breeding Engine

↓

ETAP 4
Solar Ecosystem Hardware

Pierwsze urządzenie:

★★★★★ Pompa nawozowa SBS

Następnie:

★★★★ Sterownik lampy

★★★★★ Lampa 500 l

↓

ETAP 5
SBS Factory Station

↓

ETAP 6
AquaCore UI

- Dashboard
- wykresy
- alarmy
- historia życia
- multimedia
- konfiguracja

↓

ETAP 7
Automatyzacje

↓

ETAP 8
NAIDA

- analiza danych
- rekomendacje
- pamięć doświadczeń

↓

ETAP 9
Computer Vision

- analiza zdjęć
- analiza filmów
- zachowania zwierząt
- wzrost roślin

↓

ETAP 10
SBS LAB

↓

ETAP 11
Rozszerzona diagnostyka NAIDY

↓

ETAP 12
SBS Store

- aplikacje
- moduły
- silniki

↓

ETAP 13
Community

- posty
- komentarze
- wymiana doświadczeń

↓

ETAP 14
SBS Cloud

↓

ETAP 15
Globalna NAIDA

- podobne ekosystemy
- porównania
- analiza doświadczeń

↓

ETAP 16
Ekosystem urządzeń SBS

↓

ETAP 17
BEOS

Biological Ecosystem Operating System

---

AKTUALIZACJA 2026-07-08

Najbliższy kierunek prac po uruchomieniu bootowalnego szkieletu AquaCore OS Core:

1. Dokończyć commit dokumentacyjny Git.
2. Uporządkować koncepcję Boot Sequence jako rzeczywistego procesu rozruchu.
3. Opisać tryby startu: Server Mode, Client Mode, Embedded / Home Mode.
4. Przygotować standard bezpiecznej konfiguracji lokalnej poza repozytorium.
5. Podłączyć MariaDB najpierw wyłącznie jako test połączenia. Status: wykonano w Sesji 009, bez migracji i bez zmian tabel.
6. Podłączyć MQTT najpierw wyłącznie jako test połączenia. Status: wykonano w Sesji 009, bez publikacji, subskrypcji i runtime MQTT.
7. Przygotować prywatny health check API.
8. Rozpocząć Security od logowania lokalnego, sesji, `UserContext`, ról i indywidualnych uprawnień.
9. Dopiero później rozwijać runtime automatyzacji, scheduler i silniki środowiskowe.
10. Równolegle prowadzić changelog i release notes dla AquaCore OS oraz AquaCore UI.

---

ZAŁOŻENIE ORGANIZACYJNE

AquaCore UI nie jest kolejnym aktywnym etapem implementacyjnym przed stabilizacją AquaCore OS.

Najpierw należy doprowadzić AquaCore OS do stabilnie działającej wersji obejmującej konfigurację, MariaDB, MQTT, API, Security i podstawowy runtime.

Dopiero po tym etapie prace nad AquaCore UI zostaną przeniesione do osobnego wątku / osobnej konwersacji, aby nie mieszać kontekstu OS i UI.
