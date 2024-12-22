extends CharacterBody2D


@export 
var SPEED = 300.0


func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	
	self.velocity = SPEED * direction
	
	move_and_slide()

func _input(event):
	# below code is disgusting btw
	if Input.is_action_pressed("ui_left"):
		$Icon/AnimationPlayer.play("walk_left")
	elif Input.is_action_pressed("ui_right"):
		$Icon/AnimationPlayer.play("walk_right")
	elif Input.is_action_pressed("ui_up"):
		$Icon/AnimationPlayer.play("walk_up")
	elif Input.is_action_pressed("ui_down"):
		$Icon/AnimationPlayer.play("walk_down")

	elif Input.is_action_just_released("ui_left"): 
		$Icon/AnimationPlayer.play("idle_left")
	elif Input.is_action_just_released("ui_right"):
		$Icon/AnimationPlayer.play("idle_right")
	elif Input.is_action_just_released("ui_up"):
		$Icon/AnimationPlayer.play("idle_up")
	elif Input.is_action_just_released("ui_down"):
		$Icon/AnimationPlayer.play("idle_down")
		
	if event is InputEventMouseButton and event.is_pressed():
		const BULLET = preload("res://bullet.tscn")
		var new_bullet = BULLET.instantiate()
		new_bullet.global_position = self.global_position
		new_bullet.global_rotation = self.get_global_transform_with_canvas().get_origin().direction_to(event.position).angle()
		
		self.add_sibling(new_bullet)
