# SBS - Decyzje Projektowe

## 2026-06-15

### Infrastruktura SBS

Decyzja:

System SBS rozwijany jest na prywatnym serwerze Synology NAS.

Powód:

* pełna kontrola nad danymi
* brak miesięcznych kosztów na etapie rozwoju
* możliwość lokalnych testów

---

### Komunikacja urządzeń

Decyzja:

MQTT zostaje głównym protokołem komunikacyjnym SBS.

Powód:

* niskie opóźnienia
* małe obciążenie sieci
* dobra współpraca z ESP32
* łatwa integracja z Node-RED

---

### Logika automatyzacji

Decyzja:

Node-RED odpowiada za automatyzacje i przepływy logiczne.

Powód:

* szybkie prototypowanie
* łatwa rozbudowa
* wizualna konfiguracja

---

## 2026-06-16

### Nazewnictwo projektu

Decyzja:

Smart Bio System (SBS) jest nazwą całego projektu.

Powód:

Oddzielenie projektu od poszczególnych produktów.

---

### System operacyjny

Decyzja:

Główny system nosi nazwę AquaCore.

Powód:

AquaCore pełni rolę podobną do Windows lub Linux dla całego ekosystemu SBS.

---

### Interfejs użytkownika

Decyzja:

Interfejs użytkownika nosi nazwę AquaCore UI.

Powód:

Rozdzielenie logiki systemu od warstwy wizualnej.

---

### Moduł AI

Decyzja:

Nazwa modułu sztucznej inteligencji to NAIDA.

Powód:

NAIDA stanowi osobny komponent analityczny i doradczy.

Uwagi:

W nazwie stosowany jest zapis wielkimi literami:

NAIDA

---

### Inteligentna lampa

Decyzja:

Nazwa urządzenia:

Solar Ecosystem

Powód:

Urządzenie nie jest wyłącznie lampą.

W przyszłości będzie częścią większego ekosystemu monitoringu i automatyki.

---

### Architektura urządzeń

Decyzja:

Urządzenia SBS nie podejmują samodzielnych decyzji strategicznych.

Powód:

Logika systemu znajduje się w AquaCore i NAIDZIE.

Urządzenia są wykonawcami poleceń.

---

### Bezpieczeństwo zwierząt

Decyzja:

System musi działać również przy braku Internetu.

Powód:

Ochrona zdrowia i życia zwierząt.

Krytyczne funkcje nie mogą zależeć od usług chmurowych.

---

### Filozofia działania NAIDY

Decyzja:

NAIDA nie stawia jednoznacznych diagnoz.

Powód:

Biologia i akwarystyka rzadko posiadają jedną pewną przyczynę problemu.

NAIDA przedstawia:

* możliwe przyczyny
* poziom prawdopodobieństwa
* argumentację

---

### Projekt bazy danych

Decyzja:

System od początku projektowany jest dla wielu użytkowników.

Powód:

Uniknięcie przebudowy bazy danych w przyszłości.

---

### Ekosystemy

Decyzja:

Jeden użytkownik może posiadać wiele ekosystemów.

Powód:

Obsługa wielu akwariów, terrariów i paludariów.

---

### Strefy ekosystemu

Decyzja:

Wprowadzono tabelę ecosystem_zones.

Powód:

Obsługa:

* części wodnych
* części lądowych
* sumpów
* kominów
* hydroponiki
* stref technicznych

---

### Wymiary ekosystemów

Decyzja:

Obsługiwane są zarówno litry, jak i wymiary.

Powód:

Akwaria najczęściej opisuje się litrażem.

Terraria i paludaria często opisuje się wymiarami.

---

### Filtracja

Decyzja:

Informacje o filtracji będą przechowywane oddzielnie.

Powód:

Filtracja posiada własne parametry i może być rozbudowywana niezależnie.

---

### Identyfikacja urządzeń

Decyzja:

Każde urządzenie posiada własny device_uid.

Powód:

Jednoznaczna identyfikacja urządzeń w całym ekosystemie SBS.

---

### Numer seryjny

Decyzja:

Nie stosować klasycznych numerów seryjnych.

Powód:

Projekt nie jest planowany jako masowa produkcja seryjna.

Zastępuje je device_uid.

---

### Dodawanie urządzeń

Decyzja:

