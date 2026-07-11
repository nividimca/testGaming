# FASE 2 - SETTIMANA 1

## Obiettivo

Trasformare la baseline documentale del branch in un bootstrap tecnico minimo `Godot 4.x` coerente con l'MVP.

## Execution Mode

- task uno alla volta
- nessuna feature extra
- nessun cambio architetturale
- ogni chiusura task aggiorna backlog e project log

## Input di riferimento

- `.docs/00_project/project_charter.md`
- `.docs/01_game_design/game_one_pager.md`
- `.docs/01_game_design/mvp_scope.md`
- `.docs/02_technical/technical_design_doc.md`
- `.docs/02_technical/backlog_technical.md`

## Sequenza raccomandata

### Step 1 - Bootstrap progetto

Output:

- `project.godot`
- scena principale minimale
- struttura cartelle iniziale

Gate:

- il progetto si apre da zero

### Step 2 - Autoload minimi

Output:

- `GameManager`
- `InputManager`

Gate:

- gli stati di run sono definiti
- nessuna entity deve leggere input diretto

### Step 3 - Loop base

Output:

- `Player`
- `Bullet`
- firing minimo
- clamp viewport

Gate:

- il player si muove e spara in modo leggibile

### Step 4 - Nemico e pressione

Output:

- `Boss`
- `PatternSystem`

Gate:

- il boss genera almeno un pattern offensivo verificabile

### Step 5 - Chiusura run

Output:

- collisioni minime
- danno minimo
- game over o vittoria
- restart

Gate:

- la run ha un esito chiaro e riavviabile

### Step 6 - Build path

Output:

- preset Windows o percorso equivalente documentato
- directory output prevista

Gate:

- il percorso di export e' verificabile localmente

## Definition of Done settimana

La settimana e' chiusa se:

- esiste un bootstrap tecnico apribile
- il loop base e' verificabile
- restart minimo presente
- build Windows locale pronta o bloccata solo da prerequisiti macchina
- note QA e bug log pronti a ricevere i primi esiti

## Blocchi possibili

- Godot non installato
- export templates non installati
- tempo insufficiente per chiudere tutti i task P1

## Regola di fallback

Se il bootstrap completo non entra nella settimana:

- chiudere almeno `T-001` -> `T-008`
- rinviare l'export Windows alla prima iterazione successiva
