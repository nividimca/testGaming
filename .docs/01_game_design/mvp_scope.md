# MVP SCOPE

## In Scope

1. Movimento del player
2. Shooting del player
3. Un encounter boss-based come centro del loop
4. Pattern offensivi leggibili
5. Collisioni e danno minimi
6. Stato di run minimo: start, gameplay, vittoria o game over, restart
7. Build locale `Windows` verificabile

## Out of Scope

- piu' arene o livelli completi
- piu' boss
- narrativa estesa o cutscene
- save system completo
- settings avanzati e rebinding completo
- audio, VFX e polish finale
- touch controls reali
- porting mobile

## Regola di scope

Ogni aggiunta che non rafforza direttamente il loop `muoviti -> schiva -> colpisci -> sopravvivi` va considerata fuori MVP fino a decisione esplicita.

## Criteri di accettazione MVP

L'MVP e' credibile quando:

- il player puo' muoversi, schivare e colpire in modo leggibile
- il boss genera una pressione reale tramite pattern
- il loop ha un esito chiaro e riavviabile
- il progetto puo' essere avviato e preparato per una build Windows locale
