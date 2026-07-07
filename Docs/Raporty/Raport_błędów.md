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
