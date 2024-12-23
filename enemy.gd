extends CharacterBody2D


## NOT ACTUALLY A CONSTANT, LOOK AT _ready
@export
var SPEED = 150.0

@export
var MAX_HEALTH = 100

var health = MAX_HEALTH

@onready
var player: CharacterBody2D = get_node("/root/MainLevel/Player")

func _ready() -> void:
	add_to_group("Enemies")
	
	# enemies spawn slightly faster as there are more of them
	SPEED = SPEED + 5. * get_tree().get_node_count_in_group("Enemies")
	print("SPEED:", SPEED)

func _physics_process(delta: float) -> void:
	var player_direction = global_position.direction_to(player.global_position)
	
	self.velocity = SPEED * player_direction
	
	move_and_slide()
	
func _process(delta: float) -> void:
	if (global_position.direction_to(player.global_position).x<0):
		$Sprite2D/AnimationPlayer.play("walk_left")
	else:
		$Sprite2D/AnimationPlayer.play("walk_right")
	
func take_damage(damage: float) -> void:
	health -= damage
	
	# damage sound effect
	const DAMAGE_SOUND_EFFECT = preload("res://assets/Enemy Damaged.wav")
	$AudioStreamPlayer2D.stream = DAMAGE_SOUND_EFFECT
	$AudioStreamPlayer2D.play()
	
	if health <= 0:
		self.queue_free() # self destruct
		# TODO: Score
		
		# death sound effect
		# doesn't actually work because this object gets removed (sad)
		const DEATH_SOUND_EFFECT = preload("res://assets/Explode.wav")
		$AudioStreamPlayer2D.stream = DEATH_SOUND_EFFECT
		$AudioStreamPlayer2D.play()
