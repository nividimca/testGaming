# testGaming

`testGaming` e' un progetto game-dev in `Godot 4.x + GDScript` per un gioco arcade boss-based, con target primario `Windows` e mobile-readiness mantenuta solo a livello architetturale.

Il conflitto centrale del progetto e':

**Player vs Black Humor**

Il loop MVP attuale e' semplice:

`muoviti -> schiva -> colpisci -> sopravvivi`

## Cosa contiene oggi

Il repository contiene:

- documentazione di progetto in `.docs/`
- bootstrap tecnico Godot del MVP
- una vertical slice in corso centrata sul boss tutorial
- struttura minima per dialoghi boss data-driven

Lo scope MVP resta intenzionalmente stretto:

- movimento
- shooting
- boss
- pattern

## Stato del progetto

La base tecnica del progetto e' gia' presente:

- progetto `Godot 4.x` apribile da `project.godot`
- autoload `GameManager` e `InputManager`
- scena principale con `Player`, `Boss`, `Bullet` e `PatternSystem`
- preset di export per build `Windows`

La fase attuale e' la rifinitura della vertical slice del boss tutorial, con attenzione a:

- onboarding iniziale con morte forzata leggibile
- boss a tre fasi
- dialoghi runtime minimi del boss
- HUD e stati di run verificabili

## Progetto fatto con Codex

Questo progetto e' sviluppato interamente con Codex.

Questa regola non vale solo per il branch corrente: vale per l'intero repository e per tutti i rami, salvo eventuali eccezioni future dichiarate in modo esplicito nella documentazione del progetto.

In pratica:

- codice
- documentazione
- iterazioni operative
- aggiornamenti di fase

sono prodotti e mantenuti dentro il workflow Codex del repository.

## Struttura utile

- `project.godot`: entrypoint del progetto Godot
- `src/`: scene, entity, sistemi e dati runtime
- `.docs/`: charter, game design, documentazione tecnica, piani di fase e log
- `build/windows/`: output previsto per export locale Windows

## Avvio locale

Prerequisiti minimi:

- `Godot 4.x`
- export templates installati se vuoi verificare anche la build Windows

Passi minimi:

1. Apri `project.godot` in Godot.
2. Verifica che la scena principale sia configurata correttamente.
3. Esegui il progetto.

Per l'export locale Windows, il riferimento operativo e' `.docs/05_release/build_process.md`.

## Documenti di riferimento

- `.docs/00_project/project_charter.md`
- `.docs/01_game_design/game_one_pager.md`
- `.docs/01_game_design/mvp_scope.md`
- `.docs/02_technical/technical_design_doc.md`
- `.docs/03_execution/phase_3_plan.md`
- `.docs/00_project/project_log.md`
