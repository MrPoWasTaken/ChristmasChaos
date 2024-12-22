extends Area2D


@export
var SPEED = 300

@export
var RANGE = 2000

var traveled_distance = 0

func _physics_process(delta: float) -> void:
	var direction = Vector2.RIGHT.rotated(self.global_rotation)
	position += delta * SPEED * direction
	
	traveled_distance += delta * SPEED
	if traveled_distance > RANGE:
		queue_free() # self destruct


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemies"):
		body.take_damage()
		self.queue_free() # self destruct
