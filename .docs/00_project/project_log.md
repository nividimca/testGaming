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

Date: 2026-05-07
Type: progress
Topic: Prompt operativi salvati per chiusura Fase 3
Summary: Creata la struttura `.docs/03_execution/prompts/fase_3/` con un prompt master (`00_master_prompt.md`) e tre sotto-prompt sequenziali per runtime dialoghi, trigger del tutorial boss e verifica/chiusura della Fase 3.
Impact: Il lavoro residuo della Fase 3 puo' ora essere richiamato in modo compatto da un nuovo thread, mantenendo autonomia esecutiva, ordine dei task e allineamento alla DoD aggiornata.

Date: 2026-05-04
Type: decision
Topic: DoD Fase 3 legata a tutorial completo con dialoghi
Summary: Aggiornati `.docs/fase/FASE_3_VERTICAL_SLICE.md`, `.docs/03_execution/phase_3_plan.md` e `.docs/03_execution/tutorial_arena_slice.md` per dichiarare che la Fase 3 si chiude solo quando il tutorial boss e' completo anche a runtime, con dialoghi inclusi e verificabili nei beat previsti.
Impact: La chiusura di Fase 3 non coincide piu' con una slice solo tecnicamente stabile o con dialoghi definiti come dati, ma con un tutorial realmente completo e testabile nel suo flow finale.

Date: 2026-05-04
Type: progress
Topic: Struttura dati dialoghi boss
Summary: Creata una struttura minima data-driven per i dialoghi dei boss con `src/data/dialogue/boss_dialogue_resource.gd` e il sample `src/data/dialogue/bosses/tutorial_boss_dialogue.tres`; aggiornata anche la documentazione tecnica e di Fase 3 per fissare il salvataggio dei dialoghi fuori dalla logica gameplay.
Impact: Il progetto puo' iniziare a scrivere e organizzare i dialoghi del boss tutorial e dei boss futuri senza hardcodare testo negli script di combattimento, mantenendo il cambiamento dentro il perimetro MVP.

Date: 2026-05-04
Type: decision
Topic: Grammatica dei dialoghi per i boss
Summary: Aggiornati `AGENTS.md`, `.docs/01_game_design/game_one_pager.md`, `.docs/fase/FASE_1_DEFINIZIONE_GIOCO.md`, `.docs/03_execution/phase_3_plan.md` e `.docs/03_execution/tutorial_arena_slice.md` per formalizzare quattro beat di dialogo per boss, con dialogo specifico extra del boss tutorial prima della morte forzata del player.
Impact: I dialoghi dei boss diventano parte stabile della grammatica di progetto e della vertical slice, restando brevi e compatibili con MVP senza richiedere narrativa estesa.

Date: 2026-05-04
Type: progress
Topic: Creazione file fase mancanti
Summary: Creati `.docs/fase/FASE_2_BOOTSTRAP_TECNICO.md` e `.docs/fase/FASE_3_VERTICAL_SLICE.md` per completare la sequenza documentale delle fasi con riferimenti coerenti ai documenti tecnico ed esecutivo gia' esistenti.
Impact: La struttura `.docs/fase/` ora copre Fase 0, 1, 2 e 3 in modo esplicito, riducendo ambiguita' e rendendo piu' lineare la consultazione del progetto.

Date: 2026-05-04
Type: decision
Topic: Allineamento regola atmosferica nei documenti fase
Summary: Aggiornati `.docs/fase/FASE_0_SETUP_STRATEGICO (1).md` e `.docs/fase/FASE_1_DEFINIZIONE_GIOCO (3).md` per fissare gia' nelle fasi iniziali che ogni boss parte da un'atmosfera cupa e che il mondo guadagna colore tra le fasi come segnale del cedimento del boss.
Impact: La regola non resta confinata ai documenti di slice o al one-pager, ma entra nella definizione progettuale di base e quindi guida anche i boss futuri.

Date: 2026-05-04
Type: decision
Topic: Regola atmosferica persistente per tutti i boss
Summary: Aggiornati `AGENTS.md` e `.docs/01_game_design/game_one_pager.md` per dichiarare come regola di progetto che ogni boss inizi con atmosfera cupa e che il mondo guadagni colore tra le fasi come segnale di perdita di controllo del boss.
Impact: La grammatica emotiva e visiva dei boss diventa persistente nel workflow e nel game design di alto livello, senza doverla ridefinire per ogni nuovo boss.

