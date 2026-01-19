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
var is_puzzle_showing = false
var is_player_movable = true
var show_time_bonus = false
var time_bonus_amount = 0.0

# Saved state for underground transitions
var saved_city_position: Vector2 = Vector2.ZERO
var saved_city_time: float = 0.0

func _process(_delta: float) -> void:
	if is_game_over:
		game_over.emit()
		get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")

func freeze_player():
	is_player_movable=false
func unfreeze_player():
	is_player_movable=true
	
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
	# Add 5 second bonus to timer
	var bonus = 5.0
	saved_city_time = min(saved_city_time + bonus, max_timer_value)
	# Flag to show bonus when scene loads
	show_time_bonus = true
	time_bonus_amount = bonus
	get_tree().change_scene_to_file("res://scenes/levels/city.tscn")
	
func pause() -> void:
	is_paused = true
	get_tree().paused = true
	
func unpause() -> void:
	is_paused = false
	get_tree().paused = false

func show_puzzle():
	is_puzzle_showing = true

func hide_puzzle():
	is_puzzle_showing = false
# Signals emitted
signal game_over
signal time_bonus_added(seconds: float)
