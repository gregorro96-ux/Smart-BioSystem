ESP32 S3 DevKit
PCA9685
BME280
WS2815
74AHCT125
INA226
RGB+CCT

Schemat połączeń
GPIO
Adresy I2C
Przypisanie kanałów PWM

==================================================
Elementy użytkownika
==================================================

Przełącznik kołyskowy POWER

Przycisk wielofunkcyjny

Funkcje:

- reset urządzenia
- tryb serwisowy
- przywracanie ustawień fabrycznych

Zewnętrzne złącze USB-C

Przeznaczenie:

- programowanie
- diagnostyka
- aktualizacja firmware

Jedna dioda RGB LED

Przeznaczenie:

- sygnalizacja statusu
- identyfikacja urządzenia
- tryb serwisowy
- ostrzeżenia i błędy

==================================================
Planowane czujniki
==================================================

BME280

DS18B20 (Tube 1-6)
Temperatura świetlówek LED

DS18B20
Temperatura wnętrza obudowy

ACS758LCB-050B

Pomiar całej lampy:

- prąd
- moc całkowita
- zużycie energii

(V2.0)

INA226

Pomiar pojedynczych świetlówek:

- napięcie
- prąd
- moc

(V2.0+)

Cel:

Diagnostyka poszczególnych świetlówek i analiza przez NAIDĘ.

==================================================
Diagnostyka
==================================================

V1.0

DS18B20

- temperatura świetlówek
- temperatura wnętrza obudowy

V2.0

ACS758LCB-050B

- całkowity pobór prądu lampy
- moc całkowita
- zużycie energii

V2.0+

INA226

Dla każdej świetlówki:

- napięcie
- prąd
- moc

Możliwa analiza:

- uszkodzenie LED
- spadek wydajności
- przegrzewanie
- awaria chłodzenia
- starzenie świetlówek

Analiza realizowana przez NAIDĘ.

==================================================
Solar Ecosystem Hardware v1.0
==================================================

Do opracowania:

- lista zakupów
- pinouty
- standard kolorów przewodów
- standard AWG16 i AWG20
- numeracja Tube 1-6
- numeracja Module 1-6
- organizacja wiązek przewodów
- rękawy PET
- przelotki gumowe
- przepusty M20
- routing PCB

==================================================
Pierwszy etap projektu
==================================================

Pompa nawozowa SBS

Cel:

Zdobycie doświadczenia z ESP32, firmware, harmonogramami i automatyką przed budową lampy.