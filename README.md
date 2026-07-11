# Dark Punchline

`Dark Punchline` e' un progetto game-dev in `Godot 4.x + GDScript` per un gioco arcade boss-based, con target primario `Windows` e mobile-readiness mantenuta solo a livello architetturale.

Il conflitto centrale del progetto e':

**Player vs Black Humor**

Il loop MVP di riferimento e':

`muoviti -> schiva -> colpisci -> sopravvivi`

## Stato del branch corrente

Questo branch e' la baseline documentale del progetto.

Contiene:

- documentazione di progetto in `.docs/`
- regole operative e governance del workflow
- backlog tecnico prioritizzato
- piani di esecuzione, QA e release

Non contiene ancora un bootstrap Godot committato.

In pratica, su questo branch non sono ancora presenti:

- `project.godot`
- `src/`
- `export_presets.cfg`
- `build/windows/`

Questa documentazione va quindi letta come fonte di verita' per preparare il bootstrap tecnico del progetto, non come descrizione di un runtime gia' tracciato nel repository.

## Stato del progetto

Sul branch corrente risultano chiusi a livello documentale:

- obiettivo, vincoli e priorita' di progetto
- core loop, scope MVP e KPI
- architettura tecnica prevista
- backlog tecnico iniziale
- piano operativo della prima settimana
- template per playtest, bug log e build process

Il prossimo obiettivo operativo su questo branch e':

- creare il bootstrap tecnico minimo in `Godot 4.x`
- validare una prima build locale `Windows`
- trasformare la documentazione in runtime giocabile senza uscire dall'MVP

## Progetto fatto con Codex

Questo progetto e' sviluppato interamente con Codex.

In pratica:

- documentazione
- iterazioni operative
- backlog
- aggiornamenti di fase
- futuro codice runtime

sono mantenuti dentro il workflow Codex del repository, salvo eccezioni documentate in modo esplicito.

## Struttura utile

- `.docs/`: charter, design, documentazione tecnica, execution, testing, release e mobile-readiness
- `AGENTS.md`: regole operative persistenti del repository
- `WORKFLOW_GOVERNANCE.md`: governance multi-tool e quality gates
- `STEAM_WINDOWS_MOBILE_CHECKLIST.md`: checklist fasi/gate Windows-first
- `AI_TOOL_PLAYBOOK_SOLO_DEV.md`: guida rapida all'uso dei tool AI nelle varie fasi

## Come usare questo branch

1. Parti da `.docs/00_project/project_charter.md` e `.docs/01_game_design/game_one_pager.md`.
2. Usa `.docs/02_technical/technical_design_doc.md` e `.docs/02_technical/backlog_technical.md` come base del bootstrap tecnico.
3. Segui `.docs/03_execution/week_01.md` per la sequenza operativa iniziale.
4. Usa `.docs/05_release/build_process.md` e `.docs/04_testing/` per verificare build e QA appena il runtime esiste.

## Documenti di riferimento

- `.docs/00_project/project_charter.md`
- `.docs/00_project/project_log.md`
- `.docs/01_game_design/game_one_pager.md`
- `.docs/01_game_design/mvp_scope.md`
- `.docs/01_game_design/kpi.md`
- `.docs/02_technical/technical_design_doc.md`
- `.docs/02_technical/backlog_technical.md`
- `.docs/03_execution/week_01.md`
- `.docs/05_release/build_process.md`
