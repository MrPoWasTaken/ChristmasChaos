extends CharacterBody2D


@export 
var SPEED = 300.0


func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	
	self.velocity = SPEED * direction
	
	move_and_slide()
