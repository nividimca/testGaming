# FASE 3 - VERTICAL SLICE PLAN

## Obiettivo

Rendere la Fase 3 coerente con il conflitto centrale del progetto:

**Player vs Black Humor**

La vertical slice non deve presentare un generico shooter con un bersaglio in alto, ma una prima esperienza giocabile in cui:

- il boss e' la manifestazione attiva del black humor
- i pattern non sono casuali, ma strumenti di pressione intenzionale
- il tutorial/incipit introduce subito questo conflitto
- la difficolta' cresce come escalation controllata del black humor, non come semplice aumento numerico

## Stato di partenza

La Fase 2 e' chiusa a livello tecnico:

- progetto Godot avviabile
- autoload `GameManager` e `InputManager` presenti
- loop base giocabile con `Player`, `Boss`, `Bullet`, `PatternSystem`
- export Windows validato localmente nel log di progetto

La Fase 3 parte da una base implementata ma ancora da riallineare come intenzione di design:

- boss tutorial a 3 fasi gia' presente
- HUD minimo con HP player e boss
- arena tutorial formalizzata come prima slice giocabile
- ingresso run, vittoria, game over e restart gia' introdotti

Il gap principale non e' tecnico ma progettuale:

- il piano corrente tratta ancora il boss troppo come target da colpire
- i pattern sono descritti piu' come configurazioni di firing che come attacchi con intenzione
- manca un collegamento esplicito tra incipit, morte forzata e scontro reale della slice

## Risultato atteso

Alla fine della Fase 3 il progetto deve offrire una vertical slice minima ma coerente in cui:

- il player capisce subito che sta affrontando il black humor
- il boss si comporta come entita' attiva che mette sotto pressione il player
- ogni fase del boss comunica una forma diversa di pressione e caos controllato
- il tutorial/incipit prepara il player con una morte forzata chiara e intenzionale
- i dialoghi del boss tutorial sono presenti nel flow reale e non solo definiti come dati
- la run reale della slice riprende quel conflitto in forma giocabile e verificabile

## Principi guida

- il boss non e' un bersaglio passivo
- il pattern non e' un output casuale di proiettili
- la difficolta' non cresce solo con HP, rate o numero di colpi
- tra una fase e l'altra il mondo reagisce allo scontro recuperando colore
- l'aumento del colore non segnala vittoria immediata, ma instabilita' crescente del dominio del boss
- la leggibilita' resta prioritaria, ma senza togliere pressione
- ogni aggiunta deve restare dentro MVP e architettura esistente

## Vincoli permanenti

- un task alla volta
- niente feature extra fuori MVP
- niente cambi di architettura non documentati
- `InputManager` resta l'unico punto di lettura dell'input
- `PatternSystem` resta responsabile del firing del boss
- focus `Windows-first`
- mobile-readiness solo architetturale

## In Scope

- riallineamento del tutorial boss al conflitto `Player vs Black Humor`
- definizione chiara del beat iniziale con morte forzata
- dialoghi minimi del boss tutorial per apertura, passaggi di fase, pre-morte forzata e chiusura finale
- struttura dati minima per salvare i dialoghi del boss tutorial fuori dalla logica gameplay
- integrazione runtime minima dei dialoghi del boss tutorial nella tutorial arena
- tuning di movimento player e risposta dei controlli
- tuning di HP, fire rate, bullet speed e cadence
- tuning delle tre fasi del boss con intenzione leggibile
- escalation della pressione coerente con il tono black humor
- HUD runtime minimo utile ai test
- stato di game over e restart minimo verificabile
- arena tutorial unica come contenitore della slice
- build interna di playtest
- playtest manuale e raccolta note/bug

## Out of Scope

- nuovi boss o nuove arene
- sistemi narrativi complessi
- dialoghi estesi o cutscene complete
- UI finale fuori da HUD/overlay minimi di slice
- audio e VFX completi
- settings, save system, rebinding avanzato
- touch controls reali
- refactor generali
- contenuto oltre il tutorial boss

## Struttura della slice

La Fase 3 e' composta da due momenti semplici e consecutivi:

### 1. Incipit / tutorial breve

