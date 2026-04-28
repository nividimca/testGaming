# TECHNICAL DESIGN DOC

## Stack
- Engine: Godot 4.x
- Linguaggio: GDScript
- Target primario: Windows (Steam)
- Vincolo secondario: mobile-ready solo a livello architetturale

## Architettura
- GameManager (autoload)
- InputManager (autoload)
- Player, Boss, Bullet, PatternSystem

## Struttura tecnica
- Progetto scene-based
- Manager globali via autoload
- Logica gameplay separata dall'input
- UI progettata per poter sostituire input mouse/keyboard con touch senza riscrivere il core loop

## Input Strategy
- Tutto l'input passa da `InputManager`
- Nessuna logica gameplay legge input diretto da `Player` o da altre entity
- Mapping previsto per keyboard/controller su Windows
- Astrazione mantenuta compatibile con un layer touch futuro

## Windows Build Goal
- Progetto avviabile da zero in Godot 4.x
- Export preset Windows configurabile per build locale
- Struttura minima giocabile per validare il gate di Fase 2

## Constraints
- Architettura NON modificabile
- Input sempre astratto
- Nessuna dipendenza desktop-only hard nel core gameplay
- Nessuna feature extra fuori MVP

## Goal
Build funzionante da zero
