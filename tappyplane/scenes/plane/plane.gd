extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

const GRAVITY: float = 1000.0
const POWER: float = -400.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass     

func _physics_process(delta: float) -> void:
	
	velocity.y += GRAVITY * delta
	
	fly()
	
	move_and_slide() #move_and_slide is already multiplied by delta 
	if is_on_floor() == true:
		die()

func fly() -> void:
	if Input.is_action_just_pressed("jump") == true:
		velocity.y = POWER
		animation_player.play("RESET")
		animation_player.play("power")
		
func die() -> void:
	animated_sprite_2d.stop()
	set_physics_process(false)
