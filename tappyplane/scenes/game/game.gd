extends Node2D

const PIPES = preload("res://scenes/pipes/pipes.tscn")

@onready var spawn_u: Marker2D = $SpawnU
@onready var spawn_l: Marker2D = $SpawnL
@onready var spawn_timer: Timer = $SpawnTimer
@onready var pipes_holder: Node = $PipesHolder

func _ready() -> void:
	spawn_pipes()

func _process(delta: float) -> void:
	pass
	
func spawn_pipes() -> void:
	var new_pipes: Pipes = PIPES.instantiate()
	var ypos: float = randf_range(
		spawn_u.position.y, #min y
		spawn_l.position.y #max y
		)
	new_pipes.position = Vector2(spawn_l.position.x, ypos)
	pipes_holder.add_child(new_pipes)

func _on_spawn_timer_timeout() -> void:
	spawn_pipes()


func _on_plane_die() -> void:
	get_tree().paused = true
