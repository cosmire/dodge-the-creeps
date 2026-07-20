# Dodge the Creeps — Architecture

A complete 2D arcade survival game in Rust — movement, enemy spawning, scoring, and HUD, wired through gdext.

## Shape

Two trees that mirror each other:

- `rust/src/` — one file per system, each registering its own Godot class
- `godot/` — the scenes those classes attach to

`lib.rs` does registration and nothing else. There is no god-object holding
the game together; each system owns its own state.

## Modules

| File | Responsibility |
|---|---|
| `player.rs` | Player input, movement, animation, and the hit signal |
| `mob.rs` | Enemy spawn behaviour and off-screen cleanup |
| `main_scene.rs` | Game loop: start, spawn timing, score, game over |
| `hud.rs` | Score display, messages, and the start button |

## How Rust and Godot connect

1. `cargo build` compiles `rust/` into a shared library.
2. `godot/rust.gdextension` tells Godot where that library is and which entry
   symbol to call.
3. Godot loads it at startup and the `#[derive(GodotClass)]` types become real
   node classes usable in the editor.

If you move the crate or rename it, update `rust.gdextension` to match — that
file is the whole bridge.

## Pinned versions

Godot 4.5.2, Rust 1.90.0, gdext `410580d477fe`.

These are pinned *together* as one tested combination. gdext is pre-1.0 and
moves quickly; an unpinned build changes under you without warning. CI verifies
this exact combination weekly.
