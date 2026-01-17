extends Node
# Game State
var is_game_over: bool
var max_timer_value = 20.0
var initial_time = 20.0

func _process(_delta: float) -> void:
	if is_game_over:
		game_over.emit()
		get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")


# Signals emitted
signal game_over