Urządzenia wykrywane są automatycznie.

Powód:

Maksymalne uproszczenie obsługi dla użytkownika.

Użytkownik wybiera jedynie:

* pomieszczenie
* ekosystem

---

### Identyfikacja urządzenia

Decyzja:

Podczas identyfikacji migają tylko diody statusowe.

Powód:

Ograniczenie stresu zwierząt.

Nie migota główne oświetlenie.

---

### Aktualizacje firmware

Decyzja:

Aktualizacje wykonywane są po zatwierdzeniu przez użytkownika.

Powód:

Pełna kontrola nad procesem aktualizacji.

---

### Rollback firmware

Decyzja:

Rollback wykonywany jest ręcznie.

Powód:

Świadoma decyzja użytkownika.

Brak automatycznego cofania wersji.

---

### SBS LAB

Decyzja:

Użytkownik sam pobiera próbkę wody.

Powód:

Mniejsza złożoność konstrukcji.

Większa niezawodność urządzenia.

---

### Analiza kolorów testów

Decyzja:

Nie ograniczać się do kilku kolorów producenta.

Powód:

Zwiększenie dokładności pomiarów.

Planowane wykorzystanie cyfrowych palet przejść kolorystycznych.

---

### Materiały dla NAIDY

Decyzja:

System będzie przechowywał zdjęcia i filmy.

Powód:

Dokumentacja ekosystemów.

Trenowanie przyszłych modeli NAIDY.

Analiza chorób i zachowań organizmów.

---

Koniec dokumentu.

### Pamięć rozmów NAIDY

Decyzja:

NAIDA przechowuje historię rozmów wyłącznie w ramach konta użytkownika.

Powód:

Zachowanie kontekstu wcześniejszych rozmów przy jednoczesnym poszanowaniu prywatności użytkownika.

Uwagi:

Pełna historia rozmów nie musi być przechowywana bezterminowo.

Dopuszcza się tworzenie skróconych podsumowań rozmów zawierających najważniejsze informacje i ustalenia.

---

### Filozofia działania NAIDY

Decyzja:

NAIDA nie zgaduje i nie tworzy rekomendacji bez danych.

Powód:

Wnioski muszą opierać się na rzeczywistych pomiarach, obserwacjach, dokumentacji oraz wiedzy znajdującej się w bibliotece SBS.

Uwagi:

NAIDA może przedstawiać poziom prawdopodobieństwa różnych przyczyn problemu, jeżeli dostępne dane nie pozwalają na jednoznaczny wniosek.

---

### Biblioteka Wiedzy SBS

Decyzja:

NAIDA może korzystać z lokalnej biblioteki wiedzy SBS.

Powód:

Zapewnienie użytkownikowi możliwości weryfikacji źródeł oraz ograniczenie ryzyka generowania niepotwierdzonych informacji.

Przykład:

NAIDA może wskazać dokument, rozdział lub stronę zawierającą szczegółowe informacje dotyczące danego zagadnienia.

---

### Priorytety projektu SBS

Decyzja:

Dobrostan organizmów żywych ma najwyższy priorytet w projektowaniu systemu.

Powód:

Głównym celem projektu jest wspieranie zdrowego funkcjonowania zamkniętych ekosystemów oraz edukacja użytkowników.

Uwagi:

W sytuacjach awaryjnych pierwszeństwo mają funkcje podtrzymujące życie zwierząt.

---

### SBS Emergency Core

Decyzja:

System może posiadać niezależny moduł awaryjny SBS Emergency Core.

Powód:

Zapewnienie ciągłości działania ekosystemu podczas awarii AquaCore.

Zadania:

* utrzymanie podstawowych harmonogramów,
* lokalna komunikacja urządzeń,
* zbieranie danych,
* synchronizacja po odzyskaniu połączenia z AquaCore.

Uwagi:

Po przywróceniu łączności SBS Emergency Core przekazuje raport oraz wszystkie zebrane dane do AquaCore.

## 2026-06-18

### Priorytet dokumentacji

Decyzja:

W pierwszej kolejności aktualizowane są istniejące dokumenty projektu.

Powód:

Zachowanie spójności dokumentacji oraz ograniczenie powstawania wielu dokumentów zawierających te same informacje.

Uwagi:

