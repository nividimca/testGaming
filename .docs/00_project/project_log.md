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

Date: 2026-04-28
Type: decision
Topic: Workflow branch
Summary: Creato branch `develop` come ramo di sviluppo. `main` va trattato come ramo protetto.
Impact: Le modifiche ordinarie devono partire da `develop` o da branch dedicati e arrivare in `main` solo tramite merge reviewato.

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
