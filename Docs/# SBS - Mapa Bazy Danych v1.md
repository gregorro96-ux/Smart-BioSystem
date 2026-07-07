# SBS - Mapa Bazy Danych v1

## Główna struktura

```text
users
└── ecosystems
    ├── ecosystem_diary (Pamiętnik ekosystemu, obserwacje i ważne wydarzenia)
    ├── ecosystem_events (Historia najważniejszych wydarzeń w życiu zbiornika)
    ├── feeding_log (Historia karmienia i użytych pokarmów)
    ├── water_changes (Historia podmian wody)
    ├── disease_log (Historia chorób i leczenia organizmów)
    ├── quarantine_log (Historia kwarantanny i izolacji organizmów)
    ├── breeding_log (Historia rozmnażania i tarła)
    ├── growth_log (Historia wzrostu organizmów i roślin)
    ├── livestock_events (Narodziny, zgony, zakupy i sprzedaż zwierząt)
    └── plant_events (Sadzenie, przycinki i zmiany dotyczące roślin)

species
├── species_relationships (Relacje biologiczne między gatunkami)
├── species_behaviors (Charakterystyczne zachowania gatunków)
├── species_compatibility (Zgodność i możliwość wspólnej hodowli)
└── ecosystem_requirements (Wymagania środowiskowe gatunków)

ecosystems
├── ecosystem_health (Ocena dobrostanu i kondycji ekosystemu)
├── ecosystem_scores (Punktowa ocena stabilności ekosystemu)
├── settings_history (Historia zmian ustawień i konfiguracji)
└── simulations (Symulacje wpływu zmian na ekosystem)

devices
├── device_states (Aktualne stany urządzeń)
├── device_commands (Historia i kolejka poleceń urządzeń)
├── firmware_updates (Historia aktualizacji firmware)
└── power_events (Historia zaników i powrotów zasilania)

media_files
├── photos (Zdjęcia dokumentacyjne)
├── videos (Nagrania wideo ekosystemu)
├── media_tags (Tagi i kategorie multimediów)
├── media_relations (Powiązania multimediów z innymi tabelami)
├── camera_timelapse (Zdjęcia i filmy poklatkowe)
├── image_analysis (Analiza obrazów przez NAIDĘ)
├── video_analysis (Analiza nagrań wideo przez NAIDĘ)
├── animal_activity (Aktywność i zachowania zwierząt)
├── plant_growth_analysis (Analiza wzrostu roślin)
├── behavior_patterns (Wzorce zachowań organizmów)
└── detected_events (Automatycznie wykryte zdarzenia)

users
└── knowledge_sources
    ├── knowledge_categories (Kategorie wiedzy)
    ├── knowledge_notes (Notatki użytkownika)
    ├── knowledge_library (Biblioteka wiedzy dla użytkownika)
    ├── ai_knowledge_index (Indeks wiedzy przeanalizowanej przez NAIDĘ)
    ├── knowledge_claims (Pojedyncze fakty i twierdzenia)
    ├── knowledge_conflicts (Sprzeczne informacje wymagające analizy)
    ├── knowledge_statistics (Statystyki potwierdzeń wiedzy)
    └── ai_models (Modele wiedzy i analizy NAIDY)

ecosystems
└── ai_insights
    ├── ai_decisions (Historia decyzji i uzasadnień NAIDY)
    ├── ai_claims (Wnioski i twierdzenia AI)
    ├── ai_experience (Doświadczenia i pamięć wieloletnia NAIDY)
    ├── ai_correlations (Wykryte korelacje i zależności)
    ├── ai_predictions (Prognozy i przewidywania)
    └── autonomy_levels (Poziomy autonomii działania NAIDY)

ecosystems
└── similar_ecosystems
    ├── ecosystem_clusters (Grupowanie podobnych ekosystemów)
    ├── ecosystem_comparisons (Porównania pomiędzy ekosystemami)
    ├── success_patterns (Wzorce sukcesów i pozytywnych wyników)
    └── failure_patterns (Wzorce problemów i niepowodzeń)

users
└── ecosystem_templates
    ├── ecosystem_inspirations (Inspiracje i biotopy)
    ├── ecosystem_gallery (Galeria przykładowych zbiorników)
    ├── ecosystem_difficulty (Poziomy trudności prowadzenia zbiornika)
    └── ecosystem_recommendations (Sugestie i propozycje tworzenia ekosystemów)
```
==================================================

# Historia życia

Opis:

Cyfrowa pamięć ekosystemu. Przechowuje historię wszystkich istotnych zdarzeń zachodzących w zbiorniku.

Przeznaczenie:

Budowa wieloletniej pamięci dla użytkownika oraz NAIDY.

Tabele:

- ecosystem_diary
- ecosystem_events
- feeding_log
- water_changes
- disease_log
- quarantine_log
- breeding_log
- growth_log
- livestock_events
- plant_events

Najważniejsze funkcje:

- historia karmienia
- historia podmian
- choroby i leczenie
- kwarantanna
- rozmnażanie
- wzrost organizmów
- historia roślin
- narodziny i zgony

Rola dla NAIDY:

Analiza doświadczeń i budowa pamięci wieloletniej.

==================================================

# Chemia i wyposażenie

Opis:

Przechowuje informacje o chemii, nawozach, podłożach oraz wyposażeniu biologicznym.

Przeznaczenie:

Analiza wpływu preparatów i wyposażenia na ekosystem.

Tabele:

- dosing_log
- additives
- fertilizers
- substrates
- filtration_systems