Date: 2026-05-04
Type: decision
Topic: Formalizzazione pathos tra fasi nella tutorial arena
Summary: Aggiornati `.docs/03_execution/phase_3_plan.md` e `.docs/03_execution/tutorial_arena_slice.md` per dichiarare che tra una fase e l'altra il mondo recupera colore mentre il boss perde controllo, cosi' il passaggio di fase aggiunge pathos e resta coerente con `Player vs Black Humor`.
Impact: Le transizioni del boss non sono piu' solo escalation di pattern, ma anche segnali leggibili di cedimento del black humor dentro la slice MVP, senza richiedere nuovi sistemi o allargare lo scope.

Date: 2026-05-04
Type: progress
Topic: Implementazione incipit e pattern intenzionali Fase 3
Summary: La tutorial arena ora apre con un incipit giocabile di movimento/schivata con morte forzata esplicita, poi resetta nello scontro reale; inoltre il boss usa pattern centrati sul player e movimento orizzontale lieve per risultare piu' attivo e meno simile a un target passivo.
Impact: La slice runtime e' piu' coerente con `Player vs Black Humor`, con pressione introduttiva leggibile e tre fasi che attaccano il player con maggiore intenzione senza cambiare architettura o uscire dal MVP.

Date: 2026-05-04
Type: decision
Topic: Riallineamento Fase 3 a Player vs Black Humor
Summary: Riscritto `.docs/03_execution/phase_3_plan.md` per eliminare ambiguita' da shooter generico e rendere espliciti boss attivo, pattern con intenzione, escalation come pressione/caos controllato e collegamento tra incipit con morte forzata e tutorial arena.
Impact: La vertical slice di Fase 3 e' ora definita come scontro coerente `Player vs Black Humor`, con task implementabili uno per volta senza cambiare architettura o uscire dal MVP.

Date: 2026-05-04
Type: decision
Topic: Formalizzazione tutorial arena
Summary: Creata `.docs/03_execution/tutorial_arena_slice.md` per dichiarare `main.tscn` come prima arena completa della vertical slice, con flusso di run, boundary, regole e criteri di verifica espliciti.
Impact: La Fase 3 ha ora un riferimento formale per il primo livello della slice; i playtest e il tuning possono riferirsi a una arena definita e non solo alla scena corrente in modo implicito.

Date: 2026-05-04
Type: progress
Topic: Fix restart della vertical slice
Summary: Corretto il reset della run: il reload della scena ora richiama `GameManager.reset_run()` per tornare a `BOOT`, azzera i riferimenti runtime e accetta `R` solo negli stati `VICTORY` e `GAME_OVER`.
Impact: Il restart della slice torna a comportarsi come una nuova run reale invece di riaprire la scena lasciando l'autoload in uno stato finale precedente.

Date: 2026-05-04
Type: progress
Topic: Fix HUD su morte player o boss
Summary: Corretto un errore runtime nel death flow della slice: l'HUD non usa piu' riferimenti stantii a `Player` e `Boss` dopo `queue_free()`, ma recupera i nodi live dalla scena prima di leggere HP o fase.
Impact: Game over e vittoria non generano piu' errore a runtime durante l'aggiornamento dell'HUD, rendendo la chiusura della run stabile.

Date: 2026-05-04
Type: progress
Topic: Chiusura run minima della vertical slice
Summary: Implementato un ingresso minimo della slice con schermata iniziale, overlay di stato e restart via `InputManager`; inoltre disattivati nella scena i flag di test che impedivano game over reale del player e vittoria reale contro il boss.
Impact: La run non e' piu' solo una sandbox che parte da sola: ora ha inizio, esiti verificabili e un restart minimo coerente con i gate della Fase 3 vertical slice.

Date: 2026-05-04
Type: decision
Topic: Riallineamento formale Fase 3 al Vertical Slice
Summary: Aggiornato `.docs/03_execution/phase_3_plan.md` per trattare la Fase 3 come vertical slice minima del progetto, non solo come tuning del combat loop, mantenendo il tutorial boss come nucleo della slice.
Impact: I gate della Fase 3 ora includono esplicitamente ingresso run, game over/restart, arena tutorial, build interna e 3 playtest documentati, in coerenza con `STEAM_WINDOWS_MOBILE_CHECKLIST.md`.

