# Standard konfiguracji lokalnej

Status: Obowiązujący standard dokumentacyjny przed podłączeniem MariaDB i MQTT.

Cel:

Ustalić, gdzie trzymane są prywatne pliki konfiguracyjne, jak wyglądają przykładowe konfiguracje bez sekretów oraz co wolno commitować do repozytorium Smart BioSystem.

## Zasada główna

Repozytorium Git zawiera kod, dokumentację, przykłady konfiguracji i strukturę projektu.

Repozytorium Git nie zawiera sekretów.

Sekretami są między innymi:

- hasła,
- tokeny,
- klucze prywatne,
- loginy produkcyjne,
- prywatne DSN,
- prywatne adresy usług, jeżeli ujawniają infrastrukturę,
- pliki `.env` z prawdziwymi wartościami,
- lokalne konfiguracje z danymi dostępowymi.

## Gdzie trzymać prywatne pliki poza repo

Prywatne pliki lokalne należy trzymać poza wersjonowaną częścią projektu albo w lokalizacji ignorowanej przez `.gitignore`.

Dopuszczalne lokalizacje lokalne:

- `Docs/Hasła i dostępy/` - lokalne notatki dostępowe, niewersjonowane,
- lokalny katalog użytkownika poza repozytorium,
- prywatny zasób administracyjny NAS poza repozytorium,
- przyszły katalog runtime konfiguracji, jeżeli zostanie jawnie dodany do `.gitignore`.

Foldery i pliki zawierające dane dostępowe muszą być ignorowane przez Git.

Przed użyciem nowej lokalizacji prywatnej należy sprawdzić:

```powershell
git check-ignore -v <ścieżka>
```

Jeżeli plik nie jest ignorowany, należy najpierw zaktualizować `.gitignore`.

## Przykładowe konfiguracje bez sekretów

Do repozytorium wolno dodawać wyłącznie przykładowe pliki konfiguracji bez prawdziwych danych.

Przykładowe nazwy:

- `.env.example`,
- `config.example.php`,
- `database.example.php`,
- `mqtt.example.php`,
- `local.example.json`.

Przykładowe wartości muszą być neutralne:

```text
DB_HOST=example.local
DB_PORT=3306
DB_NAME=sbs_example
DB_USER=example_user
DB_PASSWORD=CHANGE_ME
MQTT_HOST=example.local
MQTT_PORT=1883
MQTT_USER=example_user
MQTT_PASSWORD=CHANGE_ME
```

Wartości przykładowe nie mogą działać jako prawdziwe dane dostępowe.

Hasła przykładowe powinny być jawnie oznaczone jako:

- `CHANGE_ME`,
- `example_password`,
- `not-a-real-secret`,
- `local-only-placeholder`.

## Czego nie wolno commitować

Nie wolno commitować:

- prawdziwych haseł,
- tokenów API,
- kluczy prywatnych,
- certyfikatów prywatnych,
- prywatnych plików `.env`,
- plików z loginami,
- prywatnych konfiguracji MariaDB,
- prywatnych konfiguracji MQTT,
- plików z danymi dostępowymi do NAS, GitHuba, brokerów, baz danych lub usług zewnętrznych,
- backupów zawierających dane użytkowników,
- eksportów zawierających dane prywatne.

Nie wolno także kopiować wartości sekretów do dokumentacji, commit message, issue, pull requestów ani komentarzy.

## Co wolno commitować

Wolno commitować:

- pliki `.example`,
- dokumentację opisującą strukturę konfiguracji,
- nazwy wymaganych pól konfiguracyjnych,
- neutralne placeholdery,
- walidatory konfiguracji,
- kod ładujący konfigurację bez wartości prywatnych,
- testy używające danych przykładowych,
- `.gitignore` chroniący prywatne pliki.

## Standard przed dodaniem konfiguracji do Git

Przed commitem konfiguracji wykonaj:

```powershell
git status
git diff
git diff --name-only
```

Następnie dodawaj pliki selektywnie:

```powershell
git add <plik>
```

Po stagingu sprawdź:

```powershell
git diff --cached
git diff --cached --name-only
```

Jeżeli pojawi się plik prywatny, usuń go ze stagingu:

