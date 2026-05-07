# TECHNICAL DESIGN DOC

## Purpose

Questo documento definisce il perimetro tecnico minimo per chiudere la Fase 2:

- trasformare il repository in un progetto `Godot 4.x + GDScript` avviabile da zero
- fissare una struttura coerente con l'MVP documentato
- mantenere `Windows (Steam)` come target primario
- preservare mobile-readiness solo a livello architetturale

La Fase 2 non include contenuto finale, polish, UI completa, audio, save system o pipeline Steam completa.

## Phase 2 Exit Criteria

La Fase 2 e' considerata chiusa quando sono soddisfatti tutti i punti seguenti:

1. esiste un progetto Godot 4.x versionabile nel repo
2. il progetto si apre da zero con `project.godot` valido
3. sono presenti gli autoload `GameManager` e `InputManager`
4. esistono scene e script minimi per `Player`, `Boss`, `Bullet`, `PatternSystem`
5. il gameplay loop minimo supporta:
   - movimento player
   - firing player gestito tramite `InputManager`
   - presenza del boss
   - pattern di bullet del boss
   - collisioni minime player/boss/bullet
6. la struttura del progetto e' compatibile con una futura build Windows locale
7. backlog tecnico e processo build sono riscritti in forma operativa

## Technical Scope

### In Scope

- scaffold del progetto Godot
- naming e cartelle tecniche di base
- wiring scene-based con autoload
- input astratto centralizzato
- loop MVP minimo eseguibile
- documentazione tecnica sufficiente per iniziare la Fase 3

### Out of Scope

- UI finale
- effetti VFX/SFX
- menu, settings, rebinding avanzato
- salvataggi
- multi-boss o contenuti extra
- porting mobile
- integrazione Steamworks

## Stack

- Engine: `Godot 4.x`
- Language: `GDScript`
- Primary target: `Windows (Steam)`
- Secondary constraint: mobile-ready only at architectural level

## Architecture

L'architettura fissata dal progetto resta invariata:

- progetto scene-based
- manager globali via autoload
- logica gameplay separata dall'input
- nessuna entity legge input diretto fuori da `InputManager`

### Core Systems

#### `GameManager` (autoload)

Responsabilita':

- tenere lo stato di run (`boot`, `playing`, `victory`, `game_over`)
- registrare riferimenti runtime a `Player` e `Boss`
- esporre helper minimi per abilitare o fermare il gameplay
- ricevere notifiche di morte player o sconfitta boss

Non responsabilita':

- leggere input
- gestire pattern di fuoco
- muovere entity

#### `InputManager` (autoload)

Responsabilita':

- leggere input desktop in un solo punto
- trasformare input grezzo in comandi astratti
- esporre comandi di movimento e fuoco al gameplay
- mantenere compatibilita' con un futuro adapter touch

Non responsabilita':

- muovere direttamente il player
- spawnare proiettili
- contenere regole di gameplay

#### `Player`

Responsabilita':

- leggere solo comandi astratti da `InputManager`
- applicare movimento nel playfield
- gestire cadenza di fuoco del player
- subire danno dai bullet del boss

#### `Boss`

Responsabilita':

- esistere come target principale della scena
- ricevere danno dai bullet del player
- notificare `GameManager` quando sconfitto
- poter referenziare dati esterni minimi del boss, come i dialoghi, senza hardcodarli nella logica gameplay

#### `Bullet`

Responsabilita':

- movimento lineare
- distinzione di ownership/faction (`player`, `boss`)
- collisione e autodistruzione

#### `PatternSystem`

Responsabilita':

- gestire il rate di spawn dei bullet del boss
- mantenere pattern facilmente sostituibili senza cambiare `Boss`

#### `BossDialogueResource`

Responsabilita':

- contenere i beat di dialogo di un boss in forma data-driven
- separare testo e struttura di dialogo dalla logica di combattimento
- supportare il beat addizionale `pre_forced_death` del boss tutorial senza forzare sistemi narrativi piu' grandi

## Folder Structure

Struttura minima prevista:

```text
project.godot
export_presets.cfg
src/
  autoload/
    game_manager.gd
    input_manager.gd
  scenes/
    main/
      main.tscn
      main.gd
  entities/
    player/
      player.tscn
      player.gd
    boss/
      boss.tscn
      boss.gd
    bullet/
      bullet.tscn
      bullet.gd
  systems/
    pattern_system/
      pattern_system.tscn
      pattern_system.gd
  data/
    dialogue/
      boss_dialogue_resource.gd
      bosses/
        tutorial_boss_dialogue.tres
```

