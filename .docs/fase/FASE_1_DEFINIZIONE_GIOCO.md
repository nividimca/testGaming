# FASE 1 — DEFINIZIONE GIOCO

## High Concept
Un gioco arcade in cui il giocatore controlla un'entità colorata che combatte boss incarnazioni del "black humor", schivando attacchi e sopravvivendo a pattern sempre più intensi mentre il mondo guadagna colore.

## Target Player
- Giocatori casual/indie
- Amanti di giochi arcade veloci
- Sessioni brevi (10–30 min)

---

## Core Loop
Muoviti → schiva attacchi → colpisci il boss → sopravvivi → nuova fase → difficoltà aumenta

---

## Meccanica Principale
- Movimento fluido del player (arcade, senza inerzia)
- Schivata di proiettili (pattern-based)
- Attacco automatico

---

## Twist
- Il mondo guadagna colore progressivamente mentre il giocatore avanza
- Più colore = più caos visivo e difficoltà
- Il contrasto colore/oscurità rappresenta il progresso
- Ogni boss parte da un'atmosfera cupa e perde controllo mentre il mondo recupera colore tra le fasi

---

## Struttura Boss
- Ogni boss ha 2–3 fasi
- Ogni boss ha 4 beat di dialogo principali
- Prima di ogni fase:
  - battuta black humor
- Ogni fase:
  - pattern diverso
  - variazione spazio/movimento
- Inizio boss:
  - atmosfera cupa
  - senso di controllo del boss sul mondo
- Transizione di fase:
  - il mondo guadagna colore
  - aumenta il caos percepito
  - il boss appare piu' instabile, aggressivo e vicino al collasso
- Beat dialogici minimi:
  - dialogo iniziale
  - dialogo di passaggio alla fase successiva
  - dialogo di passaggio alla fase finale
  - dialogo finale come esclamazione di vittoria, crollo o chiusura

---

## Gameplay Details

### Player
- Movimento: immediato (no inerzia)
- Attacco: auto-fire
- HP: 3–5 hit

### Pattern Attacco (MVP)
1. Radiale
2. Mirato
3. Wave

---

## Sistema Colore
- Inizio: colori bassi
- Avanzamento: colori aumentano
- Effetto:
  - maggiore caos visivo
  - maggiore difficoltà percepita
  - maggiore pathos nello scontro col boss
- Regola boss:
  - il guadagno di colore tra le fasi segnala perdita di controllo del boss
  - il colore non va letto come semplice power-up del nemico

---

## Spazio di Gioco
- Non riduzione estrema (mobile-ready)
- Riduzione leggera solo nelle fasi avanzate
- Pressione ottenuta tramite:
  - densità proiettili
  - velocità
  - pattern

---

## Difficoltà

- Easy → -30% velocità proiettili
- Normal → base
- Hard → +30% velocità
- Chaos → +50% velocità + caos visivo

---

## TUTORIAL (FASE 0)

Obiettivo:
- Insegnare movimento e schivata
- Introdurre tono (black humor)
- Preparare al fallimento

Struttura:
- Spazio ampio
- Pattern semplice iniziale
- Dopo pochi secondi → attacco inevitabile

Evento:
- Morte forzata del player

Feedback:
- Nessuna punizione
- Restart immediato

Messaggio:
- Battuta del boss (black humor)
- Dialogo specifico immediatamente prima della morte forzata

Regole:
- Deve essere chiaro che è intenzionale
- Durata < 45 secondi
- Nessuna frustrazione

---

## ESPERIENZA PRIMI 5 MINUTI

Minuto 0–1:
- Tutorial
- Movimento base
- Morte forzata

Minuto 1–3:
- Inizio reale gioco
- Pattern evitabili

Minuto 3–5:
- Aumento difficoltà
- Primo fallimento reale

Obiettivo:
- Comprensione gioco < 2 minuti
- Accettazione del fallimento

---

## MVP (max 10 feature)

1. Movimento player
2. Sistema sparo
3. 1 boss (3 fasi)
4. 3 pattern attacco
5. Sistema vita
6. UI base
7. Transizioni fase
8. Battute pre-fase
9. Game over + restart
10. Audio base

---

## MVP LOCK

Questa lista rappresenta lo scope congelato per la versione iniziale.

Non sono permesse aggiunte senza:
- aggiornare scope
- aggiornare backlog
- aggiornare decision log

---

## KPI

- Il giocatore capisce il gioco in < 2 minuti
- Sessione ≥ 15–20 minuti
- Nessun bug blocker

---

## Rischi

1. Gameplay non abbastanza divertente
2. Pattern poco leggibili
3. Scope creep

---

## Anti-Scope

- Multiplayer
- Open world
- Skill tree complessi
- Grafica avanzata custom
- Mobile nativo

---

## FASE 1 DONE CRITERIA

- Core loop spiegabile in <20 secondi
- Gameplay definito
- 1 boss completo progettato
- MVP ≤ 10 feature definito
- Anti-scope definito
- KPI definiti

Status: DONE