Scopo:
introdurre il conflitto `Player vs Black Humor`.

Requisiti:

- il player apprende movimento e schivata
- il boss introduce subito il tono della slice
- il boss ha un dialogo specifico immediatamente prima della morte forzata
- la pressione iniziale e' controllata e leggibile
- la morte del player e' forzata e chiaramente intenzionale
- la morte forzata non deve sembrare un bug o un fallimento casuale

Nota operativa:
questo beat deve restare semplice da implementare. Non richiede nuovi sistemi complessi; puo' essere realizzato come sequenza minima di onboarding nella stessa tutorial arena o nello stesso flusso di run.

### 2. Scontro reale della tutorial arena

Scopo:
trasformare il conflitto introdotto nell'incipit in una run giocabile completa e verificabile.

Requisiti:

- una sola arena
- un solo boss
- tre fasi riconoscibili
- vittoria, game over e restart verificabili
- HUD minimo sufficiente a leggere stato player, stato boss e fase

## Intento del boss

Il boss della Fase 3 deve essere descritto e trattato come entita' attiva.

Questo implica:

- attacca il player con una progressione deliberata
- usa pattern per occupare spazio, imporre movimento e creare pressione
- cambia fase per aumentare ostilita' percepita, non solo densita'
- comunica il black humor attraverso il modo in cui schiaccia il player, non solo attraverso il tema visivo
- perde controllo sul mondo man mano che subisce danno, reagendo con maggiore aggressivita' e minore compostezza
- scandisce lo scontro con beat di dialogo brevi e leggibili, non con narrativa estesa

Il boss NON deve essere descritto nel piano come:

- semplice target con HP
- dispenser di bullet a cadenza crescente
- ostacolo neutro tipico da shooter generico

## Intento delle transizioni di fase

Il passaggio tra le fasi non deve essere letto solo come cambio di pattern.

Ogni transizione deve comunicare una doppia escalation:

- il boss perde parte del proprio controllo
- il mondo recupera colore e presenza

Questo serve a dare pathos allo scontro:

- il player percepisce che il black humor sta cedendo
- il cedimento non alleggerisce subito la pressione
- la perdita di controllo del boss rende l'arena piu' instabile e il conflitto piu' intenso

Regole:

- il cambiamento del mondo deve apparire come sintomo dello scontro, non come decorazione scollegata
- il recupero di colore deve essere progressivo e leggibile
- la transizione deve suggerire disperazione crescente del boss, non semplice power-up
- il risultato finale deve restare dentro il perimetro MVP e della tutorial arena

## Regola dialoghi del boss tutorial

Per la vertical slice, il boss tutorial usa una struttura di dialogo minima ma formale.

Beat richiesti:

- un dialogo iniziale di ingresso nello scontro
- un dialogo di passaggio alla seconda fase
- un dialogo di passaggio alla terza fase
- un dialogo finale come esclamazione di vittoria o chiusura dello scontro

Beat addizionale richiesto:

- un dialogo specifico immediatamente prima della morte forzata del player nell'incipit

Regole:

- i dialoghi devono rafforzare `Player vs Black Humor`
- i dialoghi devono restare brevi e funzionali al ritmo della slice
- i dialoghi non devono trasformarsi in cutscene o narrativa estesa
- i dialoghi devono essere salvati in forma data-driven per boss, non hardcodati nel flow di combattimento
- la Fase 3 non si chiude se i dialoghi esistono solo nei file dati ma non sono verificabili nel tutorial runtime

## Intento dei pattern

Ogni pattern della Fase 3 deve avere una funzione chiara.

Funzioni ammesse:

- insegnare movimento base
- costringere riposizionamento
- creare pressione progressiva
- produrre caos controllato senza perdere leggibilita'

Regole:

- nessun pattern deve sembrare casuale
- ogni pattern deve avere uno scopo leggibile in meno di pochi secondi
- l'aumento di difficolta' deve derivare da ritmo, pressione e copertura dello spazio
- la traiettoria dei colpi deve suggerire che il boss sta attaccando il player, non sparando nel vuoto

## Escalation delle tre fasi

Le tre fasi del boss devono essere progressive per intenzione, non solo per quantita'.

