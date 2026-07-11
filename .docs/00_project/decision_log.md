# DECISION LOG

Date: 2026-06-30
Topic: Baseline del branch corrente
Options: descrivere il progetto come gia' bootstrapato | descrivere solo cio' che esiste nel branch
Decision: la documentazione del branch corrente deve riflettere solo i file e lo stato realmente presenti qui, trattando il repo come baseline documentale pronta al bootstrap tecnico.
Why: evita drift tra documentazione e contenuto reale del branch.
Impact: README, TDD, execution, QA e build process devono descrivere un progetto pianificato e pronto all'implementazione, non un runtime gia' committato.

Date: 2026-04-27
Topic: Scope
Decision: Gioco breve 2–4h
Why: compatibile con tempo

Date: 2026-04-28
Topic: Architettura
Decision: Scene-based + Autoload
Why: riduce complessità

Date: 2026-04-28
Topic: Engine
Options: Godot 4.x, Unity, GameMaker
Decision: Godot 4.x
Why: coerente con architettura scene-based + autoload e adatto a un MVP veloce
Impact: progetto tecnico, build pipeline e struttura scene allineati a Godot 4.x

Date: 2026-04-28
Topic: Linguaggio
Options: GDScript, C#
Decision: GDScript
Why: massima velocita' di iterazione per solo dev e integrazione naturale con Godot
Impact: scripting, naming e backlog tecnico standardizzati su GDScript

Date: 2026-04-28
Topic: Piattaforme target
Options: Windows only, Windows + mobile-ready architetturale
Decision: Windows (Steam) come target primario, mobile-ready solo a livello architetturale
Why: mantiene il focus di release senza introdurre scope di porting nell'MVP
Impact: input, UI e separazione logica devono evitare blocchi futuri per mobile