```powershell
git restore --staged <plik>
```

Jeżeli plik ma pozostać lokalny, dopisz go do `.gitignore`.

## Zasada dla MariaDB i MQTT

Przed realnym podłączeniem MariaDB i MQTT należy przygotować:

- przykładowe konfiguracje bez sekretów,
- prywatne lokalne konfiguracje poza repozytorium,
- jasny opis pól wymaganych przez AquaCore OS,
- walidację obecności konfiguracji bez wypisywania haseł,
- diagnostykę, która nie ujawnia sekretów w terminalu ani logach.

Komendy diagnostyczne mogą pokazywać, czy konfiguracja istnieje, ale nie mogą pokazywać prawdziwych haseł ani tokenów.

## Zasada dla dokumentacji

Dokumentacja może opisywać:

- gdzie trzymać prywatne pliki,
- jakie pola są wymagane,
- jak nazwać pliki przykładowe,
- jak sprawdzić, czy plik jest ignorowany,
- jak uruchomić walidację konfiguracji.

Dokumentacja nie może zawierać:

- prawdziwego loginu,
- prawdziwego hasła,
- prawdziwego tokenu,
- prywatnego adresu usługi, jeśli nie powinien być publiczny,
- kopii pliku z hasłami.

## Minimalny standard nazw

Przykładowe pliki wersjonowane:

- `*.example.*`,
- `.env.example`,
- `README.md`,
- dokumenty w `Docs/Standardy/`.

Pliki lokalne niewersjonowane:

- `.env`,
- `.env.local`,
- `*.local.php`,
- `*.local.json`,
- pliki w `Docs/Hasła i dostępy/`,
- inne pliki prywatne wskazane w `.gitignore`.

## Wniosek

AquaCore OS może rozwijać konfigurację lokalną tylko w modelu rozdzielenia:

- repozytorium przechowuje strukturę i przykłady,
- prywatne środowisko przechowuje prawdziwe dane dostępowe.

Ten standard obowiązuje przed podłączeniem MariaDB, MQTT, API prywatnego i przyszłych usług zewnętrznych.

## Przyjęty schemat dla AquaCore OS

AquaCore OS przyjmuje następującą kolejność ładowania konfiguracji:

1. `AquaCore OS/Config/aquacore.php` - bazowa konfiguracja wersjonowana w repozytorium.
2. `AquaCore OS/Config/aquacore.local.php` - lokalny override ignorowany przez Git.
3. Plik wskazany przez `AQUACORE_CONFIG_LOCAL` - opcjonalny override poza repozytorium.

Przykład bez sekretów znajduje się w:

- `AquaCore OS/Config/aquacore.local.example.php`

Lokalny plik `aquacore.local.php` może zawierać prywatne hosty, nazwy użytkowników i przyszłe dane dostępowe, dlatego musi pozostać poza repozytorium.

Loader scala konfigurację rekurencyjnie. Oznacza to, że lokalny plik może nadpisać tylko wybrane pola, bez kopiowania całej konfiguracji bazowej.

Na tym etapie loader nie wykonuje połączenia z MariaDB ani MQTT.

## MariaDB - lokalna konfiguracja testu połączenia

Pierwszy test połączenia MariaDB korzysta z lokalnego override konfiguracji.

Wymaganie środowiskowe:

- PHP CLI musi mieć aktywne rozszerzenie `pdo_mysql`.

Sprawdzenie:

```powershell
php -m | Select-String pdo_mysql
```

Plik lokalny:

- `AquaCore OS/Config/aquacore.local.php`

Minimalne pola Database:

```php
'database' => [
    'configured' => true,
    'host' => 'localhost',
    'port' => 3306,
    'database' => 'sbs',
    'username' => 'local_user',
    'password' => 'CHANGE_ME',
],
```

Zasady:

- prawdziwa wartość `password` nie trafia do repozytorium,
- publiczny status pokazuje tylko `password_configured`,
- realny test wymaga rozszerzenia PHP `pdo_mysql`,
- test połączenia wykonuje wyłącznie `SELECT 1`,
- test nie wykonuje migracji,
- test nie zmienia tabel,
- test nie zapisuje danych.
