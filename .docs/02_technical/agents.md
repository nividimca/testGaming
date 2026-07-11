# AGENTS GUIDE

## Obiettivo

Tradurre game design e backlog in task tecnici Godot piccoli, verificabili e coerenti con l'MVP.

## Regole permanenti

- progetto scene-based
- manager globali solo via autoload
- input solo via `InputManager`
- niente over-engineering
- un task tecnico per volta
- nessun cambio architetturale senza decision log

## Convenzioni di implementazione

- una responsabilita' chiara per scena o script
- logica gameplay separata da HUD e input
- niente dipendenze plugin non documentate
- ogni cambiamento rilevante aggiorna `.docs/00_project/project_log.md`

## Convenzioni di review

Quando un task e' chiuso bisogna verificare:

- coerenza con MVP
- coerenza con `technical_design_doc.md`
- assenza di feature extra
- aggiornamento minimo di backlog e log
