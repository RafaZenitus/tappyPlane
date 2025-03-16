extends CharacterBody2D

class_name Tappy

signal on_plane_die

const GRAVITY: float = 1000.0
const POWER: float = -400.0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass     

func _physics_process(delta: float) -> void:
	fly(delta)
	move_and_slide() #move_and_slide is already multiplied by delta 
	
	if is_on_floor() == true:
		die()

func fly(delta: float) -> void:
	velocity.y += GRAVITY * delta
	animated_sprite_2d.play("power") #helice animação
	
	if Input.is_action_just_pressed("jump") == true:
		velocity.y = POWER
		animation_player.play("RESET")
		animation_player.play("jump") #rotação animação
		
func die() -> void:
	animated_sprite_2d.stop()
	set_physics_process(false)
	on_plane_die.emit()