Najważniejsze funkcje:

- historia dozowania
- nawożenie
- dodatki chemiczne
- podłoża
- filtracja

Rola dla NAIDY:

Budowa zależności pomiędzy chemią a stanem ekosystemu.

==================================================

# Gatunki

Opis:

Biologiczna encyklopedia SBS.

Przeznaczenie:

Przechowywanie wymagań i zachowań organizmów.

Tabele:

- species_database
- species_relationships
- species_behaviors
- species_compatibility
- ecosystem_requirements

Najważniejsze funkcje:

- relacje międzygatunkowe
- zgodność gatunków
- zachowania
- wymagania środowiskowe

Rola dla NAIDY:

Budowa Biological Knowledge Graph.

==================================================

# NAIDA

Opis:

Pamięć oraz procesy analityczne sztucznej inteligencji.

Przeznaczenie:

Przechowywanie doświadczeń, decyzji i przewidywań.

Tabele:

- ai_insights
- ai_decisions
- ai_claims
- ai_experience
- ai_correlations
- ai_predictions
- autonomy_levels

Najważniejsze funkcje:

- decyzje AI
- pamięć doświadczeń
- korelacje
- przewidywania
- poziomy autonomii

Rola dla NAIDY:

Cyfrowa biolog i opiekunka ekosystemów.

==================================================

# Biblioteka wiedzy

Opis:

Lokalna baza wiedzy użytkownika i NAIDY.

Przeznaczenie:

Gromadzenie i analiza wiedzy.

Tabele:

- knowledge_sources
- knowledge_categories
- knowledge_notes
- knowledge_library
- ai_knowledge_index
- knowledge_claims
- knowledge_conflicts
- knowledge_statistics
- ai_models

Źródła:

- książki
- PDF
- e-booki
- strony internetowe
- artykuły naukowe
- własne notatki

Rola dla NAIDY:

Ciągłe uczenie się.

==================================================

# Cyfrowy bliźniak

Opis:

Wirtualny odpowiednik rzeczywistego ekosystemu.

Przeznaczenie:

Symulacja i przewidywanie zmian.

Tabele:

- ecosystem_health
- settings_history
- simulations
- ecosystem_scores

Najważniejsze funkcje:

- ocena zdrowia
- historia ustawień
- symulacje
- ocena stabilności

Rola dla NAIDY:

Przewidywanie skutków zmian.

==================================================

# Globalna NAIDA

Opis:

Uczenie zbiorowe i analiza podobnych ekosystemów.

Przeznaczenie:

Wymiana doświadczeń pomiędzy podobnymi zbiornikami.

Tabele:

- similar_ecosystems
- ecosystem_clusters
- ecosystem_comparisons
- success_patterns
- failure_patterns

Najważniejsze funkcje:

- porównania
- wykrywanie podobieństw
- analiza sukcesów
- analiza błędów

Rola dla NAIDY:

Budowa globalnej pamięci doświadczeń.

==================================================

# Kreator ekosystemów

Opis:

Pomoc w projektowaniu nowych zbiorników.

Przeznaczenie:

Inspiracje i wsparcie użytkownika.

Tabele:

- ecosystem_templates
- ecosystem_inspirations
- ecosystem_gallery
- ecosystem_difficulty
- ecosystem_recommendations

Najważniejsze funkcje:

- galerie zbiorników
- inspiracje
- poziomy trudności
- rekomendacje

Rola dla NAIDY:

Pomoc początkującym użytkownikom.

==================================================

# Computer Vision

Opis:

Moduł analizy obrazów i filmów.

Przeznaczenie:

Obserwacja organizmów i zmian zachodzących w ekosystemie.

Tabele:

- camera_snapshots
- image_analysis
- video_analysis
- animal_activity
- plant_growth_analysis
- behavior_patterns
- detected_events

Najważniejsze funkcje:

- analiza zdjęć
- analiza filmów
- aktywność zwierząt
- wzrost roślin
- rozpoznawanie zachowań
- automatyczne wykrywanie zdarzeń

Rola dla NAIDY:

Oczy systemu.

==================================================

# System

Opis:

Moduł odpowiedzialny za stan techniczny AquaCore OS.

Przeznaczenie:

Monitorowanie urządzeń i bezpieczeństwa.

Tabele:

- device_states
- device_commands
- firmware_updates
- power_events
- backups
- restore_history

Najważniejsze funkcje:

- stan urządzeń
- historia poleceń
- aktualizacje
- awarie zasilania
- kopie zapasowe
- przywracanie systemu

Rola dla NAIDY:

Zapewnienie stabilności i niezawodności.

==================================================

# Multimedia

Opis:

Dokumentacja wizualna ekosystemu.

Przeznaczenie:

Przechowywanie materiałów multimedialnych.

Tabele:

- photos
- videos
- media_tags
- media_relations
- camera_timelapse

Najważniejsze funkcje:

- zdjęcia
- filmy
- tagowanie
- powiązania multimediów
- timelapse

Rola dla NAIDY:

Źródło danych dla Computer Vision.

==================================================

# Community

Opis:

Społeczność użytkowników SBS.

Przeznaczenie:

Wymiana doświadczeń i wiedzy.

Tabele:

- community_posts
- community_comments
- chat_messages
- shared_experiences

Najważniejsze funkcje:

- posty
- komentarze
- rozmowy użytkowników
- dzielenie się doświadczeniami

Rola dla NAIDY:

Analiza wiedzy społeczności i wyszukiwanie podobnych przypadków biologicznych.

==================================================