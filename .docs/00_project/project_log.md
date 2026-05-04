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

Date: 2026-05-04
Type: progress
Topic: Pulizia repository pre-commit
Summary: Allineato `.gitignore` per escludere artefatti locali Godot, metadata macOS e output di build Windows mantenendo tracciata solo la struttura `build/windows/`.
Impact: Il repository e' pronto a un commit pulito senza rumore di file generati localmente.

Date: 2026-05-04
Type: progress
Topic: Validazione export Windows
Summary: Verificato che l'export `Windows (Steam)` funzioni in locale; il blocco precedente sulla build del target primario e' chiuso.
Impact: La Fase 2 non ha piu' gap sul percorso di build Windows e puo' considerarsi consolidata lato bootstrap tecnico.

Date: 2026-04-28
Type: progress
Topic: Invulnerabilita' test loop
Summary: Abilitata invulnerabilita' di test per `Player` e `Boss` tramite flag esportati attivi di default, in modo da mantenere il loop giocabile durante le verifiche senza alterare l'architettura.
Impact: I test manuali possono concentrarsi su movimento, pattern e stabilita' del loop senza chiusura della run per morte del player o del boss.

Date: 2026-04-28
Type: progress
Topic: Smoke test Mac locale
Summary: Scaricato Godot `4.6.2`, eseguito bootstrap headless del progetto, corretti errori reali in `boss.gd` e `bullet.gd`, rilanciato il run headless con esito pulito e aperto l'editor sul progetto.
Impact: Il repository e' stato verificato come apribile ed eseguibile su Mac, riducendo il rischio tecnico residuo della Fase 2.

Date: 2026-04-28
Type: progress
Topic: Verifica skill e plugin installabili
Summary: Verificato il catalogo installabile delle skill Codex e filtrato rispetto al progetto `Godot 4.x + GDScript`, MVP ristretto e target Windows-first. Non emergono plugin aggiuntivi necessari; tra le skill curate non c'e' una skill Godot dedicata da installare, mentre risultano potenzialmente utili in fasi successive `doc`, `gh-fix-ci`, `gh-address-comments`, `security-best-practices` e `security-threat-model`.
Impact: Il setup attuale e' gia' sufficiente per sviluppo MVP; eventuali installazioni aggiuntive vanno fatte solo quando compare un bisogno concreto di documentazione, workflow GitHub/CI o review di sicurezza.

Date: 2026-04-28
Type: next-step
Topic: Ingresso Fase 3
Summary: Il prossimo step operativo e' usare l'editor Godot aperto sul Mac per rifinire il loop MVP e, in seguito, validare il primo export debug Windows con template locali installati.
Impact: La base tecnica e' verificata in apertura/run su Mac; resta da chiudere la verifica specifica di export per il target principale Windows.

Date: 2026-04-28
Type: blocker
Topic: Validazione export Windows
Summary: Lo smoke test reale su Mac e' passato dopo correzione di due script drawing, ma l'export `Windows (Steam)` non e' ancora verificato perche' richiede preset/template e test specifico sul target di build.
Impact: La verifica di Fase 2 non e' piu' bloccata sul boot del progetto; il solo gap residuo riguarda la build del target primario.

Date: 2026-04-28
Type: progress
Topic: Scaffold tecnico Fase 2
Summary: Creato il progetto minimo `Godot 4.x` con `project.godot`, preset Windows base, cartella `build/windows/`, autoload `GameManager` e `InputManager`, scena principale e scene/script base per `Player`, `Boss`, `Bullet`, `PatternSystem`.
Impact: Il repository e' passato da sola documentazione a base tecnica eseguibile e coerente con l'architettura MVP.

Date: 2026-04-28
Type: decision
Topic: Perimetro tecnico Fase 2
Summary: La Fase 2 e' definita come bootstrap tecnico minimo eseguibile: loop base con movimento, firing, boss, pattern, collisioni semplici e preparazione build Windows senza feature extra.
Impact: Il progetto puo' avanzare verso implementazione iterativa senza allargare scope o alterare l'architettura.

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
