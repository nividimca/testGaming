# Steam Game Checklist (Windows First, Mobile-Ready)

Usa questa checklist per avanzare fase per fase. Non passare alla fase successiva senza chiudere i gate.

## 0) Setup Strategico

- [ ] Obiettivo progetto scritto in 1 frase
- [ ] Budget definito (EUR)
- [ ] Ore/settimana disponibili definite
- [ ] Data target demo definita
- [ ] Data target release definita
- [ ] Priorita' chiarite: qualita'/tempo/costo
- [ ] `Project Charter` creato (1 pagina)

Gate fase:
- [ ] Vincoli numerici chiari e condivisi

## 1) Definizione Gioco (Fase 1)

- [ ] High concept (max 2 frasi)
- [ ] Target player definito
- [ ] Core loop definito (azione -> feedback -> rischio -> ricompensa)
- [ ] Condizioni di vittoria/fallimento definite
- [ ] MVP con max 10 feature
- [ ] Lista "Non fare ora" creata
- [ ] 3 KPI misurabili definiti
- [ ] Top 5 rischi + mitigazioni
- [ ] `Game One-Pager` completato

Gate fase:
- [ ] Core loop spiegabile in 20 secondi
- [ ] Scope MVP congelato

## 2) Pre-Produzione Tecnica

- [ ] Engine e stack scelti per Windows first
- [ ] Strategia mobile-ready definita (no dipendenze desktop-only hard)
- [ ] Architettura moduli documentata
- [ ] Strategia input astratto (keyboard/controller/touch-ready)
- [ ] Strategia UI responsive definita
- [ ] Save system progettato
- [ ] Logging/crash strategy definita
- [ ] `Technical Design Doc` completato
- [ ] Backlog tecnico priorizzato

Gate fase:
- [ ] Build Windows eseguibile in locale da zero

## 3) Vertical Slice

- [ ] Menu principale funzionante
- [ ] Gameplay core loop completo
- [ ] 1 livello/arena completa
- [ ] UI/HUD base funzionante
- [ ] Audio placeholder integrato
- [ ] Stato di game over/restart funzionante
- [ ] Onboarding/tutorial minimo presente
- [ ] Performance baseline accettabile su PC target
- [ ] Build "internal playtest" prodotta

Gate fase:
- [ ] 3 playtest completati senza bug blocker

## 4) Steam Readiness

- [ ] Packaging release Windows automatizzato
- [ ] Versioning build definito
- [ ] Checklist QA release completata
- [ ] Store asset list pronta (capsule, screenshot, descrizioni)
- [ ] Crash/blocker = 0
- [ ] Performance stabile nel target hardware
- [ ] Release Candidate creata

Gate fase:
- [ ] Pronto per submission/preview Steam

## 5) Soft Launch / Demo

- [ ] Demo/test build distribuita a tester
- [ ] Feedback raccolto in formato strutturato
- [ ] Bug triage fatto per priorita'
- [ ] Patch plan definito

Gate fase:
- [ ] KPI minimi demo raggiunti

## 6) Mobile-Ready Track (Parallelo)

- [ ] Logica gameplay separata da input layer
- [ ] UI non dipendente da hover/mouse-only
- [ ] Controlli touch candidati identificati
- [ ] Asset pipeline verificata per risoluzioni mobili
- [ ] Test periodico di readiness pianificato (ogni sprint)
- [ ] `Mobile Readiness Report` aggiornato

Gate fase:
- [ ] Nessun blocco architetturale critico per porting

## 7) Uso Multi-Tool (Regole Operative)

- [ ] Fonte unica di verita' scelta (`docs/` repo o Notion)
- [ ] Decisioni architetturali annotate in modo tracciabile
- [ ] Prompt ricorrenti salvati come template
- [ ] Ruoli tool separati:
- [ ] ChatGPT/Claude = ideazione, balancing, copy
- [ ] Codex = codice, test, integrazione, release scripts
- [ ] Tool esterni = art/audio/project tracking

Gate fase:
- [ ] Nessuna decisione critica lasciata solo in chat

