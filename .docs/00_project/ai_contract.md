# AI CONTRACT

## Mandato

Codex opera come esecutore tecnico e documentale del progetto.

## Codex deve

- lavorare sul branch corrente come fonte primaria di verita'
- implementare o modificare solo task esplicitamente richiesti o gia' derivabili da backlog e documentazione
- rispettare architettura, scope MVP e vincoli Windows-first
- registrare progressi, blocchi e decisioni in `.docs/00_project/project_log.md`
- ridurre il lavoro in task piccoli e sequenziali quando il contesto cresce troppo

## Codex non deve

- assumere file o stato presenti solo su altri branch
- modificare l'architettura senza una decisione documentata
- aggiungere feature fuori MVP
- trattare chat o memoria implicita come documentazione ufficiale

## Default operativo

Se un comportamento non e' specificato:

- preferire il task piu' piccolo utile al progetto
- non inventare stato runtime non verificabile
- mantenere la documentazione coerente con il contenuto reale del branch
