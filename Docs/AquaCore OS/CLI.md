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

Uruchamia pierwszy bezpieczny test połączenia z MariaDB.

Jeżeli `database.configured` ma wartość `false`, test nie wykonuje połączenia i zwraca status `skipped`.

Jeżeli `database.configured` ma wartość `true`, komenda wykonuje tylko techniczny test `SELECT 1`.

Do realnego testu połączenia wymagane jest rozszerzenie PHP `pdo_mysql`.

Komenda nie wykonuje migracji, nie zmienia tabel, nie zapisuje danych i nie pokazuje hasła.

Wynik zawiera bezpieczne pole `diagnostic_code`, które może przyjąć m.in. wartości:

- `none` - połączenie działa,
- `not_configured` - konfiguracja MariaDB jest wyłączona,
- `pdo_mysql_missing` - brakuje rozszerzenia PHP `pdo_mysql`,
- `connection_unavailable` - serwer lub port MariaDB nie odpowiada,
- `access_denied` - MariaDB odrzuciła logowanie albo host użytkownika,
- `unknown_database` - wskazana baza danych nie istnieje albo nie jest dostępna,
- `host_not_found` - nie znaleziono hosta MariaDB,
- `server_unavailable` - serwer zerwał połączenie,
- `pdo_exception` - inny błąd PDO bez ujawniania szczegółów.

`diagnostic_code` nie zawiera hasła, pełnego DSN ani treści wyjątku PDO.

## Komendy MQTT

### mqtt:status

Pokazuje konfigurację warstwy MQTT.

Nie wykonuje połączenia z brokerem.

### mqtt:test

Uruchamia pierwszy bezpieczny test połączenia z brokerem MQTT.

Jeżeli `mqtt.configured` ma wartość `false`, test nie wykonuje połączenia i zwraca status `skipped`.

Jeżeli `mqtt.configured` ma wartość `true`, komenda wykonuje tylko techniczny test protokołu MQTT: `CONNECT`, odczyt `CONNACK` i `DISCONNECT`.

Komenda nie publikuje wiadomości, nie subskrybuje tematów, nie zmienia konfiguracji brokera i nie zapisuje danych.

Wynik zawiera bezpieczne pole `diagnostic_code`, które może przyjąć m.in. wartości:

- `none` - połączenie działa,
- `not_configured` - konfiguracja MQTT jest wyłączona,
- `client_missing` - brakuje wymaganej funkcji klienta socket/stream PHP albo broker odrzucił identyfikator klienta,
- `invalid_host` - host MQTT jest niepoprawny,
- `invalid_port` - port MQTT jest niepoprawny,
- `host_not_found` - nie znaleziono hosta MQTT,
- `connection_refused` - broker lub firewall odrzucił połączenie,
- `authentication_failed` - broker odrzucił logowanie,
- `timeout` - broker nie odpowiedział w czasie,
- `tls_error` - wystąpił problem TLS/SSL,
- `protocol_error` - broker zwrócił niepoprawną odpowiedź protokołu,
- `broker_unavailable` - broker jest niedostępny,
- `unknown_error` - inny błąd bez ujawniania szczegółów.

`diagnostic_code` nie zawiera loginu, hasła, pełnego URI ani sekretów.

## Komendy API

### api:status

Pokazuje status API.

Router istnieje, ale publiczne endpointy nie są jeszcze zarejestrowane.

### api:health

Pokazuje pierwszy prywatny payload health/status przyszłego API bez uruchamiania serwera HTTP.

Domyślnie komenda działa w trybie `snapshot` i nie wykonuje zewnętrznych testów MariaDB ani MQTT.

Opcjonalny argument `--live` wykonuje świadome testy diagnostyczne MariaDB i MQTT z aktualnej konfiguracji lokalnej.

Komenda zwraca JSON zgodny ze standardem API:

- `success`,
- `code`,
- `message`,
- `data`,
- `errors`.

`api:health` nie tworzy publicznego endpointu, nie obsługuje logowania, nie wystawia serwera HTTP i nie zmienia bazy ani brokera MQTT.

## Komendy Security

### security:status

Pokazuje status modułu Security.

Na tym etapie użytkownik pozostaje anonimowy, a logowanie nie jest zaimplementowane.

### security:context

Pokazuje aktualny kontekst bezpieczeństwa bez logowania użytkownika.

Obecny kontekst jest anonimowy i zawiera:

- `authenticated`,
- `user_id_present`,
- `roles`,
- `permissions`,
- `session`.

Komenda nie tworzy sesji, nie loguje użytkownika, nie odczytuje haseł i nie łączy się z bazą danych.

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
