extends Node2D

@export
var SPAWN_COOLDOWN = 1
var last_spawned = 0

@export
var SPAWN_RADIUS_MIN = 800
@export
var SPAWN_RADIUS_MAX = 1000

func _physics_process(delta: float) -> void:
	if last_spawned >= SPAWN_COOLDOWN:
		# spawn
		const ENEMY = preload("res://enemy.tscn")
		var enemy = ENEMY.instantiate()
		enemy.global_position = self.global_position
		enemy.global_position += randf_range(SPAWN_RADIUS_MIN, SPAWN_RADIUS_MAX) * Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
		get_tree().root.add_child(enemy)
		last_spawned = 0
	
	last_spawned += delta
	
