# AGENTS

Istruzioni per tutto il repository `/Users/mihai/testGaming`.

## Regola prioritaria

- Se il contesto o il task diventano troppo grandi, suddividili in parti piu' piccole e sequenziali prima di procedere, per ridurre il rischio di errori o allucinazioni.

## Flusso skill obbligatorio

- Usa il plugin `Game Studio` come entrypoint predefinito per i task di gioco su questo progetto.
- Per richieste generali di analisi, pianificazione, stato progetto o setup iniziale, usa la skill `game-studio`.
- Per task concreti di implementazione o modifica in `Godot 4.x + GDScript`, usa la skill repo-specifica `godot-mvp-task`.
- Quando il task diventa specifico, passa alla skill specialistica piu' adatta del plugin `Game Studio`.
- Se il task e' servito meglio da un'altra skill o plugin disponibile, usalo senza forzare `Game Studio`.
- Quando piu' skill o plugin sono rilevanti, scegli il set minimo necessario e dichiaralo.
- Se il task riguarda QA o verifica giocabile, usa la skill di playtest del plugin quando applicabile.
- Se il task riguarda documentazione o workflow OpenAI/Codex, usa la skill `openai-docs`.

## Ordine di adozione

- Migliora prima `AGENTS.md` quando serve comportamento persistente e regole di progetto.
- Usa plugin o skill quando esiste un workflow riusabile e ripetibile.
- Usa MCP quando il workflow richiede sistemi esterni o documentazione condivisa.
- Usa subagenti solo per lavoro delimitato e specializzato, non come default.

## Regole operative

- Rispetta i vincoli e le decisioni documentate in `.docs/`.
- Registra progressi, decisioni, blocchi e prossimi passi in `.docs/00_project/project_log.md`.
- Non modificare l'architettura senza una decisione esplicita registrata.
- Non aggiungere feature fuori MVP se non richiesto esplicitamente.
- Mantieni il focus su Windows-first con mobile-readiness solo architetturale.
- Considera questo progetto come `Godot 4.x + GDScript`, non come browser game.
- Tratta come regola di design persistente che ogni boss inizi con atmosfera cupa e che il mondo guadagni colore tra le fasi.
- Quando progetti o implementi transizioni di fase dei boss, interpreta il guadagno di colore come segnale che il boss sta perdendo controllo, non come semplice power-up estetico.
- Non aspettare una richiesta esplicita dell'utente per applicare questa regola ai boss futuri, salvo istruzioni contrarie documentate.
- Tratta come regola di design persistente che ogni boss abbia quattro beat di dialogo: introduzione iniziale, transizione alla fase successiva, transizione alla fase finale, ed esclamazione finale di vittoria o chiusura.
- Per il boss tutorial, prevedi inoltre un dialogo specifico immediatamente prima della morte forzata del player.
