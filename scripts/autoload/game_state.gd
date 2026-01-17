extends Node
# Game State
var is_game_over: bool

func _process(delta: float) -> void:
	if is_game_over:
		game_over.emit()
		get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")


# Signals emitted
signal game_over
