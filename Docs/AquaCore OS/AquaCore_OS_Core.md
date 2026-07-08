# AquaCore OS Core

Status: Bootowalny szkielet techniczny po pierwszym commicie Git.

## Cel

AquaCore OS Core jest minimalnym rdzeniem startowym systemu AquaCore OS.

Na tym etapie odpowiada za:

- uruchomienie systemu z CLI,
- załadowanie konfiguracji,
- rozpoznanie środowiska pracy,
- rejestrację komend diagnostycznych,
- przygotowanie szkieletu Database,
- przygotowanie szkieletu MQTT,
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

Konfiguracja MariaDB i MQTT posiada już pierwszy bezpieczny tryb testowy.

Na tym etapie:

- MariaDB ma realny test połączenia przez `database:test`,- MQTT ma realny test połączenia przez `mqtt:test`,- testy nie wykonują runtime aplikacyjnego, migracji, publikacji ani subskrypcji produkcyjnych.

## Komendy CLI

Punkt wejścia:

- AquaCore OS/aquacore.php

Dostępne komendy:

- help,
- system:status,
- system:version,
- system:health,
- system:boot,
- system:modules,
- config:show,
- config:validate,
- logs:status,
- database:test,
- database:status,
- mqtt:test,
- mqtt:status,
- api:status,
- security:status,
- tests:run.

## Database

Warstwa Database posiada szkielet konfiguracji i statusu.

Posiada pierwszy bezpieczny test połączenia z MariaDB uruchamiany przez:

- `database:test`.

Test połączenia:

- wykonuje się tylko wtedy, gdy `database.configured` ma wartość `true`,
- używa lokalnej konfiguracji poza repozytorium,
- wymaga rozszerzenia PHP `pdo_mysql`,
- wykonuje wyłącznie techniczne `SELECT 1`,
- nie wykonuje migracji,
- nie zmienia tabel,
- nie zapisuje danych,
- nie wypisuje hasła w terminalu ani logach.

Jeżeli baza nie jest skonfigurowana, test kończy się statusem `skipped`.

Nie zmienia struktury bazy danych.

## MQTT

Warstwa MQTT posiada szkielet konfiguracji, statusu i pierwszy bezpieczny test połączenia z brokerem MQTT uruchamiany przez:

- mqtt:test.

Test połączenia:

- wykonuje się tylko wtedy, gdy mqtt.configured ma wartość 	rue,
- używa lokalnej konfiguracji poza repozytorium albo bezsekretowego override testowego,
- wykonuje wyłącznie techniczne CONNECT, odczyt CONNACK i DISCONNECT,
- nie publikuje wiadomości,
- nie subskrybuje tematów,
- nie zmienia konfiguracji brokera,
- nie uruchamia runtime MQTT.

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

API posiada pierwszy prywatny kontrakt health/status dostępny z CLI przez:

- pi:health.

Komenda zwraca payload JSON zgodny ze standardem ApiResponse i nie uruchamia serwera HTTP.

## Security

Warstwa Security posiada szkielet pod przyszłe logowanie:

- UserContext,
- AuthProviderInterface,
- NullAuthProvider,
- LoginResult.

Na tym etapie użytkownik jest zawsze anonimowy.

Security posiada fundament: UserContext, role, uprawnienia i SessionContext, ale logowanie nie jest jeszcze zaimplementowane.

## Boot Sequence

System posiada pierwszy szkielet boot sequence:

- BootSequence,
- BootStepInterface,
- BootStepResult,
- ConfigurationBootStep.
Boot Sequence jest docelowo rzeczywistym procesem rozruchu AquaCore OS, a nie osobną animacją interfejsu.

Zasady rozwoju:

- każdy krok bootowania wykonuje rzeczywisty moduł systemu,
- lista kroków bootowania jest dynamiczna,
- wynik bootowania pochodzi z danych systemowych, a nie z ręcznie przygotowanej sekwencji UI,
- AquaCore UI i przyszły AquaCore Monitor korzystają z tych samych danych diagnostycznych,
- nie tworzy się drugiego niezależnego mechanizmu statusów modułów.

Obecny stan techniczny:

- `BootSequence` uruchamia zarejestrowane kroki,
- `BootStepInterface` definiuje kontrakt kroku,
- `BootStepResult` zwraca nazwę kroku, wynik powodzenia i komunikat,
- aktualnie zarejestrowany jest krok `ConfigurationBootStep`.

