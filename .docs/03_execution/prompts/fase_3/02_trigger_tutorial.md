Repo: `/Users/mihai/testGaming`.

Leggi prima:
- `AGENTS.md`
- `.docs/fase/FASE_3_VERTICAL_SLICE.md`
- `.docs/03_execution/phase_3_plan.md`
- `.docs/03_execution/tutorial_arena_slice.md`
- `.docs/00_project/project_log.md`

Poi ispeziona il codice attuale del tutorial boss e del runtime dialoghi.

Obiettivo:
collega i 5 beat dialogici del boss tutorial al flow reale della slice.

Beat obbligatori:
- `opening`
- `pre_forced_death`
- `phase_2_transition`
- `phase_3_transition`
- `final_line`

Richieste:
1. collega ogni beat al trigger corretto
2. rendi chiaro il flow: incipit -> dialogo pre-morte forzata -> morte forzata -> scontro reale
3. collega i dialoghi di transizione alle fasi 2 e 3
4. collega il dialogo finale alla chiusura dello scontro
5. rifinisci pacing e leggibilita' con HUD/overlay
6. evita che i dialoghi sembrino bug o blocchi casuali
7. se possibile esegui verifica locale

Vincoli:
- minimo sistema possibile
- niente sistema narrativo esteso
- niente stringhe hardcodate nel flow se evitabile
- niente feature extra fuori MVP

Output finale:
- file modificati
- trigger implementati
- eventuali limiti o edge case rimasti
- stato parziale della DoD
