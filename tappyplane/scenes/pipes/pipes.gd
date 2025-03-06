extends Node2D

class_name Pipes

const SPEED: float = 120.0

func _process(delta: float) -> void:
	position.x -= SPEED * delta
	
func check_off_screen() -> void:
	if position.x < -500.0:
		queue_free()

func _on_screen_exited() -> void:
	queue_free()
