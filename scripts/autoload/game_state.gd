extends Node
# Game State
var is_game_over: bool
var max_timer_value = 20.0
var initial_time = 20.0
var level = 1
var level_complete = false
var is_paused = false
var is_puzzle_complete = false
var is_underground = false

# Saved state for underground transitions
var saved_city_position: Vector2 = Vector2.ZERO
var saved_city_time: float = 0.0

func _process(_delta: float) -> void:
	if is_game_over:
		game_over.emit()
		get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")

func complete_level() -> void:
	level_complete = true
	level += 1
	is_puzzle_complete = false
	pause()

func enter_undergound(player_position: Vector2 = Vector2.ZERO, time_left: float = 0.0) -> void:
	is_underground=true
	saved_city_position = player_position
	saved_city_time = time_left
	get_tree().change_scene_to_file("res://scenes/levels/underground.tscn")

func leave_underground():
	is_underground=false
	is_puzzle_complete = true
	get_tree().change_scene_to_file("res://scenes/levels/city.tscn")
	
func pause() -> void:
	is_paused = true
	get_tree().paused = true
	
func unpause() -> void:
	is_paused = false
	get_tree().paused = false
	
# Signals emitted
signal game_over
