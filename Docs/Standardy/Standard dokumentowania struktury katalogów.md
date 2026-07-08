# Standard dokumentowania struktury katalogów Smart BioSystem

Każdy katalog w Smart BioSystem musi być opisany w postaci drzewa katalogów.

## Format

```
Folder
│
├── Podfolder → (krótki opis przeznaczenia folderu)
│   └── (pusty)
│
└── Inny folder → (krótki opis zawartości)
```

## Zasady

1. Przy każdym folderze stosowana jest strzałka `→`.
2. W nawiasie podawany jest krótki opis przeznaczenia folderu.
3. Jeżeli folder nie zawiera jeszcze żadnych plików lub podfolderów, dodawany jest wpis:

```
└── (pusty)
```

4. Opisy mają określać przeznaczenie folderu, a nie aktualną zawartość.
5. Cała dokumentacja struktury projektu musi zachowywać identyczny format.
6. Zmiany w strukturze katalogów wymagają aktualizacji mapy katalogów.
7. Struktura katalogów stanowi oficjalną dokumentację AquaCore OS i Smart BioSystem.
8. Wszystkie nowe moduły, silniki, biblioteki i komponenty muszą zostać dopisane do mapy projektu.
9. Mapa katalogów jest utrzymywana zgodnie ze stanem faktycznym projektu i nie zawiera elementów, które nie zostały jeszcze utworzone.

Standard ten obowiązuje dla:

* Smart BioSystem
* AquaCore OS
* AquaCore UI
* Database
* Hardware
* Firmware
* AI
* Docs
* Tools
* oraz wszystkich przyszłych komponentów projektu.

## Standard pracy z Git

Przed każdym commitem obowiązuje kolejność:

1. Sprawdź stan repozytorium:

```powershell
git status
```

2. Sprawdź zmiany robocze:

```powershell
git diff
```

3. Dodaj wyłącznie konkretne pliki związane z daną zmianą:

```powershell
git add <plik>
```

4. Sprawdź staging:

```powershell
git diff --cached
```

5. Dopiero potem wykonaj commit:

```powershell
git commit -m "typ(zakres): opis"
```

`git add .` nie powinno być używane rutynowo przy kolejnych zmianach.

Pliki z hasłami, tokenami, kluczami prywatnymi, pliki `.env` i prywatna konfiguracja muszą pozostawać poza repozytorium.

Nie wolno przepisywać sekretów do dokumentacji ani commitów.

## Changelog i release notes

Istotne zmiany w SBS powinny być dokumentowane w trzech poziomach:

1. dziennik prac - szczegółowy przebieg pracy,
2. changelog - techniczna lista zmian,
3. release notes - krótki opis wpływu zmiany na użytkownika lub administratora.

Changelog i release notes nie zastępują historii Git.

Git zapisuje dokładny zakres zmian, a dokumentacja wyjaśnia ich sens projektowy.

## Zasady sesji roboczej

Każda większa sesja powinna zawierać:

- datę,
- godzinę rozpoczęcia i zakończenia,
- zakres prac,
- listę zmienionych dokumentów lub modułów,
- wynik kontroli spójności,
- informację, czy wykonano commit.

Przed rozpoczęciem kolejnej sesji należy sprawdzić `git status`, aktualną gałąź oraz ostatnie commity.

## Zasada porządkowania dokumentów

Dokumenty w `Docs` należy grupować według tematu, nie według daty utworzenia.

Preferowana kolejność decyzji:

1. Czy dokument dotyczy konkretnego modułu, np. AquaCore OS albo AquaCore UI?
2. Czy dokument jest decyzją, historią lub planem projektu?
3. Czy dokument jest dokumentacją techniczną bazy, integracji albo urządzenia?
4. Czy dokument jest dziennikiem, raportem albo standardem?
5. Jeżeli nie pasuje do żadnej grupy, należy zaproponować nowy folder.

Root folderu `Docs` powinien pozostać lekki i pełnić funkcję wejścia do dokumentacji, a nie miejsca odkładania wszystkich plików.