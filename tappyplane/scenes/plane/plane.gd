extends CharacterBody2D

const GRAVITY: float = 300.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass 



func _physics_process(delta: float) -> void:
	
	velocity.y += GRAVITY #* delta
	
	move_and_slide() #move_and_slide is already multiplied by delta 
