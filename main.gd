extends Node

@export var mob_scene: PackedScene
var score

func _ready():
	var screen_size = get_viewport().get_visible_rect().size
	var curve = Curve2D.new()
	curve.add_point(Vector2.ZERO)
	curve.add_point(Vector2(screen_size.x, 0))
	curve.add_point(screen_size)
	curve.add_point(Vector2(0, screen_size.y))
	curve.add_point(Vector2.ZERO)
	$MobPath.curve = curve
	$Player.hide()
	$HUD.focusStartButton()  
	
	

func game_over():
	$ScoreTimer.stop()
	$HUD.show_game_over()
	$MobTimer.stop()
	$DeathSound.play()

func new_game():
	score = 0
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")
	$Player.start($StartPosition.position)
	$StartTimer.start()
	get_tree().call_group("mobs", "queue_free")
	$Player.show()	
	#$MobTimer.start()
	

func _on_mob_timer_timeout():
	# Create a new instance of the Mob scene.
	var mob = mob_scene.instantiate()

	# Choose a random location on Path2D.
	var mob_spawn_location = $MobPath/MobSpawnLocation
	mob_spawn_location.progress_ratio = randf()

	# Set the mob's position to the random location.
	mob.position = mob_spawn_location.global_position

	# Set the mob's direction perpendicular to the path direction.
	var direction = mob_spawn_location.rotation + PI / 2

	# Add some randomness to the direction.
	direction += randf_range(-PI / 4, PI / 4)
	mob.rotation = direction

	# Choose the velocity for the mob.
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)

	# Spawn the mob by adding it to the Main scene.
	add_child(mob)


func _on_score_timer_timeout():
	score += 1
	$HUD.update_score(score)

func _on_start_timer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()
