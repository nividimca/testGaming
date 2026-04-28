# MOBILE READINESS

## Stato
Target secondario solo architetturale. Nessun porting mobile incluso nell'MVP.

## Vincoli da rispettare
- Gameplay logic separata dall'input layer
- Nessuna dipendenza hard da mouse hover
- UI leggibile e adattabile a schermi piccoli
- Input commands compatibili con un futuro mapping touch
- Nessuna dipendenza desktop-only nel core loop

## Impatto sul progetto
- Windows resta il solo target di build e release iniziale
- Le decisioni tecniche devono evitare blocchi futuri per porting mobile
- Ogni nuova feature va valutata anche per compatibilita' architetturale mobile
