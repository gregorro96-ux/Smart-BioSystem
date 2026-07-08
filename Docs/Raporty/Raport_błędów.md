				RAPORT BŁĘDÓW

=================================================
BŁĄD NR 001
Data pierwszego wystąpienia: 15-16.06.2026
Moduł: Node-RED
Źródło zgłoszenia: Grzegorz
Status: Rozwiązany
Liczba wystąpień: 1
Ostatnie wystąpienie: 15-16.06.2026
Priorytet: Wysoki
=================

Objawy:

* ciągłe restarty kontenera
* brak dostępu do panelu WWW
* brak generowania plików konfiguracyjnych

Przyczyna:

Brak praw zapisu do katalogu danych Node-RED.

Rozwiązanie:

Naprawa uprawnień przez SSH.

Wnioski:

Przy podobnych objawach najpierw sprawdzić logi oraz prawa dostępu do katalogów.

---

=================================================
BŁĄD NR 002
Data pierwszego wystąpienia: 18-19.06.2026
Moduł: MariaDB
Źródło zgłoszenia: Grzegorz
Status: Rozwiązany
Liczba wystąpień: 1
Ostatnie wystąpienie: 18-19.06.2026
Priorytet: Wysoki
=================

Objawy:

* błędy podczas tworzenia kluczy obcych

Przyczyna:

Niezgodność typów INT(11) ↔ BIGINT(20)

Rozwiązanie:

Ujednolicenie wszystkich kluczy głównych do BIGINT(20).

Wnioski:

Przed tworzeniem FOREIGN KEY zawsze sprawdzać zgodność typów danych.

---

=================================================
BŁĄD NR 003
Data pierwszego wystąpienia: 18-19.06.2026
Moduł: MariaDB / phpMyAdmin
Źródło zgłoszenia: Grzegorz
Status: Rozwiązany
Liczba wystąpień: 1
Ostatnie wystąpienie: 18-19.06.2026
Priorytet: Wysoki
=================

Objawy:

* problemy podczas tworzenia FOREIGN KEY

Przyczyna:

Brak PRIMARY KEY lub błędna konfiguracja tabel.

Rozwiązanie:

Dodanie PRIMARY KEY i ponowna konfiguracja relacji.

Wnioski:

Najpierw klucze główne, później klucze obce.

---

=================================================
BŁĄD NR 004
Data pierwszego wystąpienia: 18-19.06.2026
Moduł: phpMyAdmin
Źródło zgłoszenia: Grzegorz
Status: Wyjaśniony
Liczba wystąpień: 1
Ostatnie wystąpienie: 18-19.06.2026
Priorytet: Niski
================

Objawy:

* pozorne znikanie kolumn po zapisaniu zmian
* wrażenie, że zmiany nie zostały zapisane

Przyczyna:

Nieprawidłowa interpretacja widoku phpMyAdmin.

Rozwiązanie:

Weryfikacja struktury tabel oraz odświeżenie widoku.

Wnioski:

Sprawdzać rzeczywistą strukturę tabel przed wprowadzaniem zmian.

---

=================================================
BŁĄD NR 005
Data pierwszego wystąpienia: 18-19.06.2026
Moduł: MariaDB
Źródło zgłoszenia: Grzegorz
Status: Rozwiązany
Liczba wystąpień: 1
Ostatnie wystąpienie: 18-19.06.2026
Priorytet: Średni
=================

Objawy:

* błędy podczas tworzenia relacji
* część tabel nie współpracowała ze sobą poprawnie

Przyczyna:

Brak zgodności pomiędzy starszymi i nowymi tabelami.

Rozwiązanie:

Synchronizacja typów danych i struktury tabel.

Wnioski:

Przy rozbudowie bazy okresowo weryfikować całą strukturę.

---

=================================================
BŁĄD NR 006
Data pierwszego wystąpienia: 18-19.06.2026
Moduł: MariaDB
Źródło zgłoszenia: Grzegorz
Status: Rozwiązany
Liczba wystąpień: 1
Ostatnie wystąpienie: 18-19.06.2026
Priorytet: Średni
=================

Objawy:

