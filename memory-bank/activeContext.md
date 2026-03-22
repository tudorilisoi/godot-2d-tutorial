# Active Context

## Current Work Focus

Implementing core game mechanics including mob spawning, score tracking, and game state management in the `Main` scene.

## Recent Changes

- Created memory-bank directory structure and core documentation
- Implemented `Player` movement, animation, and hit detection in `player.gd`
- Implemented `Mob` behavior with random animations and screen-exit cleanup in `mob.gd`
- Implemented `Main` scene logic for spawning mobs, tracking score, and handling game start/over transitions
- Configured input map for player movement (arrows/WASD)
- Integrated Jolt Physics for 3D (as seen in `project.godot`, though the project is 2D)

## Next Steps

1. Implement User Interface (UI) for score display, start button, and game over messages
2. Add sound effects and background music
3. Refine collision layers and masks for better interaction control
4. Implement game pause and restart functionality
5. Polish visual effects (e.g., player hit feedback)

## Active Decisions and Considerations

- **Area2D vs KinematicBody2D**: Using `Area2D` for the player to simplify collision detection for this beginner tutorial.
- **RigidBody2D for Mobs**: Using `RigidBody2D` for mobs to leverage built-in physics for linear velocity movement.
- **Signal-Driven Architecture**: Using signals (`hit` from Player, timers from Main) to decouple core systems.

## Learnings and Project Insights

- Using `set_deferred("disabled", true)` on collision shapes is necessary when modifying physics state during a collision callback.
- `RigidBody2D` with `linear_velocity` provides a simple way to move enemies in a straight line without manual position updates.
- Randomization of mob types and spawn locations adds variety to the gameplay loop.

## Current Status

- Memory bank infrastructure: 100% complete
- Core Game Systems: 70% complete (Movement, Spawning, Hit Detection done)
- Project analysis: Ongoing documentation of newly added components
- Technical documentation: Updating with `Main` and `Mob` architecture
