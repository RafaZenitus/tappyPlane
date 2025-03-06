extends Node2D

const SPEED: float = 100.0

func _process(delta: float) -> void:
	position.x -= SPEED * delta

func _on_screen_exited() -> void:
	queue_free()
