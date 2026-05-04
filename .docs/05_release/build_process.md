# BUILD PROCESS

## Obiettivo

Preparare ed eseguire una build locale `Windows (Steam)` del progetto Godot senza modificare l'architettura del repo.

## Stato Fase 2

In Fase 2 il repository deve essere solo:

- apribile da zero in Godot 4.x
- configurato con `main_scene`
- predisposto con un preset Windows base

La generazione effettiva dell'eseguibile richiede prerequisiti locali che possono non essere disponibili nell'ambiente Codex.

## Prerequisiti locali

- Godot `4.x` installato
- export templates Godot installati
- apertura del progetto dal file `project.godot`

## Struttura attesa

- `project.godot`
- `export_presets.cfg`
- output build in `build/windows/`

## Procedura locale minima

1. aprire il progetto in Godot 4.x
2. verificare che `main.tscn` sia la scena principale
3. controllare autoload `GameManager` e `InputManager`
4. aprire `Project > Export`
5. verificare o ricreare il preset `Windows Desktop`
6. impostare output in `build/windows/testGaming.exe`
7. eseguire export debug locale

## Gate di verifica

La build preparation e' corretta se:

- il progetto si apre senza dover creare un nuovo project file
- il preset Windows punta a un percorso locale coerente
- il repo non richiede refactor per l'export desktop

## Limiti noti

- export non verificabile senza engine e templates disponibili sulla macchina
- packaging Steam non incluso in Fase 2