* część tabel nie posiadała kluczy głównych
* niemożliwe było tworzenie relacji

Przyczyna:

Niespójna struktura tabel tworzonych w różnych etapach projektu.

Rozwiązanie:

Ujednolicenie wszystkich tabel:

* BIGINT(20)
* AUTO_INCREMENT
* PRIMARY KEY

Wnioski:

Każda nowa tabela powinna od początku posiadać:

* id BIGINT(20)
* AUTO_INCREMENT
* PRIMARY KEY

---

# Uwagi

Raport błędów jest prowadzony w celu:

* dokumentowania problemów,
* przyspieszenia diagnostyki,
* budowy bazy doświadczeń SBS,
* analizy powtarzających się problemów,
* wykorzystania danych przez przyszłą NAIDĘ.

Źródłem zgłoszeń mogą być:

* Grzegorz
* AquaCore OS
* NAIDA
* SBS Cloud
* Globalna NAIDA

=================================================
BŁĄD NR 007
Data pierwszego wystąpienia: 22.06.2026
Moduł: MariaDB / phpMyAdmin
Źródło zgłoszenia: Grzegorz
Status: Rozwiązany
Liczba wystąpień: 1
Ostatnie wystąpienie: 22.06.2026
Priorytet: Wysoki
=================

Objawy:

* błędy podczas migracji BIGINT → BIGINT UNSIGNED
* problemy z importem wygenerowanych poleceń ALTER TABLE
* błędy #1064 podczas wykonywania skryptów
* błędy odtwarzania FOREIGN KEY
* bardzo długi czas wykonywania operacji w phpMyAdmin
* komunikaty #1005 i #1832

Przyczyna:

Klucze obce uniemożliwiały zmianę typów danych. Dodatkowo część wygenerowanych poleceń zawierała nieprawidłowy format eksportu, co powodowało błędy składni SQL.

Rozwiązanie:

1. Wykonanie kopii bezpieczeństwa.
2. Eksport wszystkich kluczy obcych.
3. Usunięcie kluczy obcych.
4. Konwersja wszystkich kolumn BIGINT(20) na BIGINT(20) UNSIGNED.
5. Ponowny import kluczy obcych.
6. Weryfikacja całej struktury bazy.
7. Wykonanie końcowego eksportu bazy.

Wynik:

Pomyślnie zmigrowano:

* 93 tabele.
* 201 kolumn BIGINT.
* wszystkie klucze główne i obce zostały zachowane.
* cała baza osiągnęła stan SBS Database v1 Stable.

Wnioski:

Przy dużych zmianach struktury bazy należy zawsze stosować kolejność:

1. Backup.
2. Eksport FOREIGN KEY.
3. Usunięcie FOREIGN KEY.
4. Migracja struktury.
5. Odtworzenie FOREIGN KEY.
6. Testy poprawności.
7. Końcowy backup.

Uwagi:

Migracja wszystkich tabel do BIGINT(20) UNSIGNED została zakończona sukcesem i stanowi punkt odniesienia dla kolejnych wersji bazy danych SBS.

=================================================
BŁĄD NR 008
Data pierwszego wystąpienia: 07.07.2026
Moduł: AquaCore OS / PHP
Źródło zgłoszenia: Codex
Status: Rozwiązany
Liczba wystąpień: 1
Ostatnie wystąpienie: 07.07.2026
Priorytet: Średni
=================

Objawy:

* PHP zgłaszał błąd:

`strict_types declaration must be the very first statement in the script`

* Część nowych plików PHP nie przechodziła sprawdzenia składni.

Przyczyna:

Pliki PHP zapisane przez PowerShell zostały utworzone jako UTF-8 z BOM.

Deklaracja `declare(strict_types=1);` musi znajdować się na początku pliku, a BOM powodował, że PHP widział dodatkowe bajty przed deklaracją.

Rozwiązanie:

Przekonwertowano pliki PHP AquaCore OS do UTF-8 bez BOM.

Wnioski:

Pliki PHP w AquaCore OS muszą być zapisywane jako UTF-8 bez BOM.

Po każdej większej zmianie PHP należy wykonać:

* sprawdzenie składni `php -l`,
* uruchomienie testów CLI.

