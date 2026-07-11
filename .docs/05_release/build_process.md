# BUILD PROCESS

## Obiettivo

Definire il percorso minimo per ottenere una build locale `Windows` del progetto senza introdurre scope extra.

## Stato del branch corrente

Su questo branch il runtime non e' ancora committato.
Questo documento descrive quindi il processo da eseguire non appena il bootstrap tecnico esiste.

## Prerequisiti locali

- `Godot 4.x` installato
- export templates installati
- progetto bootstrapato e apribile da `project.godot`

## File attesi prima del primo export

- `project.godot`
- scena principale configurata
- eventuale `export_presets.cfg`
- cartella `build/windows/`

## Procedura minima

1. Aprire il progetto in `Godot 4.x`
2. Verificare che la scena principale sia impostata correttamente
3. Controllare autoload `GameManager` e `InputManager`
4. Aprire `Project > Export`
5. Creare o verificare il preset `Windows Desktop`
6. Impostare output in `build/windows/Dark Punchline.exe`
7. Eseguire export debug locale

## Gate di verifica

La procedura e' valida se:

- il progetto si apre senza ricreare file base
- il preset Windows punta a un output locale coerente
- l'eseguibile viene generato o l'unico blocco residuo dipende da prerequisiti macchina

## Cosa fare se qualcosa manca

- se manca `project.godot`: tornare al backlog tecnico
- se manca il preset: configurarlo e documentare il passaggio
- se mancano export templates: installarli prima di ritentare

## Limiti noti

- packaging Steam non incluso in questo branch
- automazione release non inclusa nell'MVP iniziale
- nessuna promessa di export riuscito finche' il bootstrap tecnico non e' committato