Docelowy model statusów rozruchu powinien obsługiwać co najmniej:

- Loading,
- OK,
- Warning,
- Error,
- Skipped,
- Locked.

Rozszerzanie statusów musi wykorzystywać istniejące elementy:

- BootSequence,
- BootStepInterface,
- BootStepResult,
- ModuleStatus,
- ModuleState,
- ModuleStatusProvider,
- Logger,
- ErrorCode,
- przyszłe API status / health.

Ekran Boot Sequence w AquaCore UI powinien prezentować wynik tego samego procesu, który może być uruchomiony diagnostycznie przez CLI.

## Tryby uruchamiania

AquaCore OS musi rozdzielać koncepcyjnie trzy tryby startu:

1. Server Mode - start rdzenia na serwerze SBS lub SBS Hub.
2. Client Mode - start użytkownika po logowaniu w AquaCore UI.
3. Embedded / Home Mode - start panelu AquaCore Home lub urządzenia dostępowego.

Server Mode odpowiada za uruchomienie usług systemowych, konfiguracji, diagnostyki i przyszłych warstw runtime.

Client Mode nie powinien prowadzić użytkownika bezpośrednio z logowania do dashboardu. Docelowy przepływ:

```text
Logowanie
↓
Weryfikacja sesji i uprawnień
↓
Ekran rozruchu klienta AquaCore OS
↓
Kontrola usług krytycznych i opcjonalnych
↓
AquaCore UI
albo
tryb ograniczony
albo
ekran błędu
```

Embedded / Home Mode korzysta z tego samego modelu statusów, ale może prezentować uproszczony wynik rozruchu dopasowany do panelu ściennego lub urządzenia mobilnego.

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

Testy CLI znajdują się w pliku:

- Tests/AquaCore OS/CliSmokeTest.php

Uruchomienie:

```powershell
php "Tests\AquaCore OS\CliSmokeTest.php"
```

Albo przez AquaCore OS CLI:

```powershell
php "AquaCore OS\aquacore.php" tests:run
```

## Git

AquaCore OS Core jest wersjonowany w lokalnym repozytorium Git projektu Smart BioSystem.

Aktualny stan:

- główna gałąź robocza: `development`,
- pierwszy commit obejmujący bootowalny rdzeń AquaCore OS: `7ee68bf`,
- komunikat pierwszego commita: `feat(core): dodano bootowalny rdzeń AquaCore OS`.

Git jest historią projektu i narzędziem kontroli wersji.

Git nie jest elementem runtime AquaCore OS.

Sekrety, hasła, tokeny, klucze prywatne i prywatna konfiguracja muszą pozostawać poza repozytorium.

## Zasady bezpieczeństwa

Na tym etapie nie wykonano zmian w:

- tabelach,
- kolumnach,
- relacjach,
- publicznym API,
- mapie bazy danych.

## Następne kroki

Proponowane kolejne kroki:

1. Wykonać osobny commit dokumentacyjny: `docs(git): zaktualizowano dokumentację kontroli wersji`.
2. Przygotować właściwą konfigurację połączenia MariaDB bez sekretów w repozytorium.
3. Przygotować właściwą konfigurację połączenia MQTT bez sekretów w repozytorium.
4. Zaprojektować pierwszy prywatny endpoint health check.
5. Rozpocząć moduł Security od logowania lokalnego.

## Schemat ładowania konfiguracji

AquaCore OS ładuje konfigurację w bezpiecznej kolejności:

1. Bazowy plik wersjonowany w repozytorium:

   `AquaCore OS/Config/aquacore.php`

2. Lokalny override ignorowany przez Git, jeżeli istnieje:

   `AquaCore OS/Config/aquacore.local.php`

3. Dodatkowy lokalny override wskazany zmienną środowiskową, jeżeli istnieje:

   `AQUACORE_CONFIG_LOCAL`

Plik przykładowy bez sekretów:

- `AquaCore OS/Config/aquacore.local.example.php`

Zasady:

- `aquacore.php` zawiera wartości bazowe bez sekretów,
- `aquacore.local.example.php` zawiera neutralne przykłady,
- `aquacore.local.php` jest lokalny i niewersjonowany,
- konfiguracja lokalna nadpisuje tylko wskazane pola,
- loader nie wykonuje połączeń z MariaDB ani MQTT,
- CLI może pokazać, czy lokalny override został załadowany, ale nie może wypisywać haseł ani tokenów.
