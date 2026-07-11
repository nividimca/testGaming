# PROJECT LOG

Registro unico di avanzamento e decisioni del progetto.

## Come usarlo

- Aggiungi una nuova voce in cima al file.
- Registra solo decisioni, avanzamenti, blocchi e prossimi passi concreti.
- Mantieni ogni voce breve e verificabile.

## Template voce

Date:
Type: progress | decision | blocker | next-step
Topic:
Summary:
Impact:

---

Date: 2026-06-30
Type: progress
Topic: Preparazione merge documentazione su main
Summary: Completata la baseline documentale del branch corrente e aggiornato `.gitignore` per escludere `.godot/`, artefatto locale dell'editor non rilevante per il repository. Il ramo e' ora pronto per il merge su `main` come sorgente documentale coerente.
Impact: Il merge su `main` puo' includere solo documentazione e regole operative senza trascinare stato locale generato dall'editor.

Date: 2026-06-30
Type: progress
Topic: Chiusura documentazione branch corrente
Summary: Riallineati `README`, governance e documenti `.docs/` al contenuto reale del branch corrente, completando charter, AI contract, one-pager, scope, KPI, technical design doc, backlog, execution, QA, build process e mobile-readiness senza assumere stato proveniente da altri branch.
Impact: Il branch puo' ora essere usato come baseline documentale coerente e autosufficiente per avviare il bootstrap tecnico del progetto.

Date: 2026-06-30
Type: progress
Topic: Ricognizione stato documentazione
Summary: Verificato che nel branch corrente la documentazione copre bene charter, scope, vincoli e architettura di base, ma resta leggera o placeholder su execution, testing e release; la documentazione piu' aggiornata e aderente allo stato reale del progetto risulta invece nel ramo `develop`, dove sono presenti piano Fase 3, tutorial arena, prompt operativi e build process dettagliato.
Impact: La documentazione attuale e' sufficiente per orientamento iniziale, ma non per rappresentare da sola l'avanzamento effettivo della vertical slice; per analisi o ripresa lavori serve considerare `develop` come riferimento documentale piu' affidabile.

Date: 2026-06-30
Type: progress
Topic: Ricognizione stato progetto e disallineamento branch
Summary: Verificato che il branch corrente `codex/readme-main` contiene soprattutto documentazione e `README`, mentre il ramo `develop` contiene il bootstrap `Godot 4.x`, la tutorial arena e l'avanzamento di Fase 3. Dalla ricognizione emerge che la Fase 2 risulta chiusa a livello tecnico nel ramo di sviluppo, la Fase 3 e' in corso, e il gap principale residuo resta l'integrazione/verifica runtime dei dialoghi del boss tutorial insieme all'allineamento del branch di lavoro.
Impact: Lo stato reale del progetto va letto su `develop` e non solo sulla working tree corrente; per riprendere implementazione o QA senza ambiguita' serve partire dal ramo corretto o riallineare il branch attuale.

Date: 2026-05-07
Type: progress
Topic: README iniziale del repository
Summary: Aggiunto `README.md` con overview del progetto, stato attuale, istruzioni minime di avvio e dichiarazione esplicita che il workflow Codex copre l'intero repository e tutti i rami, non solo il branch corrente.
Impact: Chi apre il repo ha ora un punto di ingresso unico e coerente che spiega rapidamente scopo, stack, fase corrente e perimetro operativo di Codex.

Date: 2026-04-28
Type: decision
Topic: Stack iniziale
Summary: Confermato `Godot 4.x + GDScript` con target primario `Windows (Steam)` e mobile-readiness solo architetturale.
Impact: Tutti i task tecnici e le future implementazioni devono restare coerenti con questa scelta.

Date: 2026-04-28
Type: progress
Topic: Setup repository
Summary: Creata repository Git locale e commit iniziale eseguito.
Impact: Da ora documentazione e implementazione possono essere tracciate in modo coerente.

Date: 2026-04-28
Type: progress
Topic: Istruzioni operative Codex
Summary: Creati `AGENTS.md` e skill repo-specifica `godot-mvp-task` per delegare task concreti a Codex senza uscire da MVP e architettura.
Impact: Il workflow del progetto e' ora piu' stabile e ripetibile.
