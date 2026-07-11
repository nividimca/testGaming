# AI Tool Playbook (Solo Dev)

Questo file indica quale strumento AI usare in ogni fase del progetto, se lavori da solo.

## Principio Base

- Usa **1 tool primario per fase** (evita di mescolare tutto insieme).
- Mantieni **1 fonte di verita'** (repo).
- Ogni fase deve produrre un output concreto prima di passare alla successiva.

## Fase 0 - Setup Strategico

Tool consigliato: **ChatGPT**

Perche':
- E' veloce per chiarire obiettivi, vincoli e tradeoff.

Usalo per:
- Definire obiettivo progetto in 1 frase.
- Definire vincoli numerici (tempo, budget, ore/settimana).

Output minimo:
- `Project Charter` (1 pagina).

## Fase 1 - Definizione Gioco

Tool consigliato: **ChatGPT** (primario) + **Codex** (review finale)

Perche':
- ChatGPT e' ottimo in divergenza/convergenza creativa.
- Codex e' utile per rendere il risultato "eseguibile" nel repo.

Usalo per:
- High concept, target player, core loop, fail/win.
- MVP <= 10 feature, non-fare-ora, KPI.

Output minimo:
- `Game One-Pager`
- `MVP Scope`
- `KPI Sheet`

## Fase 2 - Pre-Produzione Tecnica

Tool consigliato: **Codex**

Perche':
- Serve tradurre il design in struttura tecnica reale e backlog implementabile.

Usalo per:
- Architettura moduli.
- Strategia input abstraction (keyboard/controller/touch-ready).
- Build pipeline Windows.
- Backlog tecnico priorizzato.

Output minimo:
- `Technical Design Doc`
- backlog ordinato per priorita'.

## Fase 3 - Vertical Slice

Tool consigliato: **Codex**

Perche':
- Qui conta esecuzione continua su codice, test, integrazione.

Usalo per:
- Implementare loop completo, UI base, stato game over/restart.
- Ridurre bug blocker e chiudere task.

Output minimo:
- Build Windows giocabile (internal playtest).

## Fase 4 - Steam Readiness

Tool consigliato: **Codex** + **ChatGPT** (copy store page)

Perche':
- Codex automatizza packaging/checklist scriptabili.
- ChatGPT aiuta su descrizioni store, tagline, copy marketing.

Usalo per:
- Versioning, packaging, QA checklist.
- Bozze descrizione Steam (poi rifinite da te).

Output minimo:
- Release Candidate + checklist QA chiusa.

## Fase 5 - Playtest e Iterazione

Tool consigliato: **Codex** (triage) + **ChatGPT** (sintesi feedback)

Perche':
- Codex trasforma bug in task tecnici.
- ChatGPT aiuta a sintetizzare feedback qualitativi.

Usalo per:
- Triage per severita'/impatto.
- Piano patch ordinato.

Output minimo:
- patch backlog con priorita' chiare.

## Fase 6 - Mobile-Ready Track (parallelo)

Tool consigliato: **Codex**

Perche':
- Richiede audit tecnico continuo, non brainstorming.

Usalo per:
- Verificare dipendenze desktop-only.
- Mantenere separazione logica/input/UI.

Output minimo:
- `Mobile Readiness Report` aggiornato ogni sprint.

## Regole Anti-Caos (Solo Dev)

- Non chiedere lo stesso compito a 3 AI diverse nello stesso momento.
- Se ChatGPT propone una scelta tecnica, falla validare da Codex sul codice reale.
- Se Codex propone scope troppo ampio, riportalo a MVP con KPI.
- Ogni decisione finale va salvata in file (`.docs/`), non solo in chat.

## Default Rapido (Quando sei in dubbio)

- Design e product thinking: **ChatGPT**
- Codice, refactor, build, test, release automation: **Codex**
- Copy store e comunicazione: **ChatGPT**
