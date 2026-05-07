# TUTORIAL ARENA SLICE

## Scopo

Questo documento formalizza la `tutorial arena` come primo livello completo della vertical slice di Fase 3.

La scena di riferimento e':

- `res://src/scenes/main/main.tscn`

La `tutorial arena` non rappresenta un livello finale del gioco, ma la prima slice giocabile completa usata per validare:

- movimento
- shooting
- boss
- pattern
- game over
- vittoria
- restart

## Ruolo nella Fase 3

All'interno della Fase 3, la `tutorial arena` e':

- il contenitore unico del tutorial boss
- la prima arena completa della slice
- il punto di ingresso dei playtest interni
- la base minima per verificare il vertical slice senza contenuti extra

## Composizione della scena

La scena contiene:

- `Player`
- `Boss`
- `PatternSystem`
- HUD runtime minimo
- overlay di stato per ingresso run, vittoria e game over
- dati di dialogo del boss tutorial salvati fuori dalla logica di scena

Il bootstrap della slice parte in stato `BOOT` e non avvia il gameplay automaticamente.

## Flusso della run

Sequenza prevista:

1. la scena mostra la schermata iniziale della slice
2. il giocatore preme `Invio` per iniziare
3. parte un incipit breve in cui il `Player` apprende movimento e schivata sotto pressione controllata
4. poco prima della morte forzata, il boss pronuncia un dialogo specifico che rende il fallimento chiaramente intenzionale
5. l'incipit si chiude con una morte forzata chiaramente intenzionale
6. subito dopo parte lo scontro reale della `tutorial arena`
7. il `Boss` propone tre fasi progressive di tutorial e scandisce lo scontro con dialoghi brevi di fase
8. la run termina con:
   - `Vittoria` quando il boss viene sconfitto
   - `Game Over` quando il player viene sconfitto
9. il giocatore puo' premere `R` per riavviare la scena

## Obiettivo della tutorial arena

La `tutorial arena` deve insegnare e verificare il loop base:

- introdurre il conflitto `Player vs Black Humor`
- muoversi in uno spazio leggibile
- leggere traiettorie e ritmo dei proiettili
- sopravvivere al primo impatto sapendo che la morte iniziale e' parte del tutorial
- riconoscere il passaggio tra le tre fasi del boss
- riconoscere i beat di dialogo che scandiscono incipit, fasi e chiusura
- mantenere pressione offensiva sul boss
- comprendere chiaramente esito e restart della run

## Regole di design

- una sola arena
- un solo boss
- nessun contenuto extra oltre il tutorial boss
- leggibilita' prioritaria rispetto alla densita'
- il boss deve apparire come entita' attiva, non come bersaglio passivo
- tra una fase e l'altra l'arena deve reagire al cedimento del boss in modo semplice e leggibile
- il mondo deve recuperare colore progressivamente, senza far sembrare il boss semplicemente piu' potente
- il boss tutorial deve avere dialoghi brevi e riconoscibili prima dell'incipit fatale e nei tre beat principali dello scontro
- HUD e overlay devono servire alla verifica, non al polish finale
- la slice deve essere giocabile anche senza audio o UI finale

## Progressione del mondo tra le fasi

Nella `tutorial arena`, il cambiamento del mondo tra una fase e l'altra deve restare minimale ma intenzionale.

Direzione da mantenere:

- Fase 1: arena piu' spenta, stabile, con il boss percepito in controllo
- Fase 2: primi segnali di colore e instabilita', come incrinatura del dominio del boss
- Fase 3: arena piu' viva, piu' carica e piu' caotica, come effetto del collasso del controllo del boss

Interpretazione corretta:

- il mondo non cambia per decorazione
- il mondo cambia perche' lo scontro `Player vs Black Humor` altera l'arena
- il pathos nasce dal fatto che il boss sta perdendo controllo mentre tenta ancora di schiacciare il player

## Regole di implementazione

- `InputManager` resta l'unico punto di contatto per l'input
- `PatternSystem` resta responsabile del firing del boss
- la scena non deve dipendere da sistemi esterni non presenti nel repo
- i dialoghi del boss tutorial vanno salvati in una risorsa dati dedicata, non hardcodati direttamente nel flow della scena
- i comportamenti temporanei di test sono ammessi solo se documentati e se non falsano i gate della slice

## Boundary dell'arena

Per la Fase 3, il viewport della scena corrente coincide con il boundary dell'arena.

Interpretazione operativa:

- il `Player` resta clampato nel viewport
- i proiettili vengono puliti fuori viewport
- il `Boss` occupa la fascia alta della scena
- il `Player` occupa e difende la fascia bassa

Questa struttura e' sufficiente per considerare la scena una prima arena completa della slice.

## Criteri di verifica

La `tutorial arena` e' considerata formalizzata e valida quando:

1. la scena `main.tscn` e' il punto di ingresso della slice
2. la run non parte automaticamente
3. il dialogo pre-morte forzata del boss tutorial e' visibile e comprensibile nel flow iniziale
4. i dialoghi di fase e chiusura del boss tutorial sono visibili e comprensibili nel flow reale dello scontro
5. la run termina con `Vittoria` o `Game Over`
6. il restart e' verificabile
7. il boss presenta tre fasi chiaramente distinguibili
8. HP player e boss sono leggibili a runtime
9. la scena puo' essere usata come riferimento nei playtest interni

## Cosa non implica

Formalizzare la `tutorial arena` non implica ancora:

- menu finale di produzione
- arena art finale
- audio finale
- piu' livelli
- piu' boss
- pacing definitivo dell'intero gioco

## Prossimo uso operativo

Da questo punto in poi, ogni playtest di Fase 3 deve riferirsi esplicitamente alla `tutorial arena` come primo livello completo della slice.
