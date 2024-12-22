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
		
	if Input.is_action_just_released("ui_left") or Input.is_action_just_released("ui_down") or Input.is_action_just_released("ui_up") or Input.is_action_just_released("ui_right"):
		$Icon/AnimationPlayer.play("walk_left")
		#add idle animation here
