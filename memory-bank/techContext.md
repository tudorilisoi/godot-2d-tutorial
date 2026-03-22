# Technology Context

## Technologies Used

### Core Technologies

#### Godot Engine

- **Version**: 4.x (as specified in `project.godot`, specifically targeting Forward Plus renderer)
- **Purpose**: Primary game engine for 2D development
- **Features**: Node-based architecture, GDScript, visual scene editor
- **Physics**: Configured to use Jolt Physics (noted in settings)

#### GDScript

- **Purpose**: Primary scripting language for game logic
- **Characteristics**: Python-like syntax, tight engine integration

### Asset Management

#### Image Assets
- **Format**: PNG
- **Optimization**: Configured for 2D pixel art (Nearest filtering)

#### Scene Files
- **Format**: `.tscn` (Textual scene format)

## Development Setup

### Project Structure
```
2d-tutorial/
├── project.godot          # Project configuration
├── *.gd                 # GDScript files
├── *.tscn              # Scene files
├── art/                # Image assets
└── memory-bank/        # Documentation
```

### Configuration

#### project.godot
- **Input Map**: `move_up`, `move_down`, `move_left`, `move_right` (Arrows/WASD)
- **Display**: Window stretch mode set to `canvas_items`

## Technical Constraints

### Performance
- **Linear Velocity**: Using `RigidBody2D` for mobs offloads movement calculations to the physics engine.
- **Deferred Calls**: Using `set_deferred` for physics property changes during callbacks to avoid crashes.

## Tool Usage Patterns

- **Built-in Debugger**: Used for tracking logic and error reporting.
- **Remote Scene Tree**: Vital for inspecting dynamically spawned mobs during runtime.
