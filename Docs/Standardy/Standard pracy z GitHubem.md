# Standard pracy z GitHubem

Status: Obowiązujący standard pracy dla projektu Smart BioSystem.

Repozytorium GitHub:

- `https://github.com/gregorro96-ux/Smart-BioSystem.git`

Główna gałąź robocza:

- `development`

Model pracy:

- lokalne repozytorium Git na NAS,
- zdalne repozytorium GitHub jako `origin`,
- synchronizacja przez `origin/development`.

GitHub jest zdalną kopią historii projektu i punktem synchronizacji.

GitHub nie jest elementem runtime SBS ani AquaCore OS.

## Kiedy robić commit lokalny

Commit lokalny wykonujemy wtedy, gdy zmiana tworzy zamkniętą, sprawdzoną całość.

Commit powinien powstać po:

- zakończeniu jednego konkretnego zadania,
- poprawnym sprawdzeniu `git status`,
- przejrzeniu `git diff`,
- selektywnym dodaniu plików przez `git add <plik>`,
- sprawdzeniu `git diff --cached`,
- wykonaniu dostępnych testów albo kontroli spójności.

Przykłady dobrych momentów na commit:

- zakończona aktualizacja jednego obszaru dokumentacji,
- dodana jedna komenda CLI,
- poprawiony jeden błąd,
- przygotowany jeden mały moduł,
- uporządkowana jedna grupa plików.

Nie należy robić commita, gdy:

- zmiana jest w połowie pracy,
- nie wiadomo jeszcze, czy działa,
- w stagingu są przypadkowe pliki,
- w zmianach znajdują się sekrety, hasła, tokeny lub prywatna konfiguracja,
- zakres commita miesza wiele niezwiązanych tematów.

## Kiedy robić push

Push wykonujemy po lokalnym commicie, gdy zmiana jest gotowa do zapisania w zdalnej historii GitHub.

Push powinien być wykonany po:

- sprawdzeniu `git status`,
- potwierdzeniu, że gałąź jest `development`,
- sprawdzeniu ostatniego commita przez `git log -1 --oneline`,
- upewnieniu się, że commit nie zawiera sekretów,
- upewnieniu się, że working tree jest czysty albo że pozostałe zmiany są świadomie zostawione lokalnie.

Standardowa komenda:

```powershell
git push
```

Jeżeli lokalna gałąź nie śledzi jeszcze zdalnej gałęzi, pierwszy push wykonuje się przez:

```powershell
git push -u origin development
```

Po pushu należy sprawdzić:

```powershell
git status
```

Oczekiwany stan po pełnej synchronizacji:

```text
Your branch is up to date with 'origin/development'.
nothing to commit, working tree clean
```

## Jak opisywać commity

Preferowany format:

```text
typ(zakres): krótki opis
```

Opis powinien być krótki, konkretny i po polsku.

Typowe typy commitów:

- `docs` - dokumentacja,
- `feat` - nowa funkcja,
- `fix` - poprawka błędu,
- `test` - testy,
- `refactor` - refaktoryzacja bez zmiany zachowania,
- `chore` - prace porządkowe i techniczne,
- `config` - konfiguracja bez sekretów.

Przykłady:

```text
docs(docs): uporządkowano strukturę dokumentacji
feat(core): dodano bootowalny rdzeń AquaCore OS
fix(cli): poprawiono diagnostykę logów na SMB
config(git): zaktualizowano reguły ignorowania sekretów
```

Zasady:

- jeden commit opisuje jeden temat,
- opis nie powinien być ogólny typu `update`, `zmiany`, `poprawki`,
- nie wpisujemy sekretów, nazw prywatnych kont ani haseł w treści commita,
- nie łączymy zmian kodu, dokumentacji i porządków, jeśli nie wynikają z tego samego zadania.

## Jak nie wrzucać sekretów

Sekrety nigdy nie trafiają do repozytorium.

Za sekrety uznaje się między innymi:

- hasła,
- tokeny,
- klucze prywatne,
- dane dostępowe,
- prywatne pliki `.env`,
- prywatne konfiguracje połączeń,
- dane produkcyjne,
- pliki lokalne z loginami.

Obowiązkowe zasady:

1. Nie otwieraj i nie kopiuj treści plików z hasłami do dokumentacji.
2. Przed commitem sprawdź `git status`.
3. Przed stagingiem sprawdź `git diff`.
4. Dodawaj pliki selektywnie przez `git add <plik>`.
5. Po stagingu sprawdź `git diff --cached`.
6. Sprawdź listę staged plików:

```powershell
git diff --cached --name-only
```

7. Jeżeli w staged znajduje się plik prywatny, usuń go ze stagingu:

```powershell
git restore --staged <plik>
```

8. Jeżeli plik powinien być zawsze lokalny, dopisz go do `.gitignore`.

Foldery i pliki z danymi dostępowymi muszą pozostawać poza commitem.

## Przed każdym większym etapem

Przed rozpoczęciem większego etapu pracy wykonujemy kontrolę startową:

```powershell
git status
git branch --show-current
git log -3 --oneline
```

Należy potwierdzić:

- aktywna gałąź to `development`,
- wiadomo, czy lokalna gałąź jest zsynchronizowana z `origin/development`,
- working tree jest czysty albo świadomie zawiera rozpoczęte zmiany,
- nie ma przypadkowych plików prywatnych,
- wiadomo, jaki był ostatni commit.

Przed etapem technicznym należy dodatkowo sprawdzić dokumentację zasad i ograniczeń:

- `Docs/AGENTS.md`,
- odpowiedni dokument modułu,
- decyzje projektowe,
- aktualny dziennik prac.

Przed etapem wymagającym zmian w bazie danych, API, bezpieczeństwie, MQTT lub architekturze należy najpierw uzyskać zgodę Grzegorza.

## Standardowa kolejność pracy

1. Sprawdź stan repozytorium:

```powershell
git status
```

2. Wykonaj pracę.

3. Sprawdź zmiany:

```powershell
git diff
```

4. Dodaj pliki selektywnie:

```powershell
git add <plik>
```

5. Sprawdź staging:

```powershell
git diff --cached
git diff --cached --name-only
```

6. Wykonaj testy lub kontrolę spójności.

7. Wykonaj commit:

```powershell
git commit -m "typ(zakres): opis"
```

8. Sprawdź stan po commicie:

```powershell
git status
```

9. Wypchnij zmianę na GitHub, gdy commit ma trafić do zdalnej historii:

```powershell
git push
```

## Czego unikać

Nie używaj rutynowo:

```powershell
git add .
```

Ta komenda może przypadkowo dodać pliki lokalne, prywatne, tymczasowe albo niepowiązane z zadaniem.

Nie wykonuj pushu, gdy:

- commit nie został sprawdzony,
- testy lub kontrola spójności nie zostały wykonane,
- w historii mogą znajdować się sekrety,
- nie wiadomo, na jakiej gałęzi pracujesz,
- zmiana wymaga decyzji Grzegorza, a decyzja nie została podjęta.