# AquaCore OS CLI

Status: Szkielet diagnostyczny.

## Punkt wejścia

```powershell
php "AquaCore OS\aquacore.php" <command>
```

Bez podania komendy uruchamiana jest pomoc CLI.

## Standard komendy

Każda komenda CLI posiada:

- name,
- description,
- usage,
- execute.

## Help

### help

Pokazuje listę dostępnych komend, opis oraz sposób użycia.

## Komendy System

### system:status

Pokazuje podstawowy status AquaCore OS.

### system:version

Pokazuje wersję AquaCore OS.

### system:health

Pokazuje podstawowy lokalny health check bez połączenia z bazą i MQTT.

### system:boot

Uruchamia aktualną sekwencję bootowania.

Na tym etapie zawiera tylko krok konfiguracji.
CLI pokazuje techniczny wynik bootowania. AquaCore UI i przyszły AquaCore Monitor powinny korzystać z tego samego modelu danych, a nie z osobnej sekwencji przygotowanej wyłącznie na potrzeby interfejsu.

Docelowo wynik `system:boot` powinien wspierać statusy modułów takie jak `Loading`, `OK`, `Warning`, `Error`, `Skipped` i `Locked`.

### system:modules

Pokazuje status modułów:

- Config,
- Logging,
- System,
- Database,
- MQTT,
- API,
- Security.

## Komendy Config

### config:show

Pokazuje aktywną konfigurację systemu.

Nie pokazuje haseł.

### config:validate

Sprawdza podstawową poprawność konfiguracji.

Nie wykonuje połączeń zewnętrznych.

## Komendy Logs

### logs:status

Sprawdza dostępność katalogu logów i pliku logu.

Na udziałach SMB/UNC diagnostyka używa realnej próby zapisu.

## Komendy Database

### database:status

Pokazuje konfigurację warstwy Database.

Nie wykonuje połączenia z MariaDB.

### database:test

Pokazuje gotowość szkieletu Database.

Nie wykonuje połączenia z MariaDB.

## Komendy MQTT

### mqtt:status

Pokazuje konfigurację warstwy MQTT.

Nie wykonuje połączenia z brokerem.

### mqtt:test

Pokazuje gotowość szkieletu MQTT.

Nie wykonuje połączenia z brokerem.

## Komendy API

### api:status

Pokazuje status API.

Router istnieje, ale publiczne endpointy nie są jeszcze zarejestrowane.

## Komendy Security

### security:status

Pokazuje status modułu Security.

Na tym etapie użytkownik pozostaje anonimowy, a logowanie nie jest zaimplementowane.

## Komendy Tests

### tests:run

Uruchamia testy CLI AquaCore OS.

Komenda nie jest wywoływana przez smoke test, aby uniknąć rekurencji.

## Testy CLI

Testy znajdują się w pliku:

- Tests/AquaCore OS/CliSmokeTest.php

Uruchomienie:

```powershell
php "Tests\AquaCore OS\CliSmokeTest.php"
```

albo:

```powershell
php "AquaCore OS\aquacore.php" tests:run
```

## Git a CLI

CLI AquaCore OS nie wykonuje operacji Git.

Git służy wyłącznie do kontroli wersji kodu i dokumentacji projektu.

Przed commitowaniem zmian w CLI należy wykonać testy, a następnie sprawdzić:

1. `git status`
2. `git diff`
3. selektywne `git add <plik>`
4. `git diff --cached`
5. `git commit`

`git add .` nie powinno być używane rutynowo.

`config:show` pokazuje także informację `local_override_loaded`, która mówi, czy AquaCore OS załadował lokalny override konfiguracji.

Komenda nie pokazuje sekretów.