# AquaCore OS

Minimalny rdzeń startowy systemu AquaCore OS.

## Uruchomienie

```powershell
php "AquaCore OS\aquacore.php"
```

Bez podania komendy AquaCore OS pokazuje pomoc CLI.

## Komendy diagnostyczne

```powershell
php "AquaCore OS\aquacore.php" help
php "AquaCore OS\aquacore.php" system:status
php "AquaCore OS\aquacore.php" system:version
php "AquaCore OS\aquacore.php" system:health
php "AquaCore OS\aquacore.php" system:boot
php "AquaCore OS\aquacore.php" system:modules
php "AquaCore OS\aquacore.php" config:show
php "AquaCore OS\aquacore.php" config:validate
php "AquaCore OS\aquacore.php" logs:status
php "AquaCore OS\aquacore.php" database:status
php "AquaCore OS\aquacore.php" database:test
php "AquaCore OS\aquacore.php" mqtt:status
php "AquaCore OS\aquacore.php" mqtt:test
php "AquaCore OS\aquacore.php" api:status
php "AquaCore OS\aquacore.php" api:health
php "AquaCore OS\aquacore.php" security:status
php "AquaCore OS\aquacore.php" security:context
php "AquaCore OS\aquacore.php" tests:run
```

## Testy

```powershell
php "Tests\AquaCore OS\CliSmokeTest.php"
```

Albo przez AquaCore OS CLI:

```powershell
php "AquaCore OS\aquacore.php" tests:run
```

## Aktualny zakres

- MariaDB posiada pierwszy realny test połączenia przez `database:test`.
- MQTT posiada pierwszy bezpieczny test połączenia przez `mqtt:test`.
- API posiada pierwszy prywatny payload health/status przez `api:health`, ale nie uruchamia serwera HTTP i nie posiada publicznych endpointów.
- Security posiada anonimowy `UserContext`, role, uprawnienia i szkielet sesji, ale nie posiada jeszcze logowania.
- NAIDA pozostaje poza zakresem AquaCore OS Core.

## Git

AquaCore OS jest wersjonowany w lokalnym repozytorium Git projektu Smart BioSystem.

Aktualny stan:

- główna gałąź robocza: `development`,
- pierwszy commit rdzenia: `7ee68bf`,
- komunikat pierwszego commita: `feat(core): dodano bootowalny rdzeń AquaCore OS`.

Git nie jest elementem runtime AquaCore OS.

Przed kolejnymi commitami:

```powershell
git status
git diff
git add <konkretny-plik>
git diff --cached
git commit -m "typ(zakres): opis"
```

`git add .` nie powinno być używane rutynowo.

Sekrety i prywatna konfiguracja muszą pozostawać poza repozytorium.

## MariaDB

database:test wykonuje wyłącznie techniczny test SELECT 1.

Komenda zwraca diagnostic_code, który pomaga rozróżnić brak konfiguracji, brak pdo_mysql, niedostępny port, odmowę logowania i brak bazy bez ujawniania sekretów.

Test nie wykonuje migracji, nie zmienia tabel i nie zapisuje danych.

## MQTT

mqtt:test wykonuje wyłącznie techniczny test protokołu MQTT: CONNECT, odczyt CONNACK i DISCONNECT.

Komenda zwraca diagnostic_code, nie publikuje wiadomości, nie subskrybuje tematów i nie zmienia konfiguracji brokera.

Runtime MQTT, obsługa urządzeń, retained messages, QoS produkcyjny i automatyczny reconnect pozostają poza tym etapem.

## Rozruch i przyszły UI

`system:boot` uruchamia techniczną sekwencję bootowania AquaCore OS.

Boot Sequence jest docelowo wspólnym źródłem danych dla:

- diagnostyki CLI,
- ekranu rozruchu klienta AquaCore UI,
- paneli AquaCore Home,
- przyszłego AquaCore Monitor,
- przyszłego API status / health.

Nie należy tworzyć osobnego mechanizmu statusów wyłącznie dla interfejsu użytkownika.

Docelowe tryby startu:

- Server Mode,
- Client Mode,
- Embedded / Home Mode.

Po logowaniu użytkownik przechodzi przez weryfikację sesji, ekran rozruchu klienta oraz kontrolę usług przed wejściem do AquaCore UI.
