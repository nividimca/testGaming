---
name: godot-mvp-task
description: Use when the user wants Codex to implement, modify, or verify a concrete Godot 4.x + GDScript task in this repository while staying inside the documented MVP, architecture, and acceptance criteria.
---

# Godot MVP Task

Use this skill for implementation work in `/Users/mihai/testGaming`.

## Scope

- Godot 4.x
- GDScript
- Windows-first
- Mobile-ready only at the architectural level
- One concrete task at a time

## Required workflow

1. Read the minimum relevant project docs before changing anything:
   - `AGENTS.md`
   - `.docs/02_technical/technical_design_doc.md`
   - `.docs/02_technical/backlog_technical.md`
   - any narrower `.docs/` file directly related to the task
2. Restate the task in implementation terms:
   - target behavior
   - files or systems likely involved
   - acceptance criteria
3. If the request is too broad, split it into smaller sequential tasks before coding.
4. Respect the fixed architecture:
   - scene-based project
   - autoload managers
   - gameplay logic separated from input
   - input routed through `InputManager`
5. Do not add extra features, polish, or speculative systems outside the requested task.
6. Keep changes minimal and local to the requested behavior.
7. After implementation, verify the task against its acceptance criteria and report any remaining gap clearly.

## Guardrails

- Do not change architecture unless the user explicitly asks and the decision is documented.
- Do not expand scope beyond MVP.
- Do not bypass `InputManager` with direct gameplay input reads.
- Do not introduce desktop-only assumptions into core gameplay logic.
- Do not turn one task into a full refactor.

## Preferred behavior

- Prefer practical implementation over long planning once the task is clear.
- When information is missing but the risk is low, make the smallest reasonable assumption and state it.
- When information is missing and the risk is high, stop and ask one focused question.
- If the repo is still missing the Godot project structure, create only the minimum structure needed for the requested task.

## Output expectations

- Implement the requested task.
- Keep the response concise.
- Mention touched files.
- State whether acceptance criteria were met, partially met, or blocked.