Nowe dokumenty tworzone są dopiero po uporządkowaniu istniejącej dokumentacji.

---

### Solar Ecosystem Hardware v1.0

Decyzja:

Rozpocząć standaryzację warstwy sprzętowej projektu.

Powód:

Uporządkowanie elektroniki, okablowania oraz przyszłych płytek PCB.

Uwagi:

Dokumentacja będzie obejmowała:

* listy zakupów,
* pinouty,
* standard kolorów przewodów,
* numerację przewodów,
* prowadzenie ścieżek PCB.

---

### Standaryzacja modułów

Decyzja:

Wprowadzić numerację Tube oraz Module.

Powód:

Ułatwienie montażu, serwisu oraz rozwoju urządzeń SBS.

Uwagi:

Przewidziano:

* Tube 1–6
* Module 1–6

Numeracja może zostać rozszerzona w przyszłości.

---

### SBS Factory Station

Decyzja:

Przewidzieć budowę przenośnego stanowiska serwisowego.

Powód:

Ułatwienie programowania, diagnostyki i testowania modułów SBS.

Uwagi:

Przewidywane funkcje:

* programowanie ESP32,
* testowanie elementów elektronicznych,
* diagnostyka czujników,
* testowanie magistrali komunikacyjnych,
* testowanie diod LED,
* kontrola jakości modułów przed montażem.

## 2026-06-20

### AquaCore OS

Decyzja:

Główny system nosi nazwę AquaCore OS.

Powód:

Wyraźne oddzielenie systemu operacyjnego od interfejsu użytkownika.

Uwagi:

Nazwa AquaCore pozostaje nazwą systemu, natomiast interfejs użytkownika nosi nazwę AquaCore UI.

---

### Silniki środowiskowe

Decyzja:

Przed rozwojem interfejsu użytkownika rozwijane są silniki środowiskowe.

Powód:

Interfejs jest jedynie warstwą prezentacji.

Najpierw musi istnieć logika działania systemu.

Uwagi:

Planowane silniki:

* Climate Engine
* Weather Engine
* Light Engine
* Moon Engine
* Season Engine
* Breeding Engine

---

### Weather Engine

Decyzja:

Początkowo pogoda generowana jest przez harmonogram i losowość.

Powód:

Umożliwia szybkie wdrożenie pierwszej wersji.

Uwagi:

Docelowo decyzje mają być podejmowane przez NAIDĘ na podstawie danych historycznych i aktualnego stanu ekosystemu.

---

### SBS Store

Decyzja:

System będzie posiadał sklep aplikacji i modułów.

Powód:

Nie każdy użytkownik potrzebuje wszystkich funkcji.

Uwagi:

Aplikacje i silniki będą instalowane według potrzeb użytkownika.

---

### Biblioteka wiedzy SBS

Decyzja:

Rozdzielić bibliotekę wiedzy użytkownika od wiedzy NAIDY.

Powód:

Oddzielenie materiałów użytkownika od danych wykorzystywanych przez AI.

Uwagi:

Planowane są:

* biblioteka wiedzy użytkownika
* biblioteka wiedzy NAIDY

---

### Multimedia

Decyzja:

System przechowuje zdjęcia oraz krótkie filmy.

Powód:

Dokumentacja zmian oraz analiza przez NAIDĘ.

Uwagi:

Filmy:

* maksymalnie 720p
* maksymalnie 60 sekund
* maksymalnie około 45 MB

---

### Globalna NAIDA

Decyzja:

W przyszłości możliwe jest porównywanie podobnych ekosystemów pomiędzy użytkownikami.

Powód:

Budowa globalnej pamięci doświadczeń biologicznych.

Uwagi:

Analizy mają uwzględniać:

* parametry wody
* obsadę
* historię chorób
* sukcesy hodowlane
* metody prowadzenia zbiorników

---

### Community

Decyzja:

System społecznościowy zostanie dodany w późniejszym etapie.

Powód:

Priorytetem są fundamenty systemu.

Uwagi:

NAIDA może analizować wiedzę biologiczną wynikającą z doświadczeń użytkowników, ignorując treści niezwiązane z ekosystemami.

---

### Filozofia projektu

Decyzja:

SBS nie jest sterownikiem urządzeń.

Powód:

Urządzenia są jedynie narzędziami.

Uwagi:

