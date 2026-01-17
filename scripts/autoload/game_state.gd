extends Node
# Game State
var is_game_over: bool
var max_timer_value = 20.0
var initial_time = 20.0
var level = 0
var level_complete = false
var is_paused = false

func _process(_delta: float) -> void:
	if is_game_over:
		game_over.emit()
		get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")

func complete_level() -> void:
	level_complete = true
	level += 1
	pause()

func pause() -> void:
	is_paused = true
	get_tree().paused = true
	get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")

func unpause() -> void:
	is_paused = false
	get_tree().paused = false
	
# Signals emitted
signal game_over
