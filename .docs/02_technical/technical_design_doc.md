# TECHNICAL DESIGN DOC

## Scopo

Definire il bootstrap tecnico minimo del progetto in modo che il branch corrente possa passare da baseline documentale a primo runtime `Godot 4.x` coerente con l'MVP.

## Stato attuale del branch

Sul branch corrente la parte tecnica e' documentata ma non ancora committata come progetto Godot eseguibile.
Questo documento descrive quindi l'architettura prevista e i gate del bootstrap, non uno stato runtime gia' presente nel repository.

## Stack

- Engine: `Godot 4.x`
- Linguaggio: `GDScript`
- Target primario: `Windows (Steam)`
- Vincolo secondario: `mobile-ready` solo a livello architetturale

## Obiettivo tecnico di Fase 2

Ottenere un progetto apribile da zero che permetta di verificare:

- scena principale caricabile
- loop base di gameplay
- input astratto
- collisioni minime
- restart minimo
- preparazione export Windows

## Architettura prevista

### Autoload

- `GameManager`
  - gestisce stato globale della run
  - espone stati minimi come `BOOT`, `PLAYING`, `GAME_OVER`, `VICTORY`
  - conserva riferimenti runtime essenziali

- `InputManager`
  - unico punto di lettura dell'input
  - traduce input Windows in comandi gameplay
  - mantiene compatibilita' futura con controller o touch mapping

### Runtime entities e sistemi

- `Player`
  - movimento
  - firing
  - ricezione danno

- `Boss`
  - presenza del nemico principale
  - ricezione danno
  - esposizione dello stato utile ai pattern

- `Bullet`
  - proiettile generico con owner, direzione, velocita' e danno

- `PatternSystem`
  - responsabilita' esclusiva del firing del boss
  - nessuna logica boss-specifica dispersa altrove se non strettamente necessaria

## Struttura tecnica prevista

Il progetto deve restare scene-based.

Struttura attesa una volta iniziata l'implementazione:

```txt
project.godot
src/
  autoload/
  scenes/
  entities/
  systems/
  data/
build/windows/
export_presets.cfg
```

## Regole architetturali

- logica gameplay separata dall'input
- nessuna entity legge input diretto fuori da `InputManager`
- nessuna dipendenza desktop-only hard nel core gameplay
- niente over-engineering o sistemi prematuri
- niente feature extra fuori MVP

## Input Strategy

- keyboard come baseline
- controller supportabile senza cambiare il core loop
- touch non implementato, ma reso possibile dall'astrazione input
- UI e gameplay non devono dipendere da hover o mouse-only

## UI Strategy

Per il bootstrap serve solo UI minima di verifica:

- eventuale schermata iniziale semplice
- HUD minimo leggibile
- feedback di game over o vittoria
- restart verificabile

Non e' richiesta UI finale di produzione.

## Save / Logging Strategy

- nessun save system completo nell'MVP iniziale
- logging limitato a debug tecnico e verifiche locali
- ogni bug rilevante va registrato in `.docs/04_testing/bug_log.md`

## Windows Build Goal

Il bootstrap tecnico e' considerato valido quando:

- il progetto si apre da zero in `Godot 4.x`
- esiste una `main_scene` configurata
- il preset Windows e' predisposto
- l'output locale puo' essere instradato in `build/windows/`

## Constraints

- architettura non modificabile senza decisione esplicita
- input sempre astratto
- focus `Windows-first`
- mobile-readiness solo architetturale
- backlog tecnico da eseguire un task alla volta

## Definition of Done Fase 2

La Fase 2 e' chiudibile quando:

- esiste `project.godot`
- esiste una scena principale minimale
- player, boss, bullet e pattern system sono almeno bootstrapati
- collisioni e restart minimi sono verificabili
- il percorso di export Windows e' documentato e testabile localmente
