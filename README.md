# Dodge the Creeps

A complete 2D arcade survival game in Rust — movement, enemy spawning, scoring, and HUD, wired through gdext.

A **Cosmire Template** — open source, and verified to build.

## Versions

| | |
|---|---|
| Godot | 4.5.2 |
| Rust | 1.94.0 |
| gdext | `410580d477fe` |

Pinned together as one tested combination, rebuilt weekly by CI. The badge on
this repo reflects a real build, not a claim.

## Get started

Clone it:
```
git clone https://github.com/cosmire/dodge-the-creeps.git
cd dodge-the-creeps/rust && cargo build
```
Then open the `godot/` folder in Godot 4.5.2.

Or scaffold it under your own name (requires `cargo-generate`):
```
cargo generate --git https://github.com/cosmire/dodge-the-creeps.git
```
Both routes produce the same project.

## Layout

- `rust/` — game logic, one module per system
- `godot/` — scenes and assets
- `docs/architecture.md` — why it is shaped this way
- `docs/context.md` — the same, structured for coding agents

## Licensing

Rust source derives from the [godot-rust demo projects](https://github.com/godot-rust/demo-projects)
and is **MPL-2.0**. The Godot project and art derive from Godot's own demo,
**MIT** (Copyright (c) 2017 KidsCanCode). See `LICENSE` and `NOTICE`.

MPL-2.0 is file-level copyleft: modified MPL files stay MPL with source
available. This template may not be relicensed under MIT.
