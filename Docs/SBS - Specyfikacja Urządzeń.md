# SBS - Specyfikacja Urządzeń

## Status dokumentu

Wersja robocza.

Dokument opisuje urządzenia tworzące ekosystem SBS.

---

# 1. Solar Ecosystem

Typ:

Inteligentny system oświetlenia i monitoringu środowiska.

Status:

Projektowanie.

---

## Przeznaczenie

Solar Ecosystem odpowiada za:

* oświetlenie ekosystemu
* symulację naturalnego cyklu dnia
* zbieranie danych środowiskowych
* komunikację z AquaCore

---

## Funkcje podstawowe

* wschód słońca
* zachód słońca
* światło dzienne
* światło nocne
* fazy księżyca

---

## Funkcje rozszerzone

* zachmurzenie
* burza
* błyskawice
* pory roku
* zmiana długości dnia

---

## Planowane czujniki

* temperatura
* wilgotność
* natężenie światła
* poziom wody

---

Dodatkowo przewidywane:

* temperatura świetlówek LED
* temperatura wnętrza obudowy

---

Dodatkowo przewidywane:

* temperatura świetlówek LED
* temperatura wnętrza obudowy

---

## Komunikacja

* WiFi
* Bluetooth
* MQTT

---

## Sterownik główny

Planowany:

ESP32

---

## Elementy sterujące i serwisowe

Planowane:

* główny przełącznik kołyskowy POWER

* przycisk wielofunkcyjny

Funkcje przycisku:

- reset urządzenia
- wejście w tryb serwisowy
- przywracanie ustawień fabrycznych

Cel:

Umożliwienie podstawowej obsługi urządzenia bez konieczności korzystania z AquaCore.

---

## Aktualizacje

Obsługa OTA.

Aktualizacja po zatwierdzeniu przez użytkownika.

---

## Złącze serwisowe

Planowane:

Zewnętrzne złącze USB-C.

Przeznaczenie:

* programowanie urządzenia
* diagnostyka
* aktualizacja firmware
* funkcje serwisowe

Cel:

Możliwość obsługi urządzenia bez konieczności otwierania obudowy.

---

## Identyfikacja urządzenia

Podczas identyfikacji migają wyłącznie diody statusowe.

Nie migocze główne oświetlenie.

Powód:

Ograniczenie stresu zwierząt.

---

## Identyfikacja urządzenia

Podczas identyfikacji wykorzystywana jest wyłącznie jedna dioda RGB LED.

Nie migocze główne oświetlenie.

Powód:

Ograniczenie stresu zwierząt.

Dioda RGB odpowiada za:

* sygnalizację stanu urządzenia
* tryb serwisowy
* ostrzeżenia i błędy
* aktualizacje OTA
* identyfikację urządzenia

Cel:

Zmniejszenie ilości elementów na obudowie oraz ujednolicenie standardu sygnalizacji wszystkich urządzeń SBS.

---

# 2. SBS LAB

Typ:

Laboratorium analizy parametrów wody.

Status:

Koncepcja.

---

## Przeznaczenie

Automatyzacja wykonywania testów akwarystycznych.

---

## Założenia

Użytkownik:

* pobiera próbkę
* umieszcza ją w słoiczku
* zakłada kapsułkę z odczynnikami
* uruchamia test

---

## Zadania urządzenia

* mieszanie próbki
* odmierzanie czasu reakcji
* analiza koloru
* przesłanie wyniku do AquaCore

---

## System pomiarowy

Komora pomiarowa z własnym źródłem światła.

Planowane:

* białe światło referencyjne
* zamknięta komora pomiarowa

Cel:

Wyeliminowanie wpływu oświetlenia otoczenia.

---

## Analiza kolorów

Planowana analiza oparta o:

* profile producentów testów
* cyfrowe palety przejść kolorystycznych

Nie tylko odczyt kilku kolorów referencyjnych.

---

## Obsługiwani producenci (plan)

* Zoolek
* JBL
* Sera
* Aquaforest
* Salifert
* inni

---

## Czyszczenie

Po zakończeniu testu:

* opróżnienie słoiczka
* mycie
* osuszenie

wykonuje użytkownik.

---

# 3. AquaCore

Typ:

Centralny system operacyjny SBS.

Status:

Projektowanie.

---

## Zadania

* zarządzanie użytkownikami
* zarządzanie urządzeniami
* zarządzanie bazą danych
* harmonogramy
* automatyzacje
* komunikacja MQTT

---

# 4. AquaCore UI

Typ:

Interfejs użytkownika.

Status:

Projektowanie.

---

## Dostęp

* komputer
* tablet
* telefon

---

## Funkcje

* konfiguracja ekosystemów
* konfiguracja urządzeń
* wykresy
* alarmy
* raporty
* historia pomiarów

---

# 5. NAIDA

Typ:

Cyfrowy asystent AI.

Status:

Projektowanie.

---

## Zadania

* analiza parametrów
* analiza zdjęć
* analiza filmów
* analiza trendów
* edukacja użytkownika

---

## Zasada działania

NAIDA nie podejmuje decyzji za użytkownika.

Przedstawia:

* rekomendacje
* możliwe przyczyny
* poziom pewności

---

# 6. SBS Cloud

Typ:

Usługa chmurowa.

Status:

Wizja rozwojowa.

---

## Zadania

* przechowywanie danych użytkowników
* synchronizacja urządzeń
* kopie zapasowe
* aktualizacje

---

## Cel

Oddzielenie danych użytkowników od prywatnego serwera NAS właściciela projektu.

---

# 7. Przyszłe urządzenia SBS

Status:

Pomysły do dalszego rozwoju.

Możliwe urządzenia:

* sterownik filtracji
* sterownik CO₂
* automatyczny dozownik
* stacja pogodowa
* system awaryjnego zasilania
* inteligentne gniazdka
* kolejne moduły SBS

---

# Wspólne założenia dla wszystkich urządzeń SBS

1. Dobrostan zwierząt ma najwyższy priorytet.

2. Urządzenia są wykonawcami poleceń.

3. Logika systemu znajduje się w AquaCore.

4. Analiza znajduje się w NAIDZIE.

5. Komunikacja oparta o MQTT.

6. Obsługa OTA.

7. Możliwość ręcznego rollbacku firmware.

8. Automatyczne wykrywanie urządzeń przez AquaCore.

9. Praca lokalna nawet przy braku Internetu.

10. Maksymalne uproszczenie obsługi użytkownika.

11. Jedna dioda RGB LED jako standard sygnalizacji urządzeń SBS.

12. Zewnętrzne złącze USB-C do celów serwisowych i aktualizacji.

13. Obecność głównego wyłącznika POWER.

14. Obecność przycisku wielofunkcyjnego:

- reset urządzenia
- tryb serwisowy
- przywracanie ustawień fabrycznych

15. Maksymalne ograniczenie ilości elementów na obudowie.

16. Projektowanie z myślą o łatwym serwisie i przyszłej rozbudowie.

Koniec dokumentu.