---

=================================================
BŁĄD NR 009
Data pierwszego wystąpienia: 07.07.2026
Moduł: AquaCore OS / Logging / Windows SMB
Źródło zgłoszenia: Codex
Status: Rozwiązany
Liczba wystąpień: 1
Ostatnie wystąpienie: 07.07.2026
Priorytet: Średni
=================

Objawy:

* Komenda `logs:status` pokazywała brak możliwości zapisu do katalogu logów.
* Logger faktycznie potrafił zapisywać wpisy do pliku logu.

Przyczyna:

Funkcja `is_writable()` zwracała fałszywy wynik negatywny na ścieżce SMB/UNC.

Rozwiązanie:

Diagnostykę `logs:status` oparto o realną próbę zapisu do katalogu i pliku logu zamiast polegania wyłącznie na `is_writable()`.

Wnioski:

Na udziałach sieciowych SMB/UNC diagnostyka zapisu powinna używać realnej próby zapisu.

Same metadane uprawnień mogą być mylące w środowisku Windows + Synology SMB.

---

=================================================
BŁĄD NR 010
Data pierwszego wystąpienia: 07.07.2026
Moduł: Windows CLI / UNC / AquaCore OS
Źródło zgłoszenia: Codex
Status: Wyjaśniony
Liczba wystąpień: kilka podczas sesji
Ostatnie wystąpienie: 07.07.2026
Priorytet: Niski
=================

Objawy:

* Część poleceń Windows CLI miała problem z bezpośrednią pracą na ścieżkach `\\Serwer\...`.
* CMD informował, że ścieżki UNC nie są obsługiwane jako bieżący katalog roboczy.
* Niektóre polecenia wymagały użycia `pushd`.

Przyczyna:

Ograniczenia Windows CLI przy pracy z udziałami UNC jako bieżącym katalogiem.

Rozwiązanie:

Do uruchamiania komend z katalogu projektu stosowano `pushd`, które tymczasowo mapuje udział sieciowy na literę dysku.

Wnioski:

Przy pracy z projektem SBS na Synology SMB należy pamiętać, że część narzędzi Windows może wymagać `pushd` lub uruchomienia z mapowanego dysku.

Koniec wpisu.
---

=================================================
BŁĄD NR 011
Identyfikator: SBS-BUG-011
Komponent: AquaCore OS / MariaDB / Synology
Data wykrycia: 08.07.2026
Sesja: 009
Środowisko: Windows CLI + Synology NAS + MariaDB 10
Status: Resolved
Powiązany commit: d768b65, 2ad9cf7
=================

Opis objawu:

`database:test` zwracał `mariadb_connection: failed` mimo poprawnej konfiguracji loginu, hasła i nazwy bazy.

Warunki wystąpienia:

- MariaDB działała lokalnie dla phpMyAdmin,
- połączenie z Windows CLI było wykonywane przez TCP na `192.168.0.26:3306`,
- TCP/IP w MariaDB było wyłączone lub użytkownik miał dostęp tylko jako `localhost`.

Przyczyna:

MariaDB początkowo nie przyjmowała połączeń TCP/IP. Po włączeniu TCP/IP konieczne było dopuszczenie użytkownika MariaDB do połączeń spoza `localhost`.

Sposób diagnozy:

- wykonano `database:status`,
- wykonano `database:test`,
- sprawdzono dostępność portu `3306`,
- zweryfikowano host użytkownika w phpMyAdmin.

Sposób rozwiązania:

- włączono TCP/IP w MariaDB na Synology,
- potwierdzono port `3306`,
- skonfigurowano użytkownika `sbs_user@%` dla bazy `sbs`,
- ponownie wykonano `database:test`.

Wpływ na system:

Blokował pierwszy realny test połączenia AquaCore OS z MariaDB.

Zmiany w bazie danych:

Nie zmieniono struktury tabel. Zmieniono wyłącznie uprawnienia użytkownika MariaDB.

Czy problem mógł ujawniać sekrety:

Nie. CLI pokazywało tylko flagi `username_configured` i `password_configured`, bez hasła.

Czy wymaga dalszej obserwacji:

