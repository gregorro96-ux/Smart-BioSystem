# AquaCore OS Core

Status: Szkielet techniczny po pierwszej rozbudowie.

## Cel

AquaCore OS Core jest minimalnym rdzeniem startowym systemu AquaCore OS.

Na tym etapie odpowiada za:

- uruchomienie systemu z CLI,
- załadowanie konfiguracji,
- rozpoznanie środowiska pracy,
- rejestrację komend diagnostycznych,
- podstawowe logowanie lokalne,
- przygotowanie szkieletu Database,
- przygotowanie szkieletu API,
- przygotowanie szkieletu Security,
- przygotowanie boot sequence,
- podstawowy standard błędów i logów.

## Środowiska pracy

Obsługiwane środowiska:

- local,
- development,
- beta,
- stable.

Środowisko `stable` jest trybem docelowym dla wersji stabilnej.

Domyślne środowisko na etapie rozwoju:

- development.

## Konfiguracja

Plik konfiguracyjny:

- AquaCore OS/Config/aquacore.php

Aktualnie zawiera:

- app_name,
- environment,
- timezone,
- database,
- mqtt.

Konfiguracja MariaDB i MQTT istnieje jako szkielet.

Na tym etapie:

- MariaDB nie jest podłączona,
- MQTT nie jest podłączone,
- żadne połączenie zewnętrzne nie jest wykonywane.

## Komendy CLI

Punkt wejścia:

- AquaCore OS/aquacore.php

Dostępne komendy:

- system:status,
- system:health,
- config:show,
- database:test,
- database:status,
- mqtt:test,
- mqtt:status.

## Database

Warstwa Database posiada szkielet konfiguracji i statusu.

Nie wykonuje jeszcze połączenia z MariaDB.

Nie zmienia struktury bazy danych.

## MQTT

Warstwa MQTT posiada szkielet konfiguracji i statusu.

Nie wykonuje jeszcze połączenia z brokerem MQTT.

## API

Warstwa API posiada:

- Request,
- Response,
- Router,
- ApiResponse.

Standard odpowiedzi API:

- success,
- code,
- message,
- data,
- errors.

Router nie posiada jeszcze publicznych endpointów.

## Security

Warstwa Security posiada szkielet pod przyszłe logowanie:

- UserContext,
- AuthProviderInterface,
- NullAuthProvider,
- LoginResult.

Na tym etapie użytkownik jest zawsze anonimowy.

Logowanie nie jest jeszcze zaimplementowane.

## Boot Sequence

System posiada pierwszy szkielet boot sequence:

- BootSequence,
- BootStepInterface,
- BootStepResult,
- ConfigurationBootStep.

## Błędy i logi

Dodano podstawowy standard:

- ErrorCode,
- AquaCoreException,
- LogLevel,
- Logger.

Poziomy logów:

- DEBUG,
- INFO,
- WARNING,
- ERROR,
- CRITICAL.

## Testy

Dodano pierwsze testy automatyczne CLI:

- Tests/AquaCore OS/CliSmokeTest.php

Testy sprawdzają:

- system:status,
- config:show,
- database:status,
- mqtt:status.

## Zasady bezpieczeństwa

Na tym etapie nie wykonano zmian w:

- tabelach,
- kolumnach,
- relacjach,
- publicznym API,
- mapie folderów projektu,
- mapie bazy danych.

## Następne kroki

Proponowane kolejne kroki:

1. Skonfigurować Git i wykonać commit.
2. Przygotować właściwą konfigurację połączenia MariaDB.
3. Przygotować właściwą konfigurację połączenia MQTT.
4. Zaprojektować pierwszy prywatny endpoint health check.
5. Rozpocząć moduł Security od logowania lokalnego.
