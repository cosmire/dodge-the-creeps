# Dodge the Creeps — Agent Context

Structured description of this codebase for coding agents. Prose version:
`architecture.md`.

## Project type
2D game, Godot 4.5+ with Rust logic via gdext (GDExtension).
Rust compiles to a cdylib; Godot loads it through `godot/rust.gdextension`.

## Layout
- `rust/src/*.rs` — one module per system; each defines one `#[derive(GodotClass)]` type
- `rust/src/lib.rs` — registration only. Do not add game logic here.
- `godot/*.tscn` — scenes matching the Rust classes
- `godot/rust.gdextension` — library paths and entry symbol

## Modules
| `player.rs` | Player input, movement, animation, and the hit signal |
| `mob.rs` | Enemy spawn behaviour and off-screen cleanup |
| `main_scene.rs` | Game loop: start, spawn timing, score, game over |
| `hud.rs` | Score display, messages, and the start button |

## Invariants
- Each module owns its own state. Do not reach across modules directly; use
  signals or explicit calls through node references.
- `lib.rs` stays free of game logic.
- Library paths in `rust.gdextension` are relative to `godot/` and point into
  `rust/target/`. Renaming the crate requires updating them.
- Versions are pinned deliberately (see below). Do not "upgrade to latest" as a
  side effect of another change.

## Pinned versions
- Godot 4.5.2
- Rust 1.90.0
- gdext rev `410580d477fe150e12fd9649cf5ab12a800a1884`

## Where to add things
- New gameplay system → new file in `rust/src/`, register it in `lib.rs`, add a
  matching scene in `godot/`.
- New behaviour on an existing system → that system's own module.

## Build
```
cd rust && cargo build
```
Then open `godot/` in Godot 4.5.2.
