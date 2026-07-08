# SBS (Smart Bio System)

# Architektura Systemu - Full Version v2

Status

Projekt w fazie aktywnej realizacji.

==================================================

# Misja Projektu

SBS (Smart Bio System) jest systemem operacyjnym przeznaczonym do zarządzania, monitorowania, ochrony oraz analizy zamkniętych ekosystemów biologicznych.

Priorytet:

Życie jest ważniejsze od technologii.

Urządzenia są narzędziami.

Najważniejsze są:

- zwierzęta
- rośliny
- mikroorganizmy
- stabilność środowiska

==================================================

# Główne Moduły SBS

Smart Bio System

├── AquaCore OS
├── AquaCore UI
├── NAIDA
├── Climate Engine
├── Weather Engine
├── Light Engine
├── Moon Engine
├── Season Engine
├── Breeding Engine
├── Solar Ecosystem
├── SBS LAB
├── SBS Store
├── SBS Cloud
├── MQTT
├── Node-RED
├── API
└── Baza danych SBS

==================================================

# AquaCore OS

Rola:

Centralny system operacyjny SBS.

Zarządza:

- użytkownikami
- ekosystemami
- urządzeniami
- automatyką
- bazą danych
- bezpieczeństwem
- komunikacją
- silnikami środowiskowymi

Jest sercem całego SBS.

==================================================

# AquaCore UI

Rola:

Interfejs użytkownika.

Dostęp:

- przeglądarka WWW
- telefon
- tablet
- panele ścienne AquaCore Home

==================================================

# NAIDA

Natural Artificial Intelligence Digital Assistant

Cyfrowa Strażniczka Ekosystemów.

Zadania:

- analiza danych
- analiza zdjęć
- analiza filmów
- analiza trendów
- pamięć wieloletnia
- sugestie
- edukacja użytkownika

NAIDA nie zastępuje użytkownika.

NAIDA doradza.

==================================================

# Climate Engine

Odpowiada za:

- temperaturę
- sezonowość
- długość dnia
- długość nocy
- porę suchą
- porę deszczową

==================================================

# Weather Engine

Odpowiada za:

- zachmurzenie
- deszcz
- burze
- mgłę
- wiatr

Początkowo:

harmonogram + losowość

Docelowo:

decyzje podejmowane przez NAIDĘ.

==================================================

# Light Engine

Odpowiada za:

- wschody słońca
- zachody słońca
- chmury
- księżyc
- sezonowość

Inspiracja:

Amazonia.

==================================================

# Moon Engine

Symuluje:

- nów
- pierwszą kwadrę
- pełnię
- ostatnią kwadrę

Cykl:

30 dni

==================================================

# Season Engine

Odpowiada za:

- długość dnia
- długość nocy
- sezonowość biotopu

==================================================

# Breeding Engine

Przyszły moduł odpowiedzialny za:

- analizę warunków rozrodu
- wpływ temperatury
- wpływ księżyca
- wpływ chemii wody

==================================================

# Solar Ecosystem

Inteligentny sterownik środowiska.

Funkcje:

- PWM wysokiej rozdzielczości
- oświetlenie
- czujniki
- lokalny koncentrator danych

==================================================

# SBS LAB

Laboratorium parametrów wody.

Przyszłe funkcje:

- analiza próbki
- mieszanie reagentów
- analiza koloru
- automatyczne raporty

==================================================

# SBS Store

System modułów i aplikacji.

Użytkownik wybiera:

- aplikacje
- funkcje
- silniki środowiskowe

==================================================

# SBS Cloud

Rozszerzenie chmurowe.

Funkcje:

- synchronizacja
- backupy
- Globalna NAIDA
- wymiana doświadczeń

==================================================

# Node-RED

Warstwa logiki.

==================================================

# MQTT

Warstwa komunikacyjna.

==================================================

# API

Warstwa komunikacji pomiędzy:

- AquaCore OS
- AquaCore UI
- Android
- panelami ściennymi
- urządzeniami

==================================================

# Baza danych SBS

Cyfrowa pamięć ekosystemów.

Docelowo:

100-300 tabel.

==================================================

# Filozofia bezpieczeństwa

Najwyższy priorytet:

Dobrostan organizmów.

System musi działać nawet przy:

- awarii Internetu
- awarii chmury
- problemach sieciowych

==================================================

# Filozofia projektowa

1. Życie jest ważniejsze od technologii.

2. Automatyzacja wspiera człowieka.

3. NAIDA doradza, użytkownik decyduje.

4. Urządzenia wykonują polecenia.

5. Prostota dla użytkownika, złożoność wewnątrz.

==================================================

# Cel długoterminowy

Stworzenie pierwszego Biological Ecosystem Operating System.

Systemu operacyjnego dla żywych ekosystemów.

# AquaCore Home

Rola:

