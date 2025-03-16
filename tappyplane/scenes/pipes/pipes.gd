extends Node2D

class_name Pipes

const SPEED: float = 120.0
const OFF_SCREEN: float = 100.0

func _process(delta: float) -> void:
	position.x -= SPEED * delta
	
func check_off_screen() -> void:
	#if position.x < -500.0:
	if position.x < get_viewport_rect().position.x - OFF_SCREEN:
		die()
		
func die() -> void:
	queue_free()
	set_process(false)
	
func _on_screen_exited() -> void:
	set_process(false)
	queue_free()


func _on_pipe_body_entered(body: Node2D) -> void:
	if body is Tappy:
		body.die()