Tak. Docelowo warto zawęzić host użytkownika z `%` do konkretnego adresu maszyny development, jeśli środowisko będzie tego wymagało.

---

=================================================
BŁĄD NR 012
Identyfikator: SBS-BUG-012
Komponent: AquaCore OS / Database Diagnostics
Data wykrycia: 08.07.2026
Sesja: 009
Środowisko: AquaCore OS CLI
Status: Resolved
Powiązany commit: 2ad9cf7
=================

Opis objawu:

`database:test` zwracał zbyt ogólny komunikat `MariaDB connection failed`, bez bezpiecznego rozróżnienia przyczyny awarii.

Warunki wystąpienia:

- brak dostępnego portu MariaDB,
- błędne uprawnienia użytkownika,
- potencjalnie brak sterownika `pdo_mysql`,
- błędna baza lub host.

Przyczyna:

Pierwsza wersja testu MariaDB celowo maskowała wyjątek PDO, ale nie zwracała wystarczającego bezpiecznego kodu diagnostycznego.

Sposób diagnozy:

Analiza `MariaDbDatabaseConnection` i wyniku `database:test` po awarii połączenia.

Sposób rozwiązania:

Dodano bezpieczne pole `diagnostic_code` i kody m.in. `pdo_mysql_missing`, `connection_unavailable`, `access_denied`, `unknown_database`, `host_not_found`, `server_unavailable`, `pdo_exception`, `none`.

Wpływ na system:

Ułatwia diagnostykę bez ujawniania sekretów.

Zmiany w bazie danych:

Brak.

Czy problem mógł ujawniać sekrety:

Nie po poprawce. Pełna treść wyjątku PDO nie jest wypisywana.

Czy wymaga dalszej obserwacji:

Tak. Kody diagnostyczne należy rozwijać wraz z realnymi przypadkami awarii.

---

=================================================
BŁĄD NR 013
Identyfikator: SBS-BUG-013
Komponent: AquaCore OS / CLI Smoke Test / Local Config
Data wykrycia: 08.07.2026
Sesja: 009
Środowisko: AquaCore OS CLI + prywatny `aquacore.local.php`
Status: Resolved
Powiązany commit: 2ad9cf7
=================

Opis objawu:

Smoke test CLI zaczął zależeć od prywatnej konfiguracji lokalnej i po utworzeniu `aquacore.local.php` oczekiwał innych wyników niż konfiguracja bazowa.

Warunki wystąpienia:

- istniał prywatny `AquaCore OS/Config/aquacore.local.php`,
- testy oczekiwały `local_override_loaded: false`, `database.configured: false` i pominiętego testu MariaDB.

Przyczyna:

Automatyczny test CLI ładował prywatny override konfiguracji, przez co przestał być hermetyczny.

Sposób diagnozy:

Smoke test zwrócił błędy dla `config:show`, `database:status`, `database:test` i `system:modules`.

Sposób rozwiązania:

Dodano przełącznik `AQUACORE_DISABLE_LOCAL_CONFIG=1` i ustawiono go w smoke teście CLI.

Wpływ na system:

Testy automatyczne są powtarzalne i nie zależą od lokalnych sekretów.

Zmiany w bazie danych:

Brak.

Czy problem mógł ujawniać sekrety:

Nie ujawnił sekretów, ale mógł powodować nieprzewidywalne wyniki testów zależne od prywatnej konfiguracji.

Czy wymaga dalszej obserwacji:

Tak. Kolejne testy powinny jasno rozróżniać konfigurację bazową i testy integracyjne.

---

=================================================
BŁĄD NR 014
Identyfikator: SBS-BUG-014
Komponent: AquaCore OS / MQTT / Bootstrap
Data wykrycia: 08.07.2026
Sesja: 009
Środowisko: AquaCore OS CLI
Status: Resolved
Powiązany commit: brak - zmiana niezatwierdzona w chwili wpisu
=================

Opis objawu:

Po rozszerzeniu `MqttTestCommand` smoke test CLI zwrócił fatal error: konstruktor komendy oczekiwał dwóch argumentów, a `Bootstrap` przekazywał tylko logger.

