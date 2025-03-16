extends Control

const GAME = preload("res://scenes/game/game.tscn")

#func _input(event: InputEvent) -> void:
	#if event.is_action_pressed("jump") and event.is_echo() == false:
		#print("_inpnut: ", event)
		#get_viewport().set_input_as_handled()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump") and event.is_echo() == false:
		#print("_unhandled_input: ", event)
		get_tree().change_scene_to_packed(GAME)

func _ready() -> void:
	pass # Replace with function body.






#NÃO É RECOMENDADO PARA USAR EM MENUS 
#func _process(delta: float) -> void:
	#pass
pass
