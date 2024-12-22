extends CharacterBody2D


@export 
var SPEED = 300.0


func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	
	self.velocity = SPEED * direction
	
	move_and_slide()

func _input(event):
	if Input.is_action_just_pressed("ui_left"):
		$Icon/AnimationPlayer.play("walk_left")
	elif Input.is_action_just_pressed("ui_right"):
		$Icon/AnimationPlayer.play("walk_right")
	elif Input.is_action_just_pressed("ui_up"):
		$Icon/AnimationPlayer.play("walk_up")
	elif Input.is_action_just_pressed("ui_down"):
		$Icon/AnimationPlayer.play("walk_down")

	elif Input.is_action_just_released("ui_left"): 
		$Icon/AnimationPlayer.play("idle_left")
	elif Input.is_action_just_released("ui_right"):
		$Icon/AnimationPlayer.play("idle_right")
	elif Input.is_action_just_released("ui_up"):
		$Icon/AnimationPlayer.play("idle_up")
	elif Input.is_action_just_released("ui_down"):
		$Icon/AnimationPlayer.play("idle_down")
