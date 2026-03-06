# Godot Core Template

> A reusable, extensible 2D/3D game foundation built in Godot 4.6.
> Designed to serve as a solid base for future projects — survival RPGs, action games, or anything in between.

---

## 🛠️ Tech Stack

| | |
|---|---|
| **Engine** | Godot 4.6 (Steam) |
| **Style** | 2D (isometric-ready) |
| **Renderer** | Mobile (expandable) |
| **Language** | GDScript |
| **Version Control** | Git/GitHub |

---

## 📁 Project Structure

```
res://
├── assets/
│   ├── audio/
│   │   ├── music/
│   │   ├── sfx/
│   │   └── default_bus_layout.tres
│   ├── fonts/
│   └── sprites/
│       ├── tiles/
│       ├── player/
│       ├── enemies/
│       ├── items/
│       └── ui/
├── src/
│   ├── player/
│   ├── combat/
│   ├── inventory/
│   ├── world/
│   ├── ui/
│   ├── systems/
│   └── data/
├── scenes/
│   ├── player/
│   ├── world/
│   ├── ui/
│   └── enemies/
├── resources/
│   ├── items/
│   ├── weapons/
│   └── skills/
└── autoloads/
```

---

## 🗺️ Roadmap

### 🔵 Phase 1 — Core Architecture
- [ ] EventBus autoload (global signal routing)
- [ ] GameManager autoload (scene management, global state)
- [ ] Entity base class (root of all game objects)
- [ ] CharacterBase class (movement, stats — extends Entity)
- [ ] Hitbox / Hurtbox components (reusable combat skeleton)
- [ ] Base Resource structures (StatData, ItemData stubs)

### 🟡 Phase 2 — Gameplay Foundation
- [ ] Player controller (input, movement, camera)
- [ ] Basic combat (melee, health, death)
- [ ] Inventory system (slot/grid-based)
- [ ] UI framework (HUD, menus, scene transitions)
- [ ] Day-night cycle (world clock + dynamic lighting)

### 🔴 Phase 3 — Extension Layer *(project-specific)*
- [ ] Crafting / Building system
- [ ] Skill trees / Progression
- [ ] Procedural world generation
- [ ] Quests / Dialogue system
- [ ] Survival mechanics (hunger, thirst, needs)

> Phase 3 represents features to be added per-project on top of this template.

---

## ⚙️ Project Settings

| Setting | Value |
|---|---|
| Viewport | 1280 × 720 |
| Stretch Mode | `canvas_items` |
| Stretch Aspect | `keep` |
| Snap 2D Vertices to Pixel | `ON` |

---

## 🎛️ Physics Layers

| Layer | Name |
|---|---|
| 1 | `world` |
| 2 | `player` |
| 3 | `enemies` |
| 4 | `items` |
| 5 | `hitbox` |
| 6 | `hurtbox` |

---

## 🔊 Audio Buses

| Bus | Purpose |
|---|---|
| Master | Global output |
| Music | Background tracks |
| SFX | World & combat sounds |
| UI | Interface sounds |

---

## 🌿 Branching Strategy

| Branch | Purpose |
|---|---|
| `main` | Stable milestone snapshots |
| `dev` | Active development |
| `feature/xxx` | Per-feature work, merged into `dev` |

---

## 📜 License

_TBD_