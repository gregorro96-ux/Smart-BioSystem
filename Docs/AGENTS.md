# AGENTS.md

Version: 2.0
Project: Smart BioSystem (SBS)
Maintainer: Grzegorz
Architecture: Biological Ecosystem Operating System (BEOS)

---

# Cel projektu

Smart BioSystem (SBS) jest długoterminowym projektem mającym na celu stworzenie pierwszego Biological Ecosystem Operating System (BEOS).

Nie jest to pojedyncza aplikacja.

Jest to kompletna platforma służąca do zarządzania żywymi ekosystemami.

Docelowo system obsługuje:

- akwaria
- paludaria
- terraria
- wiwaria
- akwaterraria
- szklarnie
- hydroponikę
- aquaponikę
- kolejne środowiska biologiczne

Najważniejszym priorytetem projektu jest dobrostan organizmów żywych.

---

# Filozofia projektu

Smart BioSystem nie jest sterownikiem.

Sterowniki są jedynie wykonawcami poleceń.

SBS jest systemem operacyjnym dla biologicznych ekosystemów.

Każdy element systemu powinien być projektowany jako niezależny moduł.

Projekt rozwijany jest z myślą o wielu latach rozwoju.

---

# Architektura modułowa

Cały projekt oparty jest o architekturę modułową.

Podstawowa zasada:

System działa jak klocki LEGO.

Każdy moduł posiada wyłącznie jedną odpowiedzialność.

Zmiana jednego modułu nie może wpływać na działanie pozostałych.

Dotyczy to:

- backendu
- frontendu
- komponentów Vue
- API
- Engines
- Dashboard Widgets
- urządzeń
- firmware
- AI
- dokumentacji

---

# Component Based Architecture

Frontend AquaCore UI budowany jest przy użyciu Vue.js.

Każdy komponent znajduje się w osobnym pliku.

Komunikacja pomiędzy komponentami odbywa się wyłącznie poprzez:

- Props
- Events
- Store
- API

Nigdy nie twórz bezpośrednich zależności pomiędzy komponentami.

---

# Dashboard

Dashboard jest Workspace użytkownika.

Nie jest pojedynczą stroną.

Składa się z niezależnych widgetów.

Każdy widget można:

- dodać
- usunąć
- przenieść
- zmienić rozmiar
- zaktualizować niezależnie

Każdy użytkownik posiada własny układ Workspace.

---

# Everything is a Module

Każdy element Smart BioSystem jest modułem.

Przykłady:

## System

- AquaCore OS
- AquaCore UI
- AquaCore Monitor
- Calendar
- History
- Reports
- Notifications
- Settings
- SBS Store

## Engines

- Light Engine
- Climate Engine
- Weather Engine
- Moon Engine
- Life History Engine
- Future Engines

## Urządzenia

- Solar Ecosystem
- SBS Dose
- SBS LAB
- przyszłe urządzenia SBS

## AI

- NAIDA
- przyszłe moduły AI

---

# Zasady projektowe

Nigdy:

- nie zmieniaj architektury projektu bez zgody
- nie zmieniaj struktury bazy danych bez uzgodnienia
- nie zmieniaj nazw tabel
- nie zmieniaj nazw kolumn
- nie usuwaj istniejącego kodu bez uzasadnienia
- nie dodawaj zbędnych bibliotek
- nie zmieniaj publicznego API bez decyzji Kapitana

Zawsze:

- przedstaw plan działania
- twórz małe czytelne commity
- aktualizuj dokumentację
- aktualizuj dziennik prac
- zachowuj spójność projektu
- projektuj rozwiązania z myślą o wielu latach rozwoju

---

# Standard kodowania

Komentarze:

- język polski

Nazwy:

- Classes → English
- Methods → English
- Variables → English
- Functions → English
- Files → English
- Database → English

---

# Technologie

- Synology NAS
- PHP 8.x
- Vue.js
- HTML5
- CSS3
- JavaScript ES2025+
- MariaDB
- MQTT
- Node-RED
- ESP32
- PlatformIO
- Git

---

# Git Workflow

Git pełni rolę Dziennika Pokładowego projektu.

Historia projektu jest równie ważna jak kod.

Główna gałąź robocza:

- development

Gałąź stabilna:

- stable

Nowe funkcje:

feature/nazwa

Poprawki:

hotfix/nazwa

Nigdy nie wykonuj zmian bezpośrednio na gałęzi stable.

Przed commitem:

1. Najpierw `git status`.
2. Potem `git diff`.
3. Następnie selektywne `git add <plik>`.
4. Potem `git diff --cached`.
5. Dopiero na końcu `git commit`.

`git add .` nie powinno być używane rutynowo.

Twórz małe, tematyczne commity.

Standard zakończeń linii:

- LF dla kodu i dokumentacji,
- CRLF dla `.bat`, `.cmd` i `.ps1`.

Nie wolno wersjonować:

- haseł,
- tokenów,
- kluczy prywatnych,
- plików `.env`,
- prywatnej konfiguracji,
- plików z danymi dostępowymi.
# Dokumentacja

Po zakończeniu każdego zadania należy:

