extends Area2D

@export
var SPEED = 300

func _physics_process(delta: float) -> void:
	var direction = Vector2.RIGHT.rotated(self.global_rotation)
	position += delta * SPEED * direction
