# AGENTS GUIDE

- Scene-based
- Autoload manager
- No over-engineering
- Input solo via InputManager

## Gameplay Intent (Non-Technical Constraint)

Il sistema di gioco deve riflettere il conflitto:

**Player vs Black Humor**

Questo implica:

* I boss NON sono nemici generici
* Ogni pattern deve essere leggibile ma “ingiusto” in modo controllato
* Gli attacchi devono trasmettere pressione e caos crescente

Il codice NON deve trattare i boss come semplici target:
devono essere progettati come entità che “attaccano” il player con intenzione.
