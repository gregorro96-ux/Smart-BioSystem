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
