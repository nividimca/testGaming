# BACKLOG TECNICO

## Regole backlog

- ordine strettamente prioritario
- task scritti in forma eseguibile
- niente scope extra fuori MVP
- ogni task deve produrre un risultato verificabile

## P0 - Chiusura Fase 2

### T1 - Scaffold progetto Godot 4.x

Obiettivo:
Creare il progetto Godot minimo versionato e apribile da zero.

Deliverable:

- `project.godot`
- cartelle `src/`
- scena principale bootstrap
- `.gitignore` aggiornato per Godot

Acceptance:

- il repo contiene un progetto Godot 4.x riconoscibile
- `main_scene` e' configurata
- la struttura cartelle e naming seguono il TDD

### T2 - Autoload core

Obiettivo:
Introdurre `GameManager` e `InputManager` come autoload minimi.

Deliverable:

- `src/autoload/game_manager.gd`
- `src/autoload/input_manager.gd`
- registrazione autoload in `project.godot`

Acceptance:

- `GameManager` gestisce almeno `boot`, `playing`, `victory`, `game_over`
- `InputManager` espone `move_vector` e `fire_pressed`
- nessun actor legge input diretto fuori da `InputManager`

### T3 - Entity base MVP

Obiettivo:
Creare le scene e gli script minimi per `Player`, `Boss`, `Bullet`.

Deliverable:

- `player.tscn` + `player.gd`
- `boss.tscn` + `boss.gd`
- `bullet.tscn` + `bullet.gd`

Acceptance:

- `Player` si muove nel playfield
- `Player` genera bullet player
- `Boss` riceve danno dai bullet player
- `Bullet` supporta faction e cleanup runtime

### T4 - PatternSystem MVP

Obiettivo:
Separare il firing del boss in un sistema dedicato.

Deliverable:

- `pattern_system.tscn`
- `pattern_system.gd`

Acceptance:

- il boss non gestisce direttamente il proprio pattern
- `PatternSystem` genera bullet boss con cadenza costante
- il pattern puo' essere modificato senza cambiare `Boss`

### T5 - Wiring run minima

Obiettivo:
Collegare scene, manager e collisioni in una run MVP eseguibile.

Deliverable:

- `main.tscn`
- `main.gd`
- registrazione runtime di player e boss nel `GameManager`

Acceptance:

- il gioco parte in stato `playing`
- player, boss e pattern system sono presenti in scena
- collisioni player/boss/bullet funzionano nel caso base
- la run termina in `victory` o `game_over`

### T6 - Build preparation Windows

Obiettivo:
Preparare il repo a una futura build Windows senza rifare struttura o config.

Deliverable:

- `export_presets.cfg`
- cartella `build/windows/`
- `.docs/05_release/build_process.md` allineato

Acceptance:

- il preset Windows esiste in forma base
- i passaggi di export locale sono documentati
- restano espliciti i prerequisiti esterni: engine installato e templates export

## P1 - Primo sprint Fase 3

### T7 - Tuning player movement

Obiettivo:
Rendere i parametri di movimento facilmente iterabili senza cambiare architettura.

Acceptance:

- velocita' e limiti sono esportati o centralizzati
- nessuna modifica alla catena input astratto

### T8 - Tuning combat loop MVP

Obiettivo:
Rifinire fire rate, hp e cadence del pattern mantenendo la base tecnica invariata.

Acceptance:

- parametri gameplay basilari modificabili rapidamente
- nessun nuovo sistema fuori MVP

## Stato atteso dopo Fase 2

Se i task `T1`-`T6` sono completati, la Fase 2 puo' essere dichiarata chiusa e il progetto puo' entrare in implementazione iterativa di Fase 3.
