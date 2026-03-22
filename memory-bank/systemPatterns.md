# System Patterns

## System Architecture

This is a Godot Engine 2D tutorial project following standard Godot project structure and best practices.

### Project Structure

```
2d-tutorial/
├── project.godot              # Main project configuration
├── main.tscn                  # Main game scene
├── main.gd                    # Main game logic (spawning, state)
├── player.tscn                # Player scene definition
├── player.gd                  # Player movement and animation logic
├── mob.tscn                   # Enemy mob scene definition
├── mob.gd                     # Mob randomization and cleanup
├── art/                      # 2D art assets
└── memory-bank/             # Project documentation
```

## Key Technical Decisions

### Architecture Pattern: Node-Based Scene System

- **Rationale**: Godot's core architectural pattern, promotes modularity and reusability.
- **Implementation**: 
    - `Main`: Root node managing the game lifecycle.
    - `Player`: Specialized scene for user control.
    - `Mob`: Instantiable scene for enemies.

### Design Patterns in Use

- **Signal Pattern**: Decouples systems (e.g., `Player` emits `hit`, `Main` responds).
- **Timer-Based Logic**: `Main` uses timers for spawning and scoring rather than complex `_process` logic.
- **Composition**: Scenes are composed of specialized nodes (`AnimatedSprite2D`, `CollisionShape2D`, `VisibleOnScreenNotifier2D`).

## Component Relationships

### Player System
```
Player (Area2D)
├── AnimatedSprite2D (Animations: "walk", "up")
├── CollisionShape2D (Hitbox)
└── player.gd (Input and movement)
```

### Mob System
```
Mob (RigidBody2D)
├── AnimatedSprite2D (Randomized visuals)
├── CollisionShape2D (Hitbox)
├── VisibleOnScreenNotifier2D (Off-screen detection)
└── mob.gd (Behavior)
```

### Main System
```
Main (Node)
├── Player (Player instance)
├── MobPath/MobSpawnLocation (Path2D for spawning)
├── MobTimer (Spawn frequency)
├── ScoreTimer (Score increment)
├── StartTimer (Initial delay)
└── main.gd (Game controller)
```

## Critical Implementation Paths

### Player Movement
1. Detect input via `Input.is_action_pressed`.
2. Normalize velocity and multiply by speed.
3. Update position and `clamp` to screen size.
4. Select animation based on movement direction.

### Mob Spawning
1. `MobTimer` timeout triggers instantiation of `Mob.tscn`.
2. Random point selected on `MobPath`.
3. Direction set perpendicular to path with slight random offset.
4. `linear_velocity` set to move mob across screen.

### Game Loop
1. `new_game()` initializes score and player position.
2. `hit` signal from player triggers `game_over()`.
3. Timers controlled by game state (start/stop).

## Development Workflow

1. **Scene Isolation**: Developing and testing `Player` and `Mob` scenes independently.
2. **Signal Wiring**: Connecting node signals in the editor or via code for loose coupling.
3. **Iterative Polish**: Adding spawning, then scoring, then UI (planned).