SBS dba o życie.

NAIDA nie steruje lampą.

NAIDA opiekuje się ekosystemem.

Docelowym kierunkiem rozwoju jest stworzenie Biological Ecosystem Operating System.

---

### Priorytet projektu

Decyzja:

Najpierw rozwijane są:

* baza danych
* dokumentacja
* logika systemu
* silniki środowiskowe
* urządzenia

Powód:

NAIDA nie jest fundamentem systemu.

Uwagi:

NAIDA stanowi zwieńczenie całego projektu.

## 2026-06-21

### Profil środowiskowy

Decyzja:

Głównym obiektem systemu SBS jest ekosystem.

Powód:

To ekosystem stanowi rzeczywisty obiekt obserwacji, analizy i opieki.

Uwagi:

Historia życia, parametry, choroby, rozmnażanie, multimedia i doświadczenia przypisywane są do konkretnego ekosystemu, a nie do konta użytkownika.

---

### Nazwy gatunków

Decyzja:

Nazwa łacińska (scientific_name) stanowi główny identyfikator gatunku.

Powód:

Nazwy zwyczajowe różnią się pomiędzy krajami, językami oraz regionami świata.

Uwagi:

Nazwy zwyczajowe pełnią rolę tłumaczeń, aliasów oraz ułatwiają wyszukiwanie gatunków przez użytkownika.

---

### Modułowa baza gatunków

Decyzja:

Biblioteka gatunków może być rozwijana przy użyciu oddzielnych plików danych.

Powód:

Ułatwia rozbudowę i aktualizację bez konieczności przebudowy całej bazy.

Uwagi:

Przykładowe pliki:

* species_fish.xlsx
* species_plants.xlsx
* species_shrimps.xlsx
* species_snails.xlsx
* species_crabs.xlsx
* species_reptiles.xlsx
* species_amphibians.xlsx
* species_insects.xlsx

Pliki wykorzystywane są podczas tworzenia profilu środowiskowego oraz importu gatunków.

---

### Wyszukiwanie gatunków

Decyzja:

System wyszukiwania organizmów obsługuje wiele sposobów identyfikacji gatunków.

Powód:

Użytkownicy posługują się zarówno nazwami zwyczajowymi, jak i nazwami naukowymi.

Uwagi:

Wyszukiwanie może odbywać się po:

* nazwie zwyczajowej,
* nazwie łacińskiej,
* aliasach,
* grupach organizmów.

---

### Podgląd gatunków

Decyzja:

Przy wyborze organizmów system może wyświetlać miniaturki gatunków.

Powód:

Ułatwia identyfikację organizmów oraz ogranicza możliwość pomyłki.

Uwagi:

Po najechaniu kursorem na nazwę gatunku wyświetlany jest podgląd zdjęcia bez konieczności otwierania pełnego profilu.

---

### Anonimizacja źródeł wiedzy

Decyzja:

NAIDA nie wyświetla nazw książek, autorów ani szczegółowych źródeł informacji.

Powód:

Ograniczenie problemów związanych z prawami autorskimi oraz licencjami.

Uwagi:

Użytkownik otrzymuje wyłącznie wnioski, zalecenia oraz poziom pewności informacji.

---

### Profil kompetencji użytkownika

Decyzja:

Poziom doświadczenia użytkownika może być weryfikowany przez AquaCore OS i NAIDĘ.

Powód:

Deklarowany poziom wiedzy nie zawsze odpowiada rzeczywistemu doświadczeniu.

Uwagi:

Analizowane mogą być między innymi:

* długość prowadzenia ekosystemów,
* stabilność zbiorników,
* historia rozmnażania,
* liczba obserwacji i pomiarów,
* aktywność użytkownika.

---

### System osiągnięć

Decyzja:

W przyszłości SBS może posiadać system osiągnięć, odznak i pucharów.

Powód:

Motywowanie użytkowników oraz dokumentowanie doświadczeń.

Uwagi:

Przykładowe osiągnięcia:

* pierwsze tarło,
* pierwszy rok bez restartu,
* 1000 testów wody,
* 5 lat prowadzenia ekosystemu,
* pomoc innym użytkownikom.

---

### SBS Community

Decyzja:

Moduł społecznościowy rozwijany będzie w późniejszych etapach projektu.

