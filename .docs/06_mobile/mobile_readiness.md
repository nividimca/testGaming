# MOBILE READINESS

## Stato

Target secondario solo architetturale.
Nessun porting mobile e' incluso nell'MVP del branch corrente.

## Obiettivo

Evitare decisioni tecniche che rendano costoso o impossibile un porting futuro.

## Vincoli da rispettare

- gameplay logic separata dall'input layer
- nessuna dipendenza hard da hover o mouse-only
- UI leggibile e adattabile a schermi piccoli
- input commands compatibili con un futuro mapping touch
- nessuna dipendenza desktop-only nel core loop

## Checklist tecnica minima

### Input

- tutti i comandi passano da `InputManager`
- nessuna entity dipende da click puntuale come unico input

### UI

- HUD leggibile anche a dimensioni ridotte
- testi e feedback non affidati solo al cursore mouse

### Gameplay

- nessuna logica vincolata a precisione mouse-only
- stati di run gestibili anche con input semplificato

### Build e asset

- il core loop non dipende da servizi desktop esterni
- asset e scena non assumono solo aspect ratio desktop ampio

## Regola di progetto

Windows resta il solo target di build e release iniziale.
Ogni nuova feature va comunque verificata contro questo audit architetturale.

## Uscita corretta

La mobile-readiness e' accettabile quando non emergono blocchi architetturali critici per un futuro layer touch o per una UI piu' compatta.
