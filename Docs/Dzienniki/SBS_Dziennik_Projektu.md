2026-06-18

Ustalono:

- Rozpoczęcie prac nad Solar Ecosystem Hardware v1.0
- Standaryzację numeracji Tube 1-6
- Standaryzację numeracji Module 1-6
- Przygotowanie dokumentacji:

  * lista zakupów
  * pinouty
  * standard kolorów przewodów
  * numeracja przewodów
  * routing PCB

- Rozpoczęcie prac koncepcyjnych nad SBS Factory Station

Przyjęto zasadę:

Najpierw aktualizacja istniejącej dokumentacji.

Nowe dokumenty tworzone są dopiero po uporządkowaniu obecnych.

--------------------------------------------------

2026-06-19

Ustalono:

- Pierwszym urządzeniem SBS będzie pompa nawozowa.

- Budowa lampy została przesunięta na późniejszy etap.

- Priorytetami pozostają:

  * samochód
  * remont sypialni
  * oszczędności

- Wprowadzono standard:

  * przełącznik kołyskowy POWER

  * przycisk wielofunkcyjny:

    - reset urządzenia
    - tryb serwisowy
    - przywracanie ustawień fabrycznych

- Przyjęto zewnętrzne złącze USB-C do:

  * programowania
  * diagnostyki
  * aktualizacji firmware

- Zmieniono koncepcję sygnalizacji.

Zrezygnowano z wielu pojedynczych diod LED.

Przyjęto jedną diodę RGB jako wspólny standard urządzeń SBS.

- Rozpoczęto opracowywanie standardów okablowania:

  * AWG16
  * AWG20
  * organizacja wiązek
  * rękawy PET
  * przelotki gumowe
  * przepusty M20

Przyjęto zasadę:

Najpierw dokumentacja i testy.

Zakupy i budowa realizowane etapami.

--------------------------------------------------

2026-06-20

Ustalono:

- AquaCore zostaje oficjalnie przemianowany na AquaCore OS.

- AquaCore UI pozostaje nazwą interfejsu użytkownika.

- Po ukończeniu fundamentów bazy danych rozwijane będą silniki środowiskowe przed rozpoczęciem prac nad panelem WWW.

Przyjęto architekturę:

MariaDB
↓
Node-RED
↓
API
↓
AquaCore OS
↓
Silniki środowiskowe
↓
AquaCore UI
↓
Urządzenia ESP32
↓
NAIDA

Rozpoczęto projektowanie:

* Climate Engine
* Weather Engine
* Light Engine
* Moon Engine
* Season Engine
* Breeding Engine

Przyjęto zasadę:

Najpierw logika systemu.

Interfejs użytkownika jest jedynie warstwą prezentacji.

--------------------------------------------------

Ustalono:

System będzie posiadał SBS Store.

Przeznaczenie:

- instalacja aplikacji
- moduły funkcjonalne
- silniki środowiskowe

Przyjęto zasadę:

Użytkownik instaluje tylko potrzebne funkcje.

--------------------------------------------------

Ustalono:

Rozdzielić bibliotekę wiedzy użytkownika od wiedzy NAIDY.

Przeznaczenie:

- biblioteka użytkownika
- biblioteka NAIDY

Źródła wiedzy:

* książki
* PDF
* e-booki
* strony WWW
* dokumentacja
* notatki użytkownika

--------------------------------------------------

Ustalono:

System będzie przechowywał multimedia.

Limity:

Filmy:

* maksymalnie 720p
* maksymalnie 60 sekund
* maksymalnie około 45 MB

Przeznaczenie:

- dokumentacja ekosystemu
- analiza przez NAIDĘ
- Computer Vision

--------------------------------------------------

Ustalono:

Rozpoczęto rozbudowę mapy bazy danych.

Stan obecny:

13 gotowych tabel.

Planowany rozwój:

85 tabel.

Przyjęto zasadę:

Dokumentacja ma opisywać nie tylko nazwy tabel, ale również ich przeznaczenie oraz rolę dla przyszłej NAIDY.

--------------------------------------------------

Ustalono:

SBS nie jest sterownikiem urządzeń.

Urządzenia są jedynie narzędziami.

Najważniejsze są:

- zwierzęta
- rośliny
- mikroorganizmy
- dobrostan ekosystemu

Przyjęto długoterminowy kierunek rozwoju:

Biological Ecosystem Operating System (BEOS)

czyli system operacyjny dla żywych ekosystemów.

--------------------------------------------------

Przyjęto zasadę:

Najpierw:

* dane
* dokumentacja
* baza danych
* logika systemu
* silniki środowiskowe
* urządzenia

Dopiero później:

* NAIDA
* analiza obrazu
* częściowa autonomia
* funkcje społecznościowe

NAIDA jest zwieńczeniem projektu, a nie jego fundamentem.

--------------------------------------------------
2026-07-07

