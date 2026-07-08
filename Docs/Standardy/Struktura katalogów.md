📗 Smart BioSystem
│
├─── 📂 .git → (lokalne repozytorium Git i historia projektu; nie jest elementem runtime SBS)
│
├─── 📄 .gitattributes → (standard zakończeń linii i obsługa plików binarnych)
│
├─── 📄 .gitignore → (reguły wykluczania sekretów, logów, backupów i plików tymczasowych)
│
├─── 📂 AI → (główny katalog sztucznej inteligencji)
│
├─── 📂 AquaCore OS → (jądro i logika systemu AquaCore OS)
│    │   
│    ├── 📘 API → (interfejsy komunikacji między modułami i urządzeniami)
│    │      
│    ├── 📘 Automation → (automatyzacje, harmonogramy i akcje systemowe)   
│    │
│    ├── 📘 Backup → (obsługa kopii zapasowych i przywracania danych)
│    │   
│    ├── 📘 Compatibility → (warstwa zgodności z urządzeniami i systemami)  
│    │
│    ├── 📘 Config → (konfiguracja AquaCore OS i środowisk pracy)
│    │
│    ├── 📘 Core → (główne komponenty i funkcje AquaCore OS)   
│    │
│    ├── 📘 Database → (komunikacja z bazą danych i operacje na danych)
│    │
│    ├── 📘 Errors → (standard błędów i wyjątków AquaCore OS)
│    │
│    ├── 📘 Engines → (silniki odpowiedzialne za symulacje i logikę środowiska)
│    │    │
│    │    ├── 📙 Climate Engine → (obliczenia klimatu, temperatur i pór roku)
│    │    │   
│    │    ├── 📙 Life History Engine → (historia życia organizmów i zdarzeń) 
│    │    │
│    │    ├── 📙 Light Engine → (cykle oświetlenia, wschody, zachody i widmo)
│    │    │
│    │    ├── 📙 Moon Engine → (fazy księżyca i wpływ na ekosystem)
│    │    │
│    │    └── 📙 Weather Engine → (symulacja pogody i zjawisk atmosferycznych)
│    │  
│    │
│    ├── 📘 Logging → (rejestrowanie zdarzeń i logów systemowych)   
│    │      
│    ├── 📘 NAIDA → (silnik głównej AI oraz komunikacja z użytkownikiem)
│    │
│    ├── 📘 Notifications → (powiadomienia lokalne, e-mail i push)   
│    │
│    ├── 📘 Scheduler → (harmonogramy i zadania cykliczne)
│    │
│    ├── 📘 Security → (uwierzytelnianie, role i bezpieczeństwo systemu)
│    │
│    ├── 📘 Services → (usługi działające w tle)
│    │
│    └── 📘 System → (podstawowe funkcje systemowe AquaCore OS)
│    
├─── 📂 AquaCore UI → (interfejs użytkownika AquaCore OS)
│    │   
│    ├── 📘 Animations → (animacje i efekty interfejsu)
│    │
│    ├── 📘 Assets → (zasoby graficzne i multimedialne)
│    │   │
│    │   ├── 📙 Fonts → (czcionki systemowe)
│    │   │
│    │   ├── 📙 Icons → (ikony interfejsu)
│    │   │
│    │   ├── 📙 Images → (obrazy i grafiki)
│    │   │
│    │   └── 📙 Sounds → (dźwięki i efekty audio)
│    │
│    ├── 📘 Components → (uniwersalne komponenty UI)
│    │   │   
│    │   ├── 📙 Buttons → (przyciski)
│    │   │
│    │   ├── 📙 Cards → (karty informacyjne)
│    │   │
│    │   ├── 📙 Charts → (wykresy i wizualizacje danych)
│    │   │
│    │   ├── 📙 Dialogs → (okna dialogowe)
│    │   │
│    │   ├── 📙 Inputs → (pola formularzy i wejścia)
│    │   │ 
│    │   └── 📙 Navigations → (menu i nawigacja)
│    │
│    ├── 📘 Dashboard → (główny pulpit systemu)
│    │   │
│    │   └── 📙 NodeRED → (integracja dashboardu Node-RED)
│    │
│    ├── 📘 Layouts → (układy interfejsu dla różnych urządzeń)
│    │   │
│    │   ├── 📙 Desktop → (układ dla komputerów)
│    │   │
│    │   ├── 📙 Desktop → (układ dla komputerów)
│    │   │
│    │   ├── 📙 Mobile → (układ dla smartfonów)
│    │   │
│    │   ├── 📙 Q10 Pro → (układ dla panelu Q10 Pro)
│    │   │
│    │   └── 📙 Tablet → (układ dla tabletów)
│    │
│    ├── 📘 Locals → (pliki lokalizacji językowych)
│    │   │
│    │   ├── 📙 en → (język angielski)
│    │   │
│    │   └── 📙 pl → (język polski)
│    │
│    ├── 📘 Modules → (moduły funkcjonalne AquaCore UI)
│    │   │
│    │   ├── 📙 Achievements → (osiągnięcia i odznaki)
│    │   │
│    │   ├── 📙 AI → (funkcje sztucznej inteligencji)
│    │   │
│    │   ├── 📙 Analytics → (analiza danych i statystyki)
│    │   │
│    │   ├── 📙 Automation → (automatyzacje)
│    │   │
│    │   ├── 📙 Calendar → (kalendarz i harmonogramy)
│    │   │
│    │   ├── 📙 Cameras → (kamery i podgląd obrazu)
│    │   │
│    │   ├── 📙 Climate → (klimat i warunki środowiskowe)
│    │   │
│    │   ├── 📙 Community → (społeczność użytkowników)
│    │   │
│    │   ├── 📙 Dashboard → (ekrany główne i pulpity)
│    │   │
│    │   ├── 📙 Devices → (zarządzanie urządzeniami)
│    │   │
│    │   ├── 📙 Diagnostics → (diagnostyka systemu)
│    │   │
│    │   ├── 📙 Digital Twin → (cyfrowe bliźniaki ekosystemów)
│    │   │
│    │   ├── 📙 Ecosystems → (obsługa ekosystemów)
│    │   │
│    │   ├── 📙 Events → (zdarzenia i historia)
│    │   │
│    │   ├── 📙 Feeding → (karmienie organizmów)
│    │   │
│    │   ├── 📙 History → (historia zmian i danych)
│    │   │
│    │   ├── 📙 Library → (biblioteka wiedzy użytkownika)
│    │   │
│    │   ├── 📙 Light → (oświetlenie)
│    │   │
│    │   ├── 📙 Livestock → (zwierzęta i organizmy)
│    │   │
│    │   ├── 📙 Multimedia → (zdjęcia, filmy i multimedia)
│    │   │
│    │   ├── 📙 NAIDA → (asystent AI NAIDA)
│    │   │
│    │   ├── 📙 Notifications → (powiadomienia)
│    │   │
│    │   ├── 📙 Parameters → (parametry i pomiary)
│    │   │
│    │   ├── 📙 Plants → (rośliny)
│    │   │ 
│    │   ├── 📙 Reports → (raporty i eksport danych)
│    │   │
│    │   ├── 📙 Security → (bezpieczeństwo i dostęp)
│    │   │
│    │   ├── 📙 Settings → (ustawienia systemowe)
│    │   │
│    │   ├── 📙 Simulations → (symulacje)
│    │   │
│    │   ├── 📙 Species → (gatunki)
│    │   │
│    │   ├── 📙 Store → (SBS Store)
│    │   │
│    │   ├── 📙 System → (funkcje systemowe)
│    │   │
│    │   ├── 📙 Users → (użytkownicy i profile)
│    │   │
│    │   ├── 📙 Voice → (sterowanie głosowe)
│    │   │
│    │   ├── 📙 Weather → (pogoda i prognozy)
│    │   │
│    │   └── 📙 Zones → (strefy i obszary)
│    │ 
│    ├── 📘 Public → (publiczne zasoby aplikacji)
│    │
│    ├── 📘 Router → (routing i przełączanie widoków)
│    │
│    ├── 📘 Stores → (magazyny stanów danych)
│    │
│    ├── 📘 Styles → (style CSS i wygląd interfejsu)
│    │
│    ├── 📘 Themes → (motywy graficzne)
│    │
│    ├── 📘 User Interface → (główny interfejs użytkownika)
│    │
│    ├── 📘 User Manual → (instrukcja użytkownika)
│    │   │
│    │   ├── 📙 en → (wersja angielska)
│    │   │
│    │   └── 📙 pl → (wersja polska)
│    │
│    ├── 📘 Utils → (funkcje pomocnicze)
│    │
│    ├── 📘 Views → (główne widoki aplikacji)
│    │   │
│    │   ├── 📙 About → (informacje o systemie)
│    │   │
│    │   ├── 📙 AI → (widoki AI)
│    │   │
│    │   ├── 📙 Analytics → (widoki analiz)
│    │   │
│    │   ├── 📙 Community → (widoki społeczności)
│    │   │
│    │   ├── 📙 Devices → (widoki urządzeń)
│    │   │
│    │   ├── 📙 Ecosystems → (widoki ekosystemów)
│    │   │
│    │   ├── 📙 Home → (ekran główny)
│    │   │
│    │   └── 📙 Settings → (ustawienia)
│    │
│    └── 📘 Widgets → (widżety wyświetlane na pulpitach)
│         │
│         ├── 📙 AI Assistant → (widżet asystenta NAIDA)
│         │
│         ├── 📙 Calendar → (widżet kalendarza)
│         │
│         ├── 📙 Camera → (widżet kamer)
│         │ 
│         ├── 📙 Graphs → (widżety wykresów)
│         │
│         ├── 📙 pH → (widżet parametrów pH)
│         │
│         ├── 📙 Temperature → (widżet temperatury)
│         │
│         └── 📙 Weather → (widżet pogody)
│ 
├─── 📂 Backups → (kopie zapasowe całego systemu SBS)
│    
├─── 📂 Config → (konfiguracja i ustawienia globalne)
│   
├─── 📂 Database → (bazy danych, modele i schematy SQL)
│    
├─── 📂 Docs → (dokumentacja techniczna i projektowa)
│    
├─── 📂 Firmware → (oprogramowanie urządzeń i sterowników)
│    
├─── 📂 Hardware → (projekty elektroniki, PCB i urządzeń)
│    
├─── 📂 Knowledge Base → (wewnętrzna baza wiedzy NAIDA)
│    
├─── 📂 Labs → (funkcje eksperymentalne i prototypy)
│    
├─── 📂 LightLab → (kalibracja i testowanie oświetlenia)
│    
├─── 📂 Logs → (logi systemowe i historia zdarzeń)
│    
├─── 📂 MQTT → (komunikacja MQTT i broker wiadomości)
│    
├─── 📂 Tests → (środowisko testowe i walidacja funkcji)
│     
└─── 📂 Tools → (narzędzia serwisowe i pomocnicze)