### Fase 1 - Introduzione della minaccia

Obiettivo:
insegnare il ritmo base e la presenza aggressiva del boss.

Requisiti:

- pattern leggibile subito
- spazi di schivata ampi
- pressione bassa ma reale
- serve a dire al player: il boss ti sta puntando e ti costringe a reagire
- il mondo e' ancora spento e stabile, come se il boss ne controllasse il tono

### Fase 2 - Pressione attiva

Obiettivo:
passare dalla lettura alla gestione del rischio.

Requisiti:

- il pattern riduce i margini di comfort
- il player deve riposizionarsi con piu' frequenza
- la pressione cresce in modo percepibile ma ancora controllabile
- il boss appare piu' aggressivo, non solo piu' veloce
- il mondo introduce piu' colore e segnali di instabilita', come prima crepa nel dominio del boss

### Fase 3 - Caos controllato

Obiettivo:
chiudere la slice con il massimo livello di pressione previsto per l'MVP tutorial.

Requisiti:

- il pattern crea saturazione percepita ma ancora leggibile
- il player deve leggere in fretta e reagire con precisione
- il caos deve sembrare intenzionale e ostile
- non deve degenerare in bullet hell generico o confuso
- il mondo appare piu' vivo e piu' carico di colore, ma proprio per questo piu' instabile
- il boss deve risultare vicino al collasso: piu' pericoloso, piu' scoperto, piu' disperato

## Workstream

### 1. Allineamento incipit e slice

Obiettivo:
collegare il beat di apertura alla tutorial arena.

Task:

- definire dove avviene la morte forzata nel flusso
- chiarire come il player passa dall'incipit alla run reale
- verificare che il conflitto `Player vs Black Humor` sia comprensibile entro i primi minuti

### 2. Chiusura della run

Obiettivo:
mantenere la slice come esperienza completa e verificabile.

Task:

- confermare ingresso run chiaro
- confermare game over e vittoria reali
- confermare restart minimo
- disattivare o limitare comportamenti di test che falsano il gate finale

### 3. Tuning del player

Obiettivo:
rendere il player responsivo abbastanza da sostenere la pressione del boss.

Task:

- fissare velocita' movimento
- fissare fire rate
- verificare leggibilita' del colpo player
- verificare che il firing aiuti il tutorial senza banalizzare il conflitto

### 4. Tuning del boss come entita' attiva

Obiettivo:
far emergere il boss come agente della pressione.

Task:

- descrivere l'intenzione di ogni fase
- allineare passaggi di fase a escalation percepita
- evitare fasi che cambiano solo per numero di proiettili
- verificare che il boss non resti percepito come target fermo e passivo

### 5. Tuning dei pattern

Obiettivo:
trasformare i pattern in attacchi leggibili e intenzionali.

Task:

- associare uno scopo a ogni pattern
- verificare che ogni pattern costringa una risposta diversa del player
- bilanciare densita', velocita' e ritmo senza uscire dal tutorial
- mantenere caos controllato e leggibilita'

### 6. Validazione della slice

Obiettivo:
chiudere la Fase 3 con prove verificabili.

Task:

- eseguire playtest brevi e ripetuti
- registrare decisioni di tuning in `project_log.md`
- aggiornare note e bug reali emersi
- verificare la build interna o equivalente locale

## Sequenza raccomandata

1. Fissare il collegamento tra incipit, morte forzata e run reale.
2. Confermare che la run abbia vittoria, game over e restart reali.
3. Stabilizzare il player per un controllo affidabile.
4. Definire l'intenzione della Fase 1 del boss.
5. Definire l'intenzione della Fase 2 del boss.
6. Definire l'intenzione della Fase 3 del boss.
7. Bilanciare HP, tempi e cadenze in funzione della pressione, non solo della durata.
8. Fare playtest mirati sulla leggibilita' dei pattern e sulla percezione del conflitto.
9. Registrare problemi, correzioni e next step.

## Criteri di uscita Fase 3

La Fase 3 puo' essere considerata chiusa quando tutti i punti seguenti sono veri:

1. il progetto continua ad avviarsi senza errori di parse o bootstrap
2. l'apertura della slice introduce esplicitamente il conflitto `Player vs Black Humor`
3. esiste un beat iniziale con morte forzata chiara, intenzionale e comprensibile
4. la run reale parte dopo l'incipit senza ambiguita'
5. il player ha movimento e firing abbastanza stabili per test ripetuti
6. il boss e' percepibile come entita' attiva e non come target passivo
7. il boss presenta tre fasi chiaramente distinguibili per intenzione e pressione
8. ogni fase ha un pattern leggibile con funzione riconoscibile
9. l'escalation della difficolta' comunica pressione e caos controllato coerenti con il black humor
10. il loop resta tutorializzante e leggibile, non uno shooter generico o un bullet hell confuso
11. HP player e boss sono visibili a runtime o comunque immediatamente verificabili
12. esistono game over, vittoria e restart minimi verificabili
13. la tutorial arena resta una singola arena/livello chiaramente identificabile
14. esiste una build interna di playtest o un equivalente locale esplicitamente verificato
15. esistono almeno 3 playtest documentati senza bug blocker aperti

## Deliverable minimi

- `phase_3_plan.md` aggiornato e coerente con `Player vs Black Humor`
- collegamento documentato tra incipit, morte forzata e tutorial arena
- tuning documentato del player
- tuning documentato del boss tutorial come entita' attiva
- tuning documentato dei pattern con funzione esplicita
- note su ingresso run, game over, vittoria e restart
- `project_log.md` aggiornato
- `playtest_notes.md` con almeno 3 giri di verifica
- `bug_log.md` aggiornato solo se emergono problemi reali
- stato della build interna registrato

## Rischi attuali

- la slice puo' restare troppo vicina a un prototipo shooter generico se i pattern non hanno funzione esplicita
- la morte forzata puo' risultare arbitraria se non e' segnalata come scelta intenzionale del tutorial
- il tuning puo' ridursi a numeri invece che a pressione percepita
- il respawn di test del boss puo' falsare la lettura di vittoria e chiusura run
- il riallineamento tematico puo' degenerare in scope creep se richiede sistemi narrativi o contenuti extra

## Regola decisionale

Una modifica e' coerente con la Fase 3 se:

- rende piu' chiaro il conflitto `Player vs Black Humor`
- rende il boss piu' attivo e intenzionale
- rende i pattern piu' leggibili e ostili
- migliora la verificabilita' della slice senza introdurre nuovi sistemi

Una modifica NON e' coerente con la Fase 3 se:

- tratta il boss come semplice target
- aumenta la difficolta' solo con numeri
- aggiunge contenuto fuori MVP
- richiede nuova architettura o sottosistemi complessi

## Mappatura con checklist madre

La Fase 3 del repo viene considerata allineata alla sezione `3) Vertical Slice` di `STEAM_WINDOWS_MOBILE_CHECKLIST.md` con queste interpretazioni operative:

- `Gameplay core loop completo`: il loop della slice e' lo scontro `Player vs Black Humor`
- `1 livello/arena completa`: la tutorial arena resta la prima arena completa della slice
- `UI/HUD base funzionante`: HUD runtime minimo obbligatorio
- `Onboarding/tutorial minimo presente`: l'incipit con morte forzata introduce il conflitto prima della run reale
- `Menu principale funzionante`: puo' restare un ingresso minimo non finale
- `Audio placeholder integrato`: opzionale e solo minimo se serve al gate
- `Build internal playtest prodotta`: richiesta prima di chiudere la Fase 3
- `3 playtest completati senza bug blocker`: gate reale di uscita

Riferimento repo-specifico:

- `.docs/03_execution/tutorial_arena_slice.md`

## Prossimi task consigliati

1. Formalizzare in `.docs/03_execution/tutorial_arena_slice.md` dove si colloca la morte forzata nel flusso reale.
2. Fare un pass di playtest per verificare se le tre fasi oggi comunicano davvero intenzione diversa o solo densita' diversa.
3. Disattivare i comportamenti di test che impediscono la lettura reale di vittoria o sconfitta.
4. Registrare in `playtest_notes.md` osservazioni specifiche su pressione, caos controllato e comprensione del conflitto.