Kamień milowy:

Uruchomiono lokalną historię projektu Smart BioSystem w Git.

Ustalono:

- repozytorium działa lokalnie w głównym katalogu projektu SBS na dysku `S:`
- główną gałęzią roboczą jest `development`
- pierwszy commit projektu ma identyfikator `7ee68bf`
- sekrety, hasła, tokeny, klucze prywatne i prywatna konfiguracja nie są wersjonowane
- historia Git jest obecnie lokalnym źródłem historii projektu na Synology

Przyjęto zasadę:

Kolejne zmiany mają być zapisywane małymi, tematycznymi commitami po wcześniejszej kontroli `git status`, `git diff`, selektywnym `git add` i `git diff --cached`.

--------------------------------------------------

--------------------------------------------------

2026-07-07

Kamień milowy:

Uruchomiono bootowalny szkielet AquaCore OS Core.

Ustalono:

- AquaCore OS posiada punkt startowy CLI,
- działa diagnostyka modułów,
- działa smoke test CLI,
- Git jest lokalną historią projektu na gałęzi `development`,
- pierwszy commit techniczny projektu to `7ee68bf`,
- sekrety pozostają poza repozytorium.

AquaCore OS nie posiada jeszcze runtime aplikacyjnego, połączenia z MariaDB, połączenia z MQTT, API endpointów ani logowania użytkownika.

Git pełni rolę kontroli wersji i dziennika zmian projektu, ale nie jest elementem runtime SBS.

--------------------------------------------------

2026-07-08

Ustalenie projektowe:

Boot Sequence AquaCore OS zostaje przyjęty jako wspólna podstawa rozruchu i diagnostyki dla rdzenia systemu, AquaCore UI, AquaCore Home oraz przyszłego AquaCore Monitor.

Ustalono również, że po logowaniu użytkownik nie trafia bezpośrednio do dashboardu, lecz przechodzi przez ekran rozruchu klienta AquaCore OS oraz kontrolę usług krytycznych i opcjonalnych.

Ustalenie ma charakter dokumentacyjny i architektoniczny. Nie wprowadza zmian w kodzie, bazie danych, API, MariaDB ani MQTT.

--------------------------------------------------

2026-07-08

Porządkowanie dokumentacji:

Uporządkowano folder `Docs`, wydzielając dokumenty projektowe, techniczne, UI, bazodanowe, integracyjne i sprzętowe do czytelnych lokalizacji.

Dodano indeks `Docs/README.md`, który wskazuje główne miejsca dokumentacji SBS.

Pliki z hasłami i danymi prywatnymi pozostają poza normalnym obiegiem wersjonowanej dokumentacji.

--------------------------------------------------

2026-07-08

Kamień milowy:

Projekt Smart BioSystem został podłączony do GitHuba.

Ustalono model pracy:

- lokalne repozytorium Git na NAS,
- zdalne repozytorium GitHub `https://github.com/gregorro96-ux/Smart-BioSystem.git`,
- główna gałąź robocza `development`,
- synchronizacja przez `origin/development`.

Wykonano commit dokumentacyjny:

- `83b4648 Aktualizacja dokumentacji projektu`

Po zakończeniu integracji repozytorium było zsynchronizowane z GitHubem, a working tree był czysty.

GitHub jest zdalnym repozytorium projektu i nie jest elementem runtime SBS.
--------------------------------------------------

2026-07-08

Kamień milowy:

AquaCore OS uzyskał pierwsze realne testy połączeń z warstwami infrastruktury lokalnej.

Potwierdzono:

- realny test połączenia z MariaDB przez `database:test`,
- realny test połączenia z brokerem MQTT przez `mqtt:test`,
- bezpieczne kody diagnostyczne dla MariaDB i MQTT,
- brak migracji i brak zmian struktury tabel,
- brak publikacji i subskrypcji MQTT,
- brak runtime MQTT,
- prywatna konfiguracja pozostaje poza repozytorium.

Zmiany mają charakter technicznego fundamentu diagnostycznego AquaCore OS, a nie wdrożenia produkcyjnego runtime.
--------------------------------------------------

2026-07-08

Kamień milowy:

Przygotowano pierwszy prywatny kontrakt health/status API dla AquaCore OS.

Ustalono:

- komenda `api:health` zwraca payload JSON zgodny ze standardem `ApiResponse`,
- tryb domyślny `snapshot` nie wykonuje zewnętrznych testów MariaDB ani MQTT,
- tryb `--live` wykonuje świadome testy diagnostyczne z aktualnej konfiguracji lokalnej,
- nie uruchomiono serwera HTTP,
- nie utworzono publicznych endpointów API,
- nie wdrożono logowania ani kontroli dostępu.

Zmiana stanowi kontrakt danych pod przyszłe prywatne endpointy oraz AquaCore UI / AquaCore Monitor.
