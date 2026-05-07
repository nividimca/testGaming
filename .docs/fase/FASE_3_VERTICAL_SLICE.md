# FASE 3 — VERTICAL SLICE

## Stato
**IN CORSO**

## Obiettivo
Rendere la prima vertical slice del progetto coerente con il conflitto centrale:

**Player vs Black Humor**

## Scopo della fase

- trasformare il bootstrap tecnico in una prima esperienza giocabile completa
- collegare incipit, morte forzata e scontro reale
- far emergere il boss come entita' attiva e intenzionale
- rendere verificabili vittoria, game over e restart
- usare la `tutorial arena` come prima arena completa della slice

## In Scope

- tutorial/incipit breve con morte forzata chiara
- una sola arena
- un solo boss
- tre fasi riconoscibili
- HUD runtime minimo
- struttura dati minima per i dialoghi del boss tutorial
- tuning di player, boss e pattern
- escalation leggibile della pressione
- build interna di playtest
- raccolta di note e bug dai test

## Out of Scope

- nuovi boss
- nuove arene
- contenuti oltre il tutorial boss
- dialoghi estesi o cutscene complesse
- UI finale
- audio e VFX completi
- refactor architetturali
- touch controls reali

## Regola atmosferica della fase

La vertical slice deve applicare in modo esplicito la grammatica dei boss del progetto:

- il boss inizia in un'atmosfera cupa
- tra una fase e l'altra il mondo guadagna colore
- il recupero di colore aumenta caos e pathos
- il cambiamento segnala che il boss sta perdendo controllo
- il boss non deve sembrare semplicemente piu' forte, ma piu' instabile e disperato

## Regola dialoghi della fase

Per la Fase 3 il tutorial non e' considerato chiuso finche' i dialoghi previsti del boss tutorial non sono anche integrati e verificabili a runtime.

Interpretazione operativa:

- e' in scope preparare file dati e beat minimi dei dialoghi
- e' in scope integrare i dialoghi del boss tutorial nel flow reale della slice
- non e' in scope espandere il progetto in una pipeline narrativa ampia
- l'obiettivo e' chiudere un tutorial completo, non solo predisposto a livello dati

## Struttura della slice

La fase e' composta da due momenti consecutivi:

1. incipit/tutorial breve
2. scontro reale nella `tutorial arena`

## Requisiti chiave

- il player deve capire subito il conflitto col `Black Humor`
- il boss deve esercitare pressione intenzionale sul player
- ogni fase deve avere una funzione leggibile
- la difficolta' deve crescere come pressione e caos controllato, non solo come aumento numerico
- il mondo deve reagire allo scontro in modo leggibile tra le fasi

## Tutorial Arena

La scena di riferimento della slice e':

- `res://src/scenes/main/main.tscn`

La `tutorial arena` e' il contenitore unico della Fase 3 e il riferimento operativo per i playtest interni.

## Criteri di uscita

La Fase 3 potra' considerarsi chiusa quando:

1. la run non parte automaticamente
2. l'incipit introduce movimento, schivata e morte forzata chiara
3. lo scontro reale parte subito dopo in modo comprensibile
4. il boss presenta tre fasi distinguibili
5. i dialoghi del boss tutorial sono presenti, leggibili e verificabili nei beat previsti
6. vittoria e game over sono verificabili
7. il restart e' verificabile
8. la slice e' usabile come base di playtest interni

## Documenti di riferimento

Per il dettaglio operativo completo, le fonti principali di questa fase sono:

- `.docs/03_execution/phase_3_plan.md`
- `.docs/03_execution/tutorial_arena_slice.md`

Status: IN CORSO
