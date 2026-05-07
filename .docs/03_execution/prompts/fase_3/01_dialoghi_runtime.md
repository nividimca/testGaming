Repo: `/Users/mihai/testGaming`.

Leggi prima:
- `AGENTS.md`
- `.docs/fase/FASE_3_VERTICAL_SLICE.md`
- `.docs/03_execution/phase_3_plan.md`
- `.docs/03_execution/tutorial_arena_slice.md`
- `.docs/02_technical/technical_design_doc.md`
- `.docs/00_project/project_log.md`

Poi ispeziona il codice rilevante:
- `src/data/dialogue/boss_dialogue_resource.gd`
- `src/data/dialogue/bosses/tutorial_boss_dialogue.tres`
- `src/scenes/main/main.gd`
- `src/scenes/main/main.tscn`
- `src/entities/boss/boss.gd`
- `src/autoload/game_manager.gd`

Obiettivo:
implementa il runtime minimo per mostrare i dialoghi del boss tutorial.

Vincoli:
- Godot 4.x + GDScript
- Windows-first
- niente scope creep
- niente cambi architetturali non documentati
- usa `BossDialogueResource` come source of truth
- non hardcodare stringhe nel flow di combattimento
- sistema minimo possibile, niente framework narrativo grande

Richieste:
1. aggiungi una UI/presenter minima per mostrare una singola linea di dialogo
2. carica i dati da `tutorial_boss_dialogue.tres`
3. integra la base tecnica senza ancora completare tutti i trigger se non strettamente necessario
4. mantieni HUD/overlay leggibili
5. aggiorna docs/log solo se coerente con le modifiche reali

Output finale:
- file modificati
- cosa hai implementato
- cosa manca per collegare i beat runtime
