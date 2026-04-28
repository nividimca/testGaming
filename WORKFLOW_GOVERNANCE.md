# Workflow Governance

Regole operative per mantenere coerenza tra strumenti AI e flussi di lavoro nel progetto.

## 1) Obiettivo

Uniformare decisioni, codice, documentazione e priorita' quando usi strumenti diversi (es. ChatGPT, Codex, altri tool).

## 2) Ambito

Queste regole si applicano a:
- design di gioco
- architettura tecnica
- implementazione codice
- QA
- release (Windows/Steam)
- preparazione mobile-ready

## 3) Single Source of Truth

- Fonte primaria: cartella `docs/` nel repo (oppure Notion, ma solo una).
- Nessuna decisione e' valida finche' non e' salvata nella fonte primaria.
- Le chat non sono documentazione ufficiale.

## 4) Ruoli per Strumento

- **ChatGPT (o equivalente)**:
  - ideazione gameplay
  - varianti concept
  - balancing teorico
  - copy store page
- **Codex**:
  - codice, refactor, test
  - build scripts e automazioni
  - integrazione asset nel runtime
  - triage bug -> task tecnici
- **Tool esterni (Notion/Jira/Trello/Sheets)**:
  - pianificazione e tracking

Regola:
- Non assegnare lo stesso task operativo a due AI in parallelo.

## 5) Standard di Prompt

Ogni prompt operativo deve includere:
1. Obiettivo (1 frase)
2. Vincoli (tempo, piattaforma, scope)
3. Input disponibili
4. Output richiesto (formato preciso)
5. Criterio di accettazione

Template minimo:

```txt
Obiettivo:
Vincoli:
Input:
Output richiesto:
Criteri di accettazione:
```

## 6) Definition of Done (DoD)

Un task e' `DONE` solo se:
- output previsto e' prodotto
- criteri di accettazione sono verificati
- decisioni rilevanti sono documentate
- backlog/stato e' aggiornato

Per task di codice, in aggiunta:
- build passa
- test minimi passano (se presenti)
- nessun bug blocker introdotto

## 7) Quality Gates per Fasi

- Non si passa fase se il gate fase non e' chiuso.
- Gate minimi:
  - Fase 1: MVP scope congelato + KPI definiti
  - Fase 2: build Windows da zero funzionante
  - Fase 3: vertical slice giocabile senza blocker
  - Fase 4: release candidate + checklist QA chiusa

## 8) Decision Log

Ogni decisione importante va registrata con:
- data
- contesto
- opzioni valutate
- decisione presa
- motivazione
- impatto su scope/tempo/rischio

Formato consigliato:

```txt
Date:
Topic:
Options:
Decision:
Why:
Impact:
```

## 9) Change Control (Scope)

Se cambia il perimetro MVP:
1. aggiorna prima il documento di scope
2. aggiorna backlog e milestone
3. rivalida KPI e rischi

Nessuna implementazione fuori scope senza questo passaggio.

## 10) Convenzioni di Naming

- Branch: `feature/<nome-breve>` o `fix/<nome-breve>`
- Feature ID: `F-###`
- Bug ID: `B-###`
- Build: `major.minor.patch+build`

Regola:
- Usa lo stesso ID in codice, backlog e note release.

## 11) Backlog Unico

Il backlog deve avere almeno:
- ID
- titolo
- priorita' (P1/P2/P3)
- stato (TODO/DOING/DONE/BLOCKED)
- owner
- criterio di accettazione

Non gestire task critici solo in chat.

## 12) Cadence di Review

Review settimanale obbligatoria:
- progresso KPI
- bug blocker aperti
- scostamento da piano
- rischi nuovi
- decisioni da prendere

Output review:
- lista azioni della settimana successiva (max 5 prioritarie)

## 13) Regole Anti-Drift tra Tool

- Se due strumenti danno risposte diverse:
  1. scegli in base ai vincoli documentati
  2. registra la decisione nel Decision Log
  3. aggiorna template prompt per evitare ripetizione del conflitto

- Se manca chiarezza:
  - riduci scope
  - definisci un esperimento corto (1-2 giorni)
  - misura risultato con KPI

## 14) Enforcement Minimo

Prima di chiudere ogni settimana verifica:
- [ ] Documentazione aggiornata
- [ ] Backlog aggiornato
- [ ] Gate fase rispettati
- [ ] Decision Log aggiornato
- [ ] Prossime 5 priorita' definite

