# FASE 2 — BOOTSTRAP TECNICO

## Stato
**DONE**

## Obiettivo
Trasformare il repository in un progetto `Godot 4.x + GDScript` avviabile, versionabile e coerente con l'MVP definito in Fase 1.

## Scopo della fase

- creare il bootstrap tecnico minimo del gioco
- fissare struttura cartelle e scene base
- mantenere `Windows (Steam)` come target primario
- preservare mobile-readiness solo a livello architetturale
- preparare il terreno alla vertical slice di Fase 3

## In Scope

- progetto Godot apribile da zero
- `project.godot` valido
- preset export Windows base
- autoload `GameManager`
- autoload `InputManager`
- scene e script minimi per `Player`, `Boss`, `Bullet`, `PatternSystem`
- loop giocabile minimo con movimento, firing, pattern e collisioni
- documentazione tecnica operativa

## Out of Scope

- contenuto finale
- UI finale
- audio e VFX completi
- sistemi narrativi
- piu' boss o piu' arene
- save system
- porting mobile reale
- integrazione Steamworks

## Deliverable

- struttura tecnica base del progetto
- scena principale eseguibile
- gameplay loop MVP minimo
- build path Windows preparato
- documentazione tecnica di riferimento

## Vincoli permanenti

- architettura scene-based
- manager globali via autoload
- nessuna entity legge input diretto fuori da `InputManager`
- `PatternSystem` resta responsabile del firing del boss
- focus `Windows-first`
- mobile-readiness solo architetturale

## Regola boss in Fase 2

Anche se la Fase 2 e' principalmente tecnica, il bootstrap del boss deve restare coerente con il progetto:

- il boss non e' un nemico generico
- il boss rappresenta il `Black Humor`
- il boss deve essere predisposto come entita' attiva, non come bersaglio passivo
- la futura grammatica atmosferica resta valida: inizio cupo, colore che cresce tra le fasi

## Criteri di uscita

La Fase 2 e' chiusa quando:

1. il progetto Godot si apre correttamente
2. la scena principale e' avviabile
3. il player si muove e spara
4. il boss e' presente e riceve danno
5. il `PatternSystem` genera attacchi del boss
6. le collisioni minime funzionano
7. il percorso verso export Windows e' preparato
8. la documentazione tecnica e' sufficiente per iniziare Fase 3

## Documento di riferimento

Per il dettaglio tecnico completo, la fonte principale di questa fase e':

- `.docs/02_technical/technical_design_doc.md`

Status: DONE