Powód:

Priorytetem są fundamenty systemu.

Uwagi:

Społeczność ma służyć wymianie doświadczeń biologicznych, a nie pełnić funkcji klasycznego serwisu społecznościowego.

---

### Konsultacje specjalistyczne

Decyzja:

W przyszłości możliwe będzie udzielanie konsultacji przez specjalistów.

Powód:

Ułatwienie dostępu do wiedzy oraz pomocy merytorycznej.

Uwagi:

Przewidywane role:

* veterinarian
* ichthyologist
* breeder
* seller
* researcher

Dostęp do ekosystemu użytkownika odbywa się wyłącznie za jego zgodą.

---

## 2026-07-07

### Kontrola wersji projektu

Decyzja:

Smart BioSystem używa lokalnego repozytorium Git jako obecnego źródła historii projektu.

Powód:

Projekt osiągnął etap, w którym historia zmian musi być odtwarzalna, kontrolowana i możliwa do przeglądu przed każdym kolejnym krokiem rozwoju.

Ustalenia:

* główną gałęzią roboczą jest `development`,
* kolejne zmiany zapisywane są małymi, tematycznymi commitami,
* lokalne repozytorium na Synology jest obecnym źródłem historii projektu,
* Git nie jest elementem runtime SBS i nie bierze udziału w działaniu AquaCore OS,
* standardem zakończeń linii dla kodu i dokumentacji jest LF,
* pliki `.bat`, `.cmd` i `.ps1` zachowują CRLF,
* sekrety, hasła, tokeny, klucze prywatne, pliki `.env` i prywatna konfiguracja nie są wersjonowane.

Zasada pracy:

Przed commitem należy wykonać kolejno:

1. `git status`
2. `git diff`
3. selektywne `git add <plik>`
4. `git diff --cached`
5. `git commit`

Uwagi:

`git add .` nie powinno być używane rutynowo, ponieważ zwiększa ryzyko przypadkowego dodania plików lokalnych lub prywatnych.

---

## 2026-07-08

### Rozruch AquaCore OS, uprawnienia i wersjonowanie modułów

Decyzja:

Boot Sequence AquaCore OS jest wspólnym mechanizmem rozruchu i diagnostyki systemu.

Powód:

AquaCore UI, AquaCore Home i przyszły AquaCore Monitor muszą prezentować stan systemu na podstawie tych samych danych, które wykorzystuje rdzeń AquaCore OS.

Ustalenia:

* nie tworzy się drugiego niezależnego mechanizmu statusów modułów,
* Boot Sequence rozwijany jest na bazie `BootSequence`, `BootStepInterface`, `BootStepResult`, `ModuleStatus`, `ModuleState`, `ModuleStatusProvider`, `Logger`, `ErrorCode` oraz przyszłego API status / health,
* ekran Boot Sequence w UI jest prezentacją rzeczywistego procesu rozruchu,
* po logowaniu użytkownik trafia najpierw do ekranu rozruchu klienta, a dopiero potem do AquaCore UI, trybu ograniczonego albo ekranu błędu,
* system rozróżnia Server Mode, Client Mode oraz Embedded / Home Mode,
* model użytkowników obejmuje Opiekuna Ekosystemu jako osobę odpowiedzialną za konkretny ekosystem,
* uprawnienia są docelowo indywidualne i przypisane do zakresów działań, nie tylko do ogólnej roli,
* operacje wpływające na dobrostan organizmów wymagają zatwierdzenia przez uprawnionego użytkownika lub Opiekuna Ekosystemu,
* NAIDA wspiera decyzje, interpretuje doświadczenie i osiągnięcia, ale nie zastępuje decyzji Opiekuna Ekosystemu,
* AquaCore Monitor jest przyszłym narzędziem diagnostycznym administratora i serwisu, nie osobnym runtime systemu,
* AquaCore OS i AquaCore UI mogą mieć osobne wersje, ale muszą być opisane wspólną historią projektu SBS,
* istotne zmiany techniczne i użytkowe wymagają changeloga oraz release notes.

Ograniczenia:

Na tym etapie decyzja ma charakter dokumentacyjny i architektoniczny.

Nie implementuje logowania, AquaCore Monitor, endpointów API, połączeń MariaDB, połączeń MQTT ani zmian w bazie danych.