Warunki wystąpienia:

- `MqttTestCommand` został rozszerzony o konfigurację,
- rejestracja komendy w `Bootstrap` nie została jeszcze dopasowana.

Przyczyna:

Niespójność sygnatury konstruktora i miejsca rejestracji komendy.

Sposób diagnozy:

Smoke test CLI zwrócił `ArgumentCountError` dla `MqttTestCommand`.

Sposób rozwiązania:

Zmieniono rejestrację komendy na przekazywanie `$configuration` do `MqttTestCommand`.

Wpływ na system:

Przed poprawką blokowało uruchomienie wszystkich komend CLI, ponieważ błąd występował podczas bootstrapa.

Zmiany w bazie danych:

Brak.

Czy problem mógł ujawniać sekrety:

Nie.

Czy wymaga dalszej obserwacji:

Nie, smoke test po poprawce przeszedł poprawnie.

---

=================================================
BŁĄD NR 015
Identyfikator: SBS-BUG-015
Komponent: AquaCore OS / MQTT Diagnostics
Data wykrycia: 08.07.2026
Sesja: 009
Środowisko: AquaCore OS CLI + Mosquitto MQTT
Status: Resolved
Powiązany commit: brak - zmiana niezatwierdzona w chwili wpisu
=================

Opis objawu:

Przed rozszerzeniem komenda `mqtt:test` była tylko placeholderem i nie wykonywała realnego testu brokera MQTT.

Warunki wystąpienia:

- broker MQTT działał na porcie `1883`,
- `mqtt:test` zwracał informację planistyczną zamiast sprawdzenia połączenia.

Przyczyna:

Moduł MQTT posiadał tylko szkielet diagnostyczny.

Sposób diagnozy:

Przeanalizowano istniejące komendy `mqtt:status`, `mqtt:test`, konfigurację MQTT oraz brak biblioteki klienta MQTT w repozytorium.

Sposób rozwiązania:

Dodano minimalny tester protokołu MQTT oparty o `stream_socket_client`, który wykonuje wyłącznie `CONNECT`, odczyt `CONNACK` i `DISCONNECT`.

Wpływ na system:

AquaCore OS potrafi wykonać pierwszy rzeczywisty test połączenia z brokerem MQTT, ale nadal nie posiada runtime MQTT.

Zmiany w bazie danych:

Brak.

Czy problem mógł ujawniać sekrety:

Nie. Test nie wypisuje loginu, hasła, pełnego URI ani sekretów.

Czy wymaga dalszej obserwacji:

Tak. Docelowy klient MQTT i obsługa runtime będą wymagały osobnej decyzji oraz testów.

---

=================================================
BŁĄD NR 016
Identyfikator: SBS-BUG-016
Komponent: AquaCore OS / Temporary Config / PHP Encoding
Data wykrycia: 08.07.2026
Sesja: 009
Środowisko: PowerShell + PHP CLI
Status: Resolved
Powiązany commit: brak - dotyczy pliku tymczasowego
=================

Opis objawu:

Tymczasowy override MQTT zapisany przez PowerShell spowodował błąd PHP: `strict_types declaration must be the very first statement in the script`.

Warunki wystąpienia:

- plik tymczasowy był zapisany przez `Set-Content -Encoding UTF8`,
- PHP odczytał BOM przed `<?php`.

Przyczyna:

PowerShell zapisał plik tymczasowy jako UTF-8 z BOM.

Sposób diagnozy:

Błąd pojawił się przy uruchomieniu `mqtt:status` z tymczasowym `AQUACORE_CONFIG_LOCAL`.

Sposób rozwiązania:

Powtórzono zapis pliku tymczasowego jako UTF-8 bez BOM przez `System.Text.UTF8Encoding($false)`.

Wpływ na system:

Dotyczyło tylko pliku tymczasowego testu MQTT. Kod projektu nie został uszkodzony.

Zmiany w bazie danych:

Brak.

Czy problem mógł ujawniać sekrety:

Nie.

Czy wymaga dalszej obserwacji:

Tak. Wszystkie pliki PHP tworzone przez narzędzia powinny być zapisywane jako UTF-8 bez BOM.
