# Godot-Cluade-Template

> 2D Isometric Survival RPG Template built in Godot 4.6 by using HELP from Claude

---

## 🛠️ Tech Stack

| | |
|---|---|
| **Engine** | Godot 4.6 (Steam) |
| **Style** | 2D Isometric |
| **Renderer** | Mobile(for now) |
| **Language** | GDScript |
| **Version Control** | Git/Github |

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

### 🔵 Phase 1 — The Core Loop
- [ ] Player movement (isometric 8-directional)
- [ ] Basic combat (melee hit detection, health, death)
- [ ] Inventory system (slot/grid-based, item data via Resources)
- [ ] Day-night cycle (world clock + dynamic lighting)

### 🟡 Phase 2 — Depth Systems
- [ ] Crafting / Building (recipe system tied to inventory)
- [ ] Weapon crafting flexibility (modular weapon data: base + materials)
- [ ] Skill trees / Progression (XP, stat nodes)
- [ ] Weapon enchantments & improvements (enchant slots, rarity, upgrade paths)
- [ ] Player characteristics (stackable modifier system — buffs/debuffs, trinkets, blessings/curses)

### 🔴 Phase 3 — World & Advanced Systems
- [ ] Hunger / Thirst / Needs (timer-based stat drain)
- [ ] Open world / Exploration — Procedural generation (chunk-based tilemap)
- [ ] Quests / Dialogue (dialogue trees, quest state machine)

---
## Tips for myself

### ⚙️ Project Settings

| Setting | Value |
|---|---|
| Viewport | 1280 × 720 |
| Stretch Mode | `canvas_items` |
| Stretch Aspect | `keep` |
| Snap 2D Vertices to Pixel | `ON` |

### Physics Layers

| Layer | Name |
|---|---|
| 1 | `world` |
| 2 | `player` |
| 3 | `enemies` |
| 4 | `items` |
| 5 | `hitbox` |
| 6 | `hurtbox` |

### Audio Buses

| Bus | Purpose |
|---|---|
| Master | Global output |
| Music | Background tracks |
| SFX | World & combat sounds |
| UI | Interface sounds |

### 🌿 Branching Strategy

| Branch | Purpose |
|---|---|
| `main` | Stable milestone snapshots |
| `dev` | Active development |
| `feature/xxx` | Per-feature work, merged into `dev` |

---

## 📜 License

_TBD_