Date: 2026-05-04
Type: progress
Topic: Cross-check Fase 3 con checklist Steam/Windows/Mobile
Summary: Confrontato il piano `.docs/03_execution/phase_3_plan.md` con la sezione `3) Vertical Slice` di `STEAM_WINDOWS_MOBILE_CHECKLIST.md`. Il piano repo-specifico e' coerente come direzione, ma volutamente piu' ristretto: copre tutorial/combat loop MVP e non include ancora menu, audio, arena completa, build internal playtest o tre playtest chiusi.
Impact: La Fase 3 del repo e' confermata come sottofase di tuning del vertical slice, non come vertical slice completo gia' pronto al gate successivo.

Date: 2026-05-04
Type: decision
Topic: Piano operativo Fase 3
Summary: Formalizzata la Fase 3 in `.docs/03_execution/phase_3_plan.md` come tuning del combat loop tutorial MVP, con scope, sequenza, rischi e criteri di uscita espliciti.
Impact: Lo stato del progetto non dipende piu' solo dal log incrementale; le prossime iterazioni possono essere valutate contro un piano di fase condiviso e verificabile.

Date: 2026-05-04
Type: progress
Topic: Verifica stato reale Fase 3
Summary: Riesaminati backlog, documentazione, stato Git e runtime attuale con bootstrap Godot headless. La Fase 2 risulta chiusa a livello tecnico; la Fase 3 e' realmente in corso come tuning del combat loop MVP, ma non ha ancora un piano documentato dedicato oltre al backlog P1 e ai log incrementali.
Impact: Il progetto e' allineato come implementazione, ma resta utile formalizzare meglio obiettivi, criteri di uscita e testing della Fase 3 per ridurre ambiguita' nelle prossime iterazioni.

Date: 2026-05-04
Type: progress
Topic: Resa visiva proiettile player orientato
Summary: Migliorato il draw del proiettile player per il nuovo tiro verso il boss: ora usa una silhouette a punta orientata lungo la direzione di volo invece del vecchio rettangolo verticale fisso.
Impact: Il feedback visivo torna coerente con la traiettoria del proiettile senza cambiare collisioni o sistemi gameplay.

Date: 2026-05-04
Type: progress
Topic: Triplicata vita del boss
Summary: Portata la vita massima del boss tutorial da 21 a 63 HP per allungare il test del loop mantenendo invariata la suddivisione automatica in tre fasi uguali.
Impact: Il boss resta coerente con il tutorial a 3 fasi ma richiede piu' tempo per essere completato e osservato in run.

Date: 2026-05-04
Type: progress
Topic: Proiettili player orientati al boss
Summary: Per verificare il feeling del loop, il firing del player usa ora una direzione iniziale calcolata verso la posizione corrente del boss invece del solo asse verticale.
Impact: Il test rende piu' immediata la pressione offensiva sul boss senza toccare input, collisioni o architettura core.

Date: 2026-05-04
Type: progress
Topic: HUD HP e fasi boss uniformi
Summary: Aggiunto HUD runtime minimale per visualizzare HP di player e boss, con fase boss corrente; il boss tutorial usa ora 21 HP e transizioni a terzi esatti da 7 HP per avere tre fasi uguali come durata teorica.
Impact: Il loop resta dentro MVP ma diventa leggibile a video e piu' semplice da verificare durante il tuning del tutorial boss.

Date: 2026-05-04
Type: progress
Topic: Fix parse warning bloccante PatternSystem
Summary: Corretto un warning-as-error in `PatternSystem` sostituendo inferenze `Variant` con funzioni tipizzate (`maxf`, `maxi`); il bootstrap headless Godot torna a partire.
Impact: Il progetto e' di nuovo avviabile senza errori di parse dopo il tuning del boss tutorial.

Date: 2026-05-04
Type: progress
Topic: Respawn boss per test tutorial
Summary: Per il test del loop tutorial, la sconfitta del boss non chiude piu' la run: il boss sparisce per 3 secondi, sospende collisioni e firing, poi riappare con HP pieni e riparte dalla fase 1.
Impact: Il comportamento permette iterazione rapida sulle tre fasi del tutorial boss senza introdurre nuovi sistemi o alterare l'ownership del firing fuori da `PatternSystem`.

Date: 2026-05-04
Type: progress
Topic: Boss tutorial a 3 fasi
Summary: Rifinito il loop boss tutorial mantenendo l'architettura MVP: `Boss` espone una fase derivata dagli HP residui e `PatternSystem` resta responsabile del firing con tre pattern progressivi 1/3/5 direzioni e cadenze esportate.
Impact: La Fase 3 guadagna un boss didattico piu' leggibile e iterabile senza introdurre nuovi sistemi o spostare responsabilita' fuori dal perimetro documentato.

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