## Dialogue Data

Per i dialoghi dei boss il progetto adotta, da questo punto in poi, una struttura minima data-driven basata su `Resource`.

Regole:

- i dialoghi non vanno hardcodati in `boss.gd`, `main.gd` o `PatternSystem`
- ogni boss puo' avere un file `.tres` dedicato sotto `src/data/dialogue/bosses/`
- la struttura minima prevista per l'MVP e':
  - `opening`
  - `pre_forced_death`
  - `phase_2_transition`
  - `phase_3_transition`
  - `final_line`

Nota:

- `pre_forced_death` e' usato dal boss tutorial
- per i boss futuri puo' restare vuoto se non serve
- questa scelta introduce solo il layer dati, non obbliga ancora a implementare un sistema dialoghi runtime completo

## Scene Composition

`main.tscn` e' il bootstrap della run MVP e contiene:

- `Player`
- `Boss`
- `PatternSystem`

`Bullet` viene instanziato runtime da `Player` e `PatternSystem`.

## Gameplay Loop Minimo Fase 2

Loop richiesto per considerare la base tecnica eseguibile:

1. il progetto avvia `main.tscn`
2. `GameManager` entra in stato `playing`
3. `InputManager` produce un vettore di movimento astratto
4. `Player` si muove nel playfield e spara a intervalli costanti
5. `PatternSystem` genera bullet del boss a intervalli costanti
6. `Bullet` gestisce movimento, collisione e cleanup
7. `Boss` puo' essere danneggiato dai bullet del player
8. `Player` puo' essere colpito dai bullet del boss
9. `GameManager` chiude la run con `victory` o `game_over`

## Input Strategy

Vincoli permanenti:

- nessuna entity legge input diretto dal sistema operativo
- `Player` usa soltanto API pubbliche di `InputManager`
- il mapping desktop puo' essere sostituito in futuro da touch adapter senza cambiare la logica del player

Comandi astratti minimi:

- `move_vector`
- `fire_pressed`

Mapping desktop iniziale:

- movimento: `WASD` e frecce
- fuoco: `Space`
- supporto controller: previsto ma non obbligatorio in Fase 2

## Collision Model

Per la Fase 2 e' sufficiente un modello semplice con `Area2D`:

- `Player` riceve hit da bullet con faction `boss`
- `Boss` riceve hit da bullet con faction `player`
- i bullet si distruggono all'impatto o fuori schermo

Questo approccio riduce complessita' e lascia aperta l'evoluzione futura verso hitbox piu' sofisticate.

## Windows-First Rules

- il progetto deve essere avviabile localmente su ambiente desktop
- il preset di export Windows deve essere presente o preparabile senza ristrutturare il repo
- il core gameplay non deve assumere input mouse-only
- nessun codice core deve dipendere da API desktop esclusive non astratte

## Mobile-Readiness Rules

La mobile-readiness resta solo architetturale:

- `InputManager` resta il solo punto di contatto per l'input
- layout scene e logica non dipendono da hover o cursor lock
- nessuna scelta di Fase 2 deve bloccare un futuro adapter touch

## Build Preparation

Deliverable minimi Fase 2 per build locale:

- `project.godot`
- `main_scene` configurata
- `export_presets.cfg` con preset Windows base
- struttura cartelle per output build (`build/windows/`)
- `.gitignore` aggiornato per artefatti Godot locali

Nota: la generazione reale dell'eseguibile richiede Godot installato e export templates disponibili sulla macchina locale.

## Risks / Known Gaps

- senza binario Godot installato nell'ambiente corrente non e' possibile validare qui l'avvio reale del progetto
- il preset Windows puo' essere preparato, ma l'export effettivo dipende dai template locali
- il loop MVP resta volutamente minimale e non copre bilanciamento o UX finale

## Task — Boss Base

Obiettivo:
Implementare un boss che rappresenta il black humor

Vincoli:

* Non è un nemico generico
* Deve avere comportamento attivo (pattern)

Acceptance:

* Il boss genera pressione sul player
* Il boss non è passivo
