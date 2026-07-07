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