Lokalny panel sterowania ekosystemami SBS.

Przeznaczenie:

Zapewnienie wygodnego dostępu do AquaCore OS bez konieczności korzystania z komputera.

Możliwe platformy:

* Android
* tablety
* panele ścienne
* urządzenia dedykowane

Funkcje:

* podgląd parametrów
* sterowanie urządzeniami
* alarmy
* multimedia
* historia życia
* konfiguracja ekosystemów

Uwagi:

W jednym domu może działać wiele paneli AquaCore Home.

Przykłady:

* panel przy akwarium morskim
* panel przy terrarium
* panel przy paludarium

Każdy panel posiada dostęp do wszystkich ekosystemów zgodnie z uprawnieniami użytkownika.

==================================================

# Praca lokalna

Filozofia działania:

System powinien działać również bez dostępu do Internetu.

Założenia:

* pełna praca lokalna
* lokalna baza danych
* automatyzacje działające bez chmury
* lokalne harmonogramy
* komunikacja z urządzeniami przez sieć domową

Po odzyskaniu połączenia:

* synchronizacja z SBS Cloud
* synchronizacja historii
* synchronizacja danych Globalnej NAIDY

==================================================

# SBS Hub

Rola:

Lokalna bramka oraz koncentrator systemu dla użytkowników nieposiadających własnego serwera.

Przeznaczenie:

Zapewnienie pełnej funkcjonalności AquaCore OS przy wykorzystaniu telefonów, tabletów oraz paneli AquaCore Home.

Funkcje:

* MQTT
* API
* automatyzacje
* harmonogramy
* lokalna baza danych
* komunikacja z urządzeniami
* synchronizacja z SBS Cloud

Uwagi:

SBS Hub może pełnić rolę lokalnego serwera AquaCore OS.

==================================================

# Architektura rozproszona

Założenie:

Jeden użytkownik może posiadać wiele urządzeń dostępowych.

Przykłady:

* telefon
* tablet
* panel ścienny
* komputer

Każde urządzenie korzysta z tych samych danych AquaCore OS.

==================================================

# Filozofia AquaCore Home

Priorytet:

Użytkownik nie musi posiadać własnego serwera ani specjalistycznej wiedzy.

System powinien umożliwiać pełną obsługę ekosystemów przy użyciu:

* telefonu,
* tabletu,
* panelu ściennego,
* lokalnego SBS Hub.

Internet oraz SBS Cloud stanowią rozszerzenie możliwości systemu, a nie warunek jego działania.

==================================================

==================================================

# Rozruch AquaCore OS i tryby pracy

Boot Sequence AquaCore OS jest częścią runtime systemu, a nie wyłącznie efektem wizualnym.

Źródłem prawdy dla rozruchu i diagnostyki są:

* BootSequence,
* BootStepInterface,
* BootStepResult,
* ModuleStatus,
* ModuleState,
* ModuleStatusProvider,
* Logger,
* ErrorCode,
* przyszłe API status / health.

AquaCore UI, AquaCore Home i przyszły AquaCore Monitor korzystają z tych samych danych diagnostycznych.

Nie tworzy się drugiego niezależnego mechanizmu statusów modułów.

Tryby startu:

* Server Mode - start rdzenia AquaCore OS na serwerze SBS lub SBS Hub,
* Client Mode - start użytkownika po logowaniu i weryfikacji uprawnień,
* Embedded / Home Mode - start panelu AquaCore Home albo urządzenia dostępowego.

Po logowaniu użytkownik przechodzi przez ekran rozruchu klienta AquaCore OS. Dopiero po kontroli usług krytycznych i opcjonalnych system kieruje go do AquaCore UI, trybu ograniczonego albo ekranu błędu.

# Kontrola wersji


Rola:

Git pełni funkcję warstwy kontroli wersji projektu Smart BioSystem.

Przeznaczenie:

* zapis historii zmian,
* audyt zmian w kodzie i dokumentacji,
* kontrola zakresu kolejnych commitów,
* możliwość powrotu do wcześniejszych stanów projektu,
* dokumentowanie rozwoju AquaCore OS i pozostałych modułów SBS.

Założenia:

* repozytorium działa lokalnie w głównym katalogu projektu na dysku `S:`,
* główną gałęzią roboczą jest `development`,
* historia projektu jest obecnie utrzymywana lokalnie na Synology,
* zmiany powinny być zapisywane małymi, tematycznymi commitami.

Ograniczenie architektoniczne:

Git nie jest elementem runtime Smart BioSystem.

Nie odpowiada za:

* działanie AquaCore OS,
* komunikację MQTT,
* pracę bazy danych,
* automatyzacje,
* bezpieczeństwo użytkowników w działającym systemie,
* logikę urządzeń.

Sekrety, hasła, tokeny, klucze prywatne i prywatna konfiguracja muszą pozostawać poza repozytorium.