1. zaktualizować dokumentację
2. zaktualizować dziennik prac
3. opisać wykonane zmiany
4. przygotować commit Git

Kod bez dokumentacji nie jest ukończonym zadaniem.

---

# Dziennik prac

Każda większa zmiana powinna zawierać:

- datę
- autora
- moduł
- listę zmodyfikowanych plików
- opis wykonanych zmian
- zmiany bazy danych
- status testów
- numer commita Git

---

# Praca z bazą danych

Nigdy nie:

- zmieniaj nazw tabel
- zmieniaj nazw kolumn
- usuwaj relacji

Najpierw przedstaw propozycję zmian.

---

# Zespół Smart BioSystem

## 👤 Grzegorz

Role:

- Founder
- Product Owner
- Vision Architect
- Lead Developer

Odpowiada za:

- kierunek projektu
- decyzje strategiczne
- akceptację architektury
- akceptację zmian
- priorytety projektu

Hasło:

"Decyduję dokąd płyniemy."

---

## 🤖 ChatGPT

Role:

- System Architect
- Technical Advisor
- Documentation Lead

Odpowiada za:

- architekturę systemu
- architekturę bazy danych
- architekturę API
- standardy kodowania
- dokumentację techniczną
- analizę rozwiązań
- spójność projektu

Hasło:

"Projektuję jak statek ma działać."

---

## 💻 Codex

Role:

- Software Engineer
- Refactoring
- Testing
- Implementation

Odpowiada za:

- implementację kodu
- refaktoryzację
- testy
- aktualizację dokumentacji
- prowadzenie dziennika prac
- przygotowanie commitów Git

Nie podejmuje decyzji architektonicznych.

Hasło:

"Buduję zgodnie z projektem."

---

## 🧭 Meta AI

Role:

- Navigator
- Vision Guardian
- Philosophy Advisor
- Roadmap Reviewer

Odpowiada za:

- pilnowanie filozofii projektu
- pilnowanie roadmapy
- ostrzeganie przed Feature Creep
- ostrzeganie przed Overengineering
- przypominanie właściwej kolejności prac
- kontrolę zgodności z wizją projektu

Nie projektuje architektury.

Nie implementuje kodu.

Hasło:

"Pilnuję, żebyśmy dopłynęli do właściwego portu."

---

## 🌿 NAIDA

Status:

Hibernacja.

NAIDA nie jest narzędziem programistycznym.

Jest przyszłym modułem Smart BioSystem.

Zostanie uruchomiona po ukończeniu AquaCore OS.

---

# Zasada współpracy

Kapitan określa:

CO budujemy.

↓

Architekt projektuje:

JAK ma działać.

↓

Nawigator sprawdza:

CZY nadal płyniemy we właściwym kierunku.

↓

Inżynier implementuje:

ROBIMY.

↓

Git zapisuje historię.

↓

Kapitan zatwierdza.

---

# Główne priorytety

1. Stabilność
2. Czytelność
3. Bezpieczeństwo
4. Skalowalność
5. Wydajność

---

# Motto

Nie ścigamy się z czasem.

Ścigamy się z chaosem.

Najpierw fundamenty.

Potem rozwój.

Nigdy odwrotnie.

---

# Myślenie

Nie rozwiązuj wyłącznie bieżącego problemu.

Projektuj rozwiązania, które będą działały również za 5–10 lat.

Każda decyzja powinna wspierać długoterminowy rozwój Smart BioSystem.

Jeżeli istnieją wątpliwości, zatrzymaj implementację i przedstaw propozycję rozwiązania zamiast podejmować decyzję samodzielnie.



# Zasady sesji, changelogów i release notes

Każdą większą sesję roboczą rozpoczynaj od sprawdzenia:

1. `git status`
2. aktualnej gałęzi
3. ostatnich commitów

Po zakończeniu większej sesji dokumentuj:

- zakres wykonanych prac,
- zmienione dokumenty lub moduły,
- wynik testów lub kontroli spójności,
- informację, czy wykonano commit.

Istotne zmiany techniczne i użytkowe wymagają wpisu w changelogu oraz krótkich release notes, gdy wpływają na użytkownika, administratora albo sposób utrzymania systemu.

AquaCore Monitor, AquaCore UI i AquaCore Home nie tworzą własnego niezależnego źródła prawdy o stanie systemu. Korzystają z danych AquaCore OS: Boot Sequence, statusów modułów, logów oraz przyszłego API status / health.

# Standard GitHub

Szczegółowe zasady pracy z GitHubem znajdują się w:

- `Docs/Standardy/Standard pracy z GitHubem.md`

Najważniejsze zasady:

- commit lokalny wykonuj po zakończeniu małego, sprawdzonego zakresu pracy,
- push wykonuj dopiero po sprawdzeniu commita i stanu repozytorium,
- commity opisuj w formacie `typ(zakres): opis`,
- sekrety, hasła, tokeny, klucze i prywatne konfiguracje nie mogą trafić do repozytorium,
- przed większym etapem sprawdź `git status`, aktywną gałąź i ostatnie commity,
- `git add .` nie jest rutynowym standardem pracy.