==================================================

# Standard pracy z Git

Repozytorium Git znajduje się w głównym katalogu projektu Smart BioSystem na dysku `S:`.

Główna gałąź robocza:

* `development`

## Pliki konfiguracyjne Git w katalogu głównym

* `.gitignore` → reguły wykluczania plików lokalnych, sekretów, logów, backupów, zależności i artefaktów builda.
* `.gitattributes` → reguły zakończeń linii oraz obsługi plików binarnych.

## Standard przed commitem

Każda zmiana powinna być sprawdzona w następującej kolejności:

1. Sprawdzenie stanu repozytorium:

```powershell
git status
```

2. Sprawdzenie zmian roboczych:

```powershell
git diff
```

3. Selektywne dodanie konkretnych plików:

```powershell
git add <plik>
```

4. Sprawdzenie zmian przygotowanych do commita:

```powershell
git diff --cached
```

5. Wykonanie małego, tematycznego commita:

```powershell
git commit -m "typ(zakres): opis"
```

## Zasady bezpieczeństwa

`git add .` nie powinno być używane rutynowo przy kolejnych zmianach.

Do commita należy dodawać tylko pliki związane z bieżącym zadaniem.

Poza repozytorium muszą pozostać:

* hasła,
* tokeny,
* klucze prywatne,
* pliki `.env`,
* prywatna konfiguracja,
* dokumenty zawierające dane dostępowe.

Standard zakończeń linii:

* LF dla kodu i dokumentacji,
* CRLF dla plików `.bat`, `.cmd` i `.ps1`.

