extends CharacterBody2D

@export
var SPEED = 150.0

@onready
var player: CharacterBody2D = get_node("/root/MainLevel/Player")

func _ready() -> void:
	add_to_group("Enemies")

func _physics_process(delta: float) -> void:
	var player_direction = global_position.direction_to(player.global_position)
	
	self.velocity = SPEED * player_direction
	
	move_and_slide()
	
	
func take_damage() -> void:
	print("Ouchies